package com.jmu.domain.vo;

import java.io.Serializable;

/**
 * @Description: 登录验证用户信息
 * @author: zhouzunrong
 * @create: 2017-04-23 11:02
 * @version: 1.0
 **/
public class LoginUSer implements Serializable{
    // 登录用户名
    private String loginName;
    // 验证码
    private String patchca;
    // 密码
    private String password;

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPatchca() {
        return patchca;
    }

    public void setPatchca(String patchca) {
        this.patchca = patchca;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}