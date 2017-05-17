package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.common.AjaxPageResponse;
import com.jmu.domain.Company;
import com.jmu.domain.vo.CompanyVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyMapper extends BaseMapper<Company> {

    Company selectByVisitUrl(String visitUrl);

    List findAll(CompanyVo companyVo, AjaxPageResponse page);

    int batchDeleteByPrimaryId(String[] companyIds);

    int updateStateByPrimaryKey(CompanyVo companyVo);

}