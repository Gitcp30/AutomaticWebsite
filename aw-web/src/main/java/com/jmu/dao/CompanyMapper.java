package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.Company;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyMapper extends BaseMapper<Company> {

    public Company selectByVisitUrl(String visitUrl);

}