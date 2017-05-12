package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.common.AjaxPageResponse;
import com.jmu.domain.Company;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyMapper extends BaseMapper<Company> {

    Company selectByVisitUrl(String visitUrl);

    List findAll(Company company, AjaxPageResponse page);

}