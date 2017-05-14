/*
 * Copyright (c) 2015 xuerdongcom@126.com All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.jmu.common;

import com.google.common.collect.Lists;
import com.jmu.constant.ResponseCode;

import java.util.List;

/**
 * zhouzunrong
 */
public class AjaxPageResponse extends AjaxResponse {

	// 第几页
	private int pageNumber = 1;
	// 每一页数量
	private int pageSize = 10;
	// 总页数
	private long total = 0l;
	// 查询数据
	private List rows = Lists.newArrayList();

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

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}
}
