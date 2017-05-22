/**
 * Copyright (c) 2005-2012
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.jmu.constant;

/**
 * 常量
 */
public class Constants {
    /**
     * 操作名称
     */
    public static String OP_NAME = "op";

    /**
     * 消息key
     */
    public static String MESSAGE = "message";

    /**
     * 错误key
     */
    public static  String ERROR = "error";

    public static String CONTEXT_PATH = "ctx";
    /**
     * 当前请求的地址 带参数
     */
    public static String CURRENT_URL = "currentURL";
    /**
     * 上个页面地址
     */
    public static String BACK_URL = "backURL";

    public static String IGNORE_BACK_URL = "ignoreBackURL";

    /**
     * 当前登录的用户
     */
    String CURRENT_USER = "user";
    String CURRENT_USERNAME = "username";

    String ENCODING = "UTF-8";

    /**
     * 树结构数据中parentids的分隔符
     */
    String TREE_DELIMITERS = "/";

    /**
     * 状态（0：正常，1：锁定 ，2:审核中 3：审核失败：4审核成功
     */
    public static Short STATE_NORMAL = 0;
    public static Short STATE_LOCK = 1;
    public static Short AUDITING_ING = 2;
    public static Short AUDITING_FAIL = 3;
    public static Short AUDITING_SUCCESS = 4;

    /**
     * 用户类型(0：员工，1：网站管理员，2：系统管理员）
     */
    public static Short USER_STAFF = 0;
    public static Short USER_WEB_ADMIN = 1;
    public static Short USER_SYS_ADMIN = 2;

    // 存储图片的物理路径String pic_path = "F:\\workspace\\upload_temp\\profile\\";
    public static String PIC_PATH = "F:\\workspace\\upload_temp\\profile\\";



}