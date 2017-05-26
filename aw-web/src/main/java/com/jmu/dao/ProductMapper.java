package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.common.AjaxPageResponse;
import com.jmu.domain.Product;
import com.jmu.domain.vo.ProductVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductMapper extends BaseMapper<Product> {

    int batchDeleteByCompanyId(String[] companyIds);

    List<Product> selectAllByCompanyId(ProductVo productVo, AjaxPageResponse page);


    int batchDeleteByPrimaryKey(String[] productIds);

    int updateStateByPrimaryKey(ProductVo productVo);

    List<Product> selectByCompanyId(String companyId);
}