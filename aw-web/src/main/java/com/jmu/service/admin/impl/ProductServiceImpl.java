package com.jmu.service.admin.impl;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.dao.CompanyMapper;
import com.jmu.dao.ProductMapper;
import com.jmu.domain.Company;
import com.jmu.domain.Product;
import com.jmu.domain.vo.ProductVo;
import com.jmu.service.admin.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @Description: 产品服务实现类
 * @author: zhouzunrong
 * @create: 2017-05-26 20:35
 * @version: 1.0
 **/
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private CompanyMapper companyMapper;


    @Override
    public AjaxPageResponse findAll(ProductVo productVo, AjaxPageResponse page) {
        if(productVo.getCompanyId() != null){
            productMapper.selectAllByCompanyId(productVo,page);
        }
        return  page;
    }

    @Override
    public AjaxResponse saveProduct(Product product) {
        product.setProductId(UUID.randomUUID().toString().replace("-", ""));
        productMapper.insertSelective(product);
        return AjaxResponse.success();
    }

    @Override
    public AjaxResponse deleteProduct(String[] productIds) {
        if(productIds!=null  && productIds.length>0){
            productMapper.batchDeleteByPrimaryKey(productIds);
            return  AjaxResponse.success();
        } else {
            return  AjaxResponse.fail("删除ID不存在");
        }
    }

    @Override
    public AjaxResponse updateProductState(ProductVo productVo) {
        if(productVo.getState() == null || productVo.getState() ==null){
            return AjaxResponse.fail("状态为空");
        }
        productMapper.updateStateByPrimaryKey(productVo);
        return AjaxResponse.success();
    }

    @Override
    public AjaxResponse updateProduct(Product product) {
        if(product.getProductId() != null){
            product.setModifyTime(new Date());
            productMapper.updateByPrimaryKeySelective(product);
            return AjaxResponse.success();
        } else{
            return  AjaxResponse.fail("产品id为空");
        }
    }

    @Override
    public List getProduct(String comapnyUrl) {
        if(comapnyUrl != null){
            Company company = companyMapper.selectByVisitUrl(comapnyUrl);
            if(company != null){
                return productMapper.selectByCompanyId(company.getCompanyId());
            }
        }
        return null;
    }

    @Override
    public Product findOne(String productId) {
        return null;
    }
}