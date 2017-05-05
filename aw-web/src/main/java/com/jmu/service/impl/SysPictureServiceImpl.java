package com.jmu.service.impl;

import com.jmu.dao.SysPictureMapper;
import com.jmu.service.SysPictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description: 图片管理实现类
 * @author: zhouzunrong
 * @create: 2017-05-04 21:31
 * @version: 1.0
 **/
@Service
public class SysPictureServiceImpl implements SysPictureService {

    @Autowired
    private SysPictureMapper sysPictureMapper;

    @Override
    public List getAll(String companyId) {
        return sysPictureMapper.selectByCompanyId(companyId);
    }
}