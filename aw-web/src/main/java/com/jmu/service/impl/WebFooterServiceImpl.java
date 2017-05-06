package com.jmu.service.impl;

import com.jmu.dao.WebFooterMapper;
import com.jmu.domain.WebFooter;
import com.jmu.service.WebFooterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description: 底部栏服务类
 * @author: zhouzunrong
 * @create: 2017-05-06 2:06
 * @version: 1.0
 **/
@Service
public class WebFooterServiceImpl implements WebFooterService {

    @Autowired
    private WebFooterMapper webFooterMapper;

    @Override
    public WebFooter findByCompanyId(String companyId) {
        return webFooterMapper.selectByCompanyId(companyId);
    }


}