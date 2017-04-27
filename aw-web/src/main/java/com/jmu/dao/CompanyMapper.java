package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.Company;

public interface CompanyMapper extends BaseMapper<Company> {

    public Company selectByVisitUrl(String visitUrl);

}