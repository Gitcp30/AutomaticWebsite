package com.jmu.service.admin;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.domain.Product;
import com.jmu.domain.vo.ProductVo;

import java.util.List;

/**
 * Created by zzr on 2017/5/24.
 */
public interface ProductService {

    public AjaxPageResponse findAll(ProductVo productVo, AjaxPageResponse page);

    public AjaxResponse saveProduct(Product product);

    public AjaxResponse deleteProduct(String[] productIds);

    public AjaxResponse updateProductState(ProductVo productVo);

    public AjaxResponse updateProduct(Product product);

    public List getProduct(String comapnyUrl);

    public Product findOne(String productId);

}
