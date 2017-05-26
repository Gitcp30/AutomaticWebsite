package com.jmu.domain.vo;

import com.jmu.domain.Auditing;
import com.jmu.domain.User;

import java.util.Date;

/**
 * @Description: 用户扩展实体类
 * @author: zhouzunrong
 * @create: 2017-05-15 0:49
 * @version: 1.0
 **/
public class UserVo extends User {

    private Auditing auditing;

    private Date createTimeBegin;
    private Date createTimeEnd;

    private Date birthdayBegin;
    private Date birthdayEnd;

    private String[] userIds;

    private String companyUrl;

    public Auditing getAuditing() {
        return auditing;
    }

    public void setAuditing(Auditing auditing) {
        this.auditing = auditing;
    }

    public Date getCreateTimeBegin() {
        return createTimeBegin;
    }

    public void setCreateTimeBegin(Date createTimeBegin) {
        this.createTimeBegin = createTimeBegin;
    }

    public Date getCreateTimeEnd() {
        return createTimeEnd;
    }

    public void setCreateTimeEnd(Date createTimeEnd) {
        this.createTimeEnd = createTimeEnd;
    }

    public Date getBirthdayBegin() {
        return birthdayBegin;
    }

    public void setBirthdayBegin(Date birthdayBegin) {
        this.birthdayBegin = birthdayBegin;
    }

    public Date getBirthdayEnd() {
        return birthdayEnd;
    }

    public void setBirthdayEnd(Date birthdayEnd) {
        this.birthdayEnd = birthdayEnd;
    }

    public String getCompanyUrl() {
        return companyUrl;
    }

    public void setCompanyUrl(String companyUrl) {
        this.companyUrl = companyUrl;
    }

    public String[] getUserIds() {
        return userIds;
    }

    public void setUserIds(String[] userIds) {
        this.userIds = userIds;
    }
}