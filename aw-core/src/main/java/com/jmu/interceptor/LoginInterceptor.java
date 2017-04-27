package com.jmu.interceptor;

import com.jmu.constant.Constants;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @Description: 登录验证拦截器
 * @author: zhouzunrong
 * @create: 2017-04-22 23:53
 * @version: 1.0
 **/
public class LoginInterceptor extends HandlerInterceptorAdapter {

    /**
     * 进入handler之前进行拦截
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //判断session
        HttpSession session  = request.getSession();
        //从session中取出用户身份信息
        //身份存在，放行
        if(session.getAttribute("currentUser") != null){
            return super.preHandle(request, response, handler);
        }
        //执行这里表示用户身份需要认证，跳转登陆页面
        String path = request.getContextPath();
        String port = "";
        if (request.getServerPort() != 80)
            port = ":" + request.getServerPort();
        String basePath = request.getScheme() + "://" + request.getServerName() + port + path;
        request.setAttribute(Constants.CONTEXT_PATH, basePath);
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        return false;
    }

}