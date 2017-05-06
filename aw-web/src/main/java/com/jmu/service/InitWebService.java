package com.jmu.service;

import com.jmu.common.AjaxResponse;
import com.jmu.domain.BaseSetting;
import com.jmu.domain.User;

import java.util.Map;

/**
 * 页面初始化
 * Created by zzr on 2017/5/3.
 */
public interface InitWebService {

    public AjaxResponse initWeb(String companyId,String modifier);

    public AjaxResponse updateWeb(Map<String,BaseSetting> updateSettings, User user);
}
