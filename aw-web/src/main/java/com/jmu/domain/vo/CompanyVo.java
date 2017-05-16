package com.jmu.domain.vo;

import com.jmu.domain.Company;

import java.util.Date;

/**
 * @Description: 查询单位实体
 * @author: zhouzunrong
 * @create: 2017-05-14 14:48
 * @version: 1.0
 **/
public class CompanyVo extends Company {

    private Short[] companyStates;

    private Date establishmentDateBegin;
    private Date establishmentDateEnd;

    private Date createTimeBegin;
    private Date createTimeEnd;



    public Short[] getCompanyStates() {
        return companyStates;
    }

    public void setCompanyStates(Short[] companyStates) {
        this.companyStates = companyStates;
    }

    public Date getEstablishmentDateBegin() {
        return establishmentDateBegin;
    }

    public void setEstablishmentDateBegin(Date establishmentDateBegin) {
        this.establishmentDateBegin = establishmentDateBegin;
    }

    public Date getEstablishmentDateEnd() {
        return establishmentDateEnd;
    }

    public void setEstablishmentDateEnd(Date establishmentDateEnd) {
        this.establishmentDateEnd = establishmentDateEnd;
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
}