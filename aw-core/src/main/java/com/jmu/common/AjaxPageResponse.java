/*
 * Copyright (c) 2015 xuerdongcom@126.com All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.jmu.common;

import com.google.common.collect.Maps;
import com.jmu.constant.ResponseCode;

import java.util.Map;

/**
 * @author xuerdong
 * @since 1.1
 */
public class AjaxPageResponse extends AjaxResponse {

	private int pageNumber = 1;
	private int pageSize = 20;
	private long total = 0l;
	private int totalPage = 0;

	private Map userData = Maps.newHashMap();

	public AjaxPageResponse() {
		super();
	}

	public AjaxPageResponse(String code) {
		super(code);
	}

	public AjaxPageResponse(String code, String message) {
		super(code, message);
	}

	/**
	 * 创建一个新的{@link AjaxPageResponse}，success为false
	 *
	 * @return
	 */
	public static AjaxResponse fail() {
		return fail(null);
	}

	/**
	 * 创建一个新的{@link AjaxPageResponse}，success为false
	 *
	 * @param message
	 *            消息
	 * @return
	 */
	public static AjaxPageResponse fail(String message) {
		return new AjaxPageResponse(ResponseCode.FAIL, message);
	}

	/**
	 * 创建一个新的{@link AjaxPageResponse}，success为true
	 *
	 * @return
	 */
	public static AjaxPageResponse success() {
		return success(null);
	}

	/**
	 * 创建一个新的{@link AjaxPageResponse}，success为true
	 *
	 * @param message
	 *            消息
	 * @return
	 */
	public static AjaxPageResponse success(String message) {
		return new AjaxPageResponse(ResponseCode.SUCCESS, message);
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public Map getUserData() {
		return userData;
	}

	public void setUserData(Map userData) {
		this.userData = userData;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

}
