package com.jmu.domain.vo;

import com.jmu.domain.Product;

import java.util.Date;

/**
 * @Description: 产品扩展实体类
 * @author: zhouzunrong
 * @create: 2017-05-26 20:19
 * @version: 1.0
 **/
public class ProductVo extends Product {

    private String[] productIds;

    private Date createTimeBegin;
    private Date createTimeEnd;


    public String[] getProductIds() {
        return productIds;
    }

    public void setProductIds(String[] productIds) {
        this.productIds = productIds;
    }

    public Date getCreateTimeBegin() {
        return createTimeBegin;
    }

    public void setCreateTimeBegin(Date createTimeBegin) {
        this.createTimeBegin = createTimeBegin;
    }

    public Date getCreateTimeEnd() {
        return createTimeEnd;
    }

    public void setCreateTimeEnd(Date createTimeEnd) {
        this.createTimeEnd = createTimeEnd;
    }
}