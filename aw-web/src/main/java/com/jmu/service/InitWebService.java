package com.jmu.service;

import com.jmu.common.AjaxResponse;

/**
 * 页面初始化
 * Created by zzr on 2017/5/3.
 */
public interface InitWebService {

    public AjaxResponse initWeb(String companyId,String modifier);
}
