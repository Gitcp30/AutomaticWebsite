package com.jmu.controller.Patchca;

import com.jmu.common.AjaxResponse;
import com.jmu.service.Patchca.PatchcaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * 验证码验证
 */
@Controller
@RequestMapping("/validatecode")
public class PatchcaController {

	@Autowired
	private PatchcaService patchcaService;

	/**
	 * 获取验证码图片
	 * @param width
	 * @param height
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public void patchca( @RequestParam(required = false, defaultValue = "90") int width,
			@RequestParam(required = false, defaultValue = "42") int height, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
		setResponseHeaders(response);
		patchcaService.getPatchca( width, height, response.getOutputStream(),session);
	}

	/**
	 *  ajax校验验证码
	 * @param patchca
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/validate")
	@ResponseBody
	public AjaxResponse patchcaValidation(@RequestParam("patchca") String patchca, HttpSession session) {
		boolean b = patchcaService.ajaxValidatePatchca(session, patchca);
		if(b){
			return  AjaxResponse.success();
		} else {
			return  AjaxResponse.fail("验证码错误！");
		}

	}

	private void setResponseHeaders(HttpServletResponse response) {
		response.setContentType("image/png");
		response.setHeader("Cache-Control", "no-cache, no-store");
		response.setHeader("Pragma", "no-cache");
		long time = System.currentTimeMillis();
		response.setDateHeader("Last-Modified", time);
		response.setDateHeader("Date", time);
		response.setDateHeader("Expires", time);
	}
}