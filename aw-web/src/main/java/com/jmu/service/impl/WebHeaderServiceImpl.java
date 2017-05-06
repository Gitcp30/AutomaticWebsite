package com.jmu.service.impl;

import com.jmu.dao.WebHeaderMapper;
import com.jmu.domain.WebHeader;
import com.jmu.service.WebHeaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description: 头部服务类
 * @author: zhouzunrong
 * @create: 2017-05-06 12:56
 * @version: 1.0
 **/
@Service
public class WebHeaderServiceImpl implements WebHeaderService {

    @Autowired
    private WebHeaderMapper webHeaderMapper;

    @Override
    public WebHeader findByCompanyId(String companyId) {
        return webHeaderMapper.selectByComapnyId(companyId);
    }
}