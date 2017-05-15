package com.jmu.domain.vo;

import com.jmu.domain.Company;

/**
 * @Description: 查询单位实体
 * @author: zhouzunrong
 * @create: 2017-05-14 14:48
 * @version: 1.0
 **/
public class CompanyVo extends Company {

    private Short[] companyStates;

    public Short[] getCompanyStates() {
        return companyStates;
    }

    public void setCompanyStates(Short[] companyStates) {
        this.companyStates = companyStates;
    }
}