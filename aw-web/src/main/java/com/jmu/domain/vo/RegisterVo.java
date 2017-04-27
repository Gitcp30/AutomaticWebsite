package com.jmu.domain.vo;

import com.jmu.domain.Company;
import com.jmu.domain.User;

import java.io.Serializable;

/**
 * @Description: 申请用户-公司实体类
 * @author: zhouzunrong
 * @create: 2017-04-27 14:53
 * @version: 1.0
 **/
public class RegisterVo implements Serializable{

    private User user;
    private Company company;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }
}