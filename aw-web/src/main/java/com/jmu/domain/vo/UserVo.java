package com.jmu.domain.vo;

import com.jmu.domain.Auditing;
import com.jmu.domain.User;

/**
 * @Description: 用户扩展实体类
 * @author: zhouzunrong
 * @create: 2017-05-15 0:49
 * @version: 1.0
 **/
public class UserVo extends User {

    private Auditing auditing;

    public Auditing getAuditing() {
        return auditing;
    }

    public void setAuditing(Auditing auditing) {
        this.auditing = auditing;
    }
}