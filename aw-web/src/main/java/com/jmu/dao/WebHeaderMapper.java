package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.WebHeader;
import org.springframework.stereotype.Repository;

@Repository
public interface WebHeaderMapper extends BaseMapper<WebHeader> {

        public WebHeader selectByComapnyId(String companyId);
}