package com.jmu.service.impl;

import com.google.common.collect.Collections2;
import com.google.common.collect.FluentIterable;
import com.jmu.common.AjaxResponse;
import com.jmu.dao.BaseSettingMapper;
import com.jmu.domain.BaseSetting;
import com.jmu.service.BaseSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description: 基础设置服务实现类
 * @author: zhouzunrong
 * @create: 2017-05-04 8:39
 * @version: 1.0
 **/
@Service
public class BaseSettingServiceImpl implements BaseSettingService {

    @Autowired
    private BaseSettingMapper baseSettingMapper;

    @Override
    public Map getBaseSettings(String companyId) {
        List<BaseSetting> baseSettingList = baseSettingMapper.selectByCompaneyId(companyId);

        if(baseSettingList.isEmpty()){
            return null;
        }
        // 组做成map
        Map<String,BaseSetting> baseSettingMap = new HashMap<String,BaseSetting>();
        for(int i=0;i<baseSettingList.size();i++){
            BaseSetting value = baseSettingList.get(i);
            baseSettingMap.put(value.getBsName(),value);
        }
        return baseSettingMap;

    }

    @Override
    public AjaxResponse updateBaseSettings() {
        return null;
    }
}