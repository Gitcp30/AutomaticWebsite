package com.jmu.service.web;

import com.jmu.common.AjaxResponse;
import com.jmu.domain.BaseSetting;

import java.util.Map;

/**
 * 基础设置服务类
 * Created by zzr on 2017/5/4.
 */
public interface BaseSettingService {

    public Map getBaseSettings(String companyId);

    public AjaxResponse updateBaseSettings(Map<String,BaseSetting> baseSettingMap,String modifier);
}
