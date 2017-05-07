package com.jmu.service.impl;

import com.jmu.dao.WebContentMapper;
import com.jmu.domain.WebContent;
import com.jmu.service.WebContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description: 网站内容服务类
 * @author: zhouzunrong
 * @create: 2017-05-07 11:01
 * @version: 1.0
 **/
@Service
public class WebContentServiceImpl implements WebContentService {

    @Autowired
    private WebContentMapper webContentMapper;

    @Override
    public List<WebContent> findContent(String columnId, String companyId) {
        return webContentMapper.selectByColumnId(columnId,companyId);
    }
}