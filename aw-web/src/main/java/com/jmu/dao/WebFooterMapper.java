package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.WebFooter;
import org.springframework.stereotype.Repository;

@Repository
public interface WebFooterMapper extends BaseMapper<WebFooter> {


    WebFooter selectByCompanyId(String companyId);

}