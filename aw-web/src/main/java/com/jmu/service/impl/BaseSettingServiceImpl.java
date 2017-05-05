package com.jmu.service.impl;

import com.jmu.common.AjaxResponse;
import com.jmu.dao.BaseSettingMapper;
import com.jmu.domain.BaseSetting;
import com.jmu.service.BaseSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

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
    public AjaxResponse updateBaseSettings(Map<String,BaseSetting> baseSettingMap,String modifier) {
        List<BaseSetting> baseSettings = new ArrayList<BaseSetting>();
        for (String key : baseSettingMap.keySet()) {
            BaseSetting baseSetting = baseSettingMap.get(key);
            baseSetting.setModifier(modifier);
            baseSetting.setModifyTime(new Date());
            baseSettings.add(baseSetting);
        }
        if (!baseSettings.isEmpty()){
            baseSettingMapper.batchUpdateByPrimaryKey(baseSettings);
        }
        return AjaxResponse.success();
    }
}