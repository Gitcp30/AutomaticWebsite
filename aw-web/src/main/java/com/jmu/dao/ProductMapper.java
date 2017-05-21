package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.Product;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductMapper extends BaseMapper<Product> {

    int batchDeleteByCompanyId(String[] companyIds);
}