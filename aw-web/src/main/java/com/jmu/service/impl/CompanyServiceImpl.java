package com.jmu.service.impl;

import com.jmu.common.AjaxPageResponse;
import com.jmu.dao.CompanyMapper;
import com.jmu.domain.Company;
import com.jmu.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description: 公司服务实现类
 * @author: zhouzunrong
 * @create: 2017-05-07 18:37
 * @version: 1.0
 **/
@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyMapper companyMapper;

    @Override
    public Company findByUrl(String url) {
        return companyMapper.selectByVisitUrl(url);
    }

    @Override
    public AjaxPageResponse findAll(Company company , AjaxPageResponse pageResponse) {
        companyMapper.findAll(company,pageResponse);
        return pageResponse;
    }
}