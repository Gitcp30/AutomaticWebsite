package com.jmu.interceptor;

import com.jmu.constant.Constants;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 设置通用数据
 * <p/>
 * <p/>
 * 1、ctx---->request.contextPath 2、currentURL---->当前URL 3、backURL---->当前URL
 * 
 * @author zhouzunrong
 * 
 */
public class SetCommonDataInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String path = request.getContextPath();
		String port = "";
		if (request.getServerPort() != 80)
			port = ":" + request.getServerPort();

		String basePath = request.getScheme() + "://" + request.getServerName() + port + path;

		if (request.getAttribute(Constants.CONTEXT_PATH) == null) {
			request.setAttribute(Constants.CONTEXT_PATH, basePath);
		}
		if (request.getAttribute(Constants.CURRENT_URL) == null) {
			request.setAttribute(Constants.CURRENT_URL, extractCurrentURL(request));
		}
		if (request.getAttribute(Constants.BACK_URL) == null) {
			request.setAttribute(Constants.BACK_URL, extractBackURL(request));
		}

		return true;
	}

	private String extractCurrentURL(HttpServletRequest request) {
		String url = request.getRequestURI();
		return getBasePath(request) + url;
	}

	/**
	 * 上一次请求的地址 1、先从request.parameter中查找BackURL 2、获取header中的 referer
	 * 
	 * @param request
	 * @return
	 */
	private String extractBackURL(HttpServletRequest request) {
		String url = request.getParameter(Constants.BACK_URL);
		if (StringUtils.isEmpty(url)) {
			url = request.getHeader("Referer");
		}

		if (!StringUtils.isEmpty(url) && (url.startsWith("http://") || url.startsWith("https://"))) {
			return url;
		}

		if (!StringUtils.isEmpty(url) && url.startsWith(request.getContextPath())) {
			url = getBasePath(request) + url;
		}
		return url;
	}

	private String getBasePath(HttpServletRequest req) {
		StringBuffer baseUrl = new StringBuffer();
		String scheme = req.getScheme();
		int port = req.getServerPort();

		baseUrl.append(scheme); // http, https
		baseUrl.append("://");
		baseUrl.append(req.getServerName());
		if ((scheme.equals("http") && port != 80) || (scheme.equals("https") && port != 443)) {
			baseUrl.append(':');
			baseUrl.append(req.getServerPort());
		}
		return baseUrl.toString();
	}

}
