package com.jmu.service.web;

import com.jmu.common.AjaxResponse;
import com.jmu.domain.User;
import com.jmu.domain.vo.WebSettingVo;

import java.util.Map;

/**
 * 页面初始化
 * Created by zzr on 2017/5/3.
 */
public interface InitWebService {

    public AjaxResponse initWeb(String companyId,String modifier);

    public AjaxResponse updateWeb(Map<String,WebSettingVo> WebSettingVo, User user,String url);
}
