package com.jmu.service.admin.impl;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.dao.ProductMapper;
import com.jmu.domain.Product;
import com.jmu.domain.vo.ProductVo;
import com.jmu.service.admin.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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


    @Override
    public AjaxPageResponse findAll(ProductVo productVo, AjaxPageResponse page) {
        if(productVo.getCompanyId() != null){
            productMapper.selectAllByCompanyId(productVo,page);
        }
        return  page;
    }

    @Override
    public AjaxResponse saveProduct(Product product) {
        return null;
    }

    @Override
    public AjaxResponse deleteProduct(String[] productIds) {
        return null;
    }

    @Override
    public AjaxResponse updateProductState(ProductVo productVo) {
        return null;
    }

    @Override
    public AjaxResponse updateProduct(Product product) {
        return null;
    }

    @Override
    public List getProduct(String comapnyUrl) {
        return null;
    }

    @Override
    public Product findOne(String productId) {
        return null;
    }
}