package com.jmu.service.admin.impl;

import com.jmu.base.impl.BaseServiceImpl;
import com.jmu.dao.SysfunctionMapper;
import com.jmu.domain.Sysfunction;
import com.jmu.service.admin.FunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description: 功能服务类
 * @author: zhouzunrong
 * @create: 2017-04-22 1:30
 * @version: 1.0
 **/
@Service
public class FunctionServiceImpl extends BaseServiceImpl<Sysfunction> implements FunctionService {

    @Autowired
    private SysfunctionMapper functionMapper;
    @Autowired
    public void setBaseMapper(){
        super.setBaseMapper(functionMapper);
    }

}