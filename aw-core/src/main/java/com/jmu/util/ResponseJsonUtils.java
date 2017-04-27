/*
 * Copyright (c) 2015 xuerdongcom@126.com All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.jmu.util;

import com.alibaba.fastjson.JSON;
import com.jmu.common.AjaxResponse;
import org.springframework.web.context.request.NativeWebRequest;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 请求响应的json工具类
 * 
 * @author xuerdong
 * @since 1.1
 */
public class ResponseJsonUtils {

	public static boolean isJsonAccept(NativeWebRequest request) {
		if (request.getHeader("accept").indexOf("application/json") > -1 || (request.getHeader("X-Requested-With") != null && request.getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1)) {
			return true;
		}
		return false;
	}

	public static boolean isJsonAccept(HttpServletRequest request) {
		if (request.getHeader("accept").indexOf("application/json") > -1 || (request.getHeader("X-Requested-With") != null && request.getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1)) {
			return true;
		}
		return false;
	}

	public static void writeJSON(ServletResponse response, String json) {
		try {
			response.setContentType("application/json; charset=UTF-8");
			writeJSON(response.getWriter(), json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void writeJSON(PrintWriter wirter, String json) {
		wirter.print(json);
		wirter.flush();
		wirter.close();
	}

	public static void writeJSON(ServletResponse response, AjaxResponse json) {
		try {
			response.setContentType("application/json; charset=UTF-8");
			writeJSON(response.getWriter(), json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void writeJSON(PrintWriter wirter, AjaxResponse json) {
		wirter.print(JSON.toJSONString(json));
		wirter.flush();
		wirter.close();
	}

}
