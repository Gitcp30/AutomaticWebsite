package com.jmu.service.web;

import com.jmu.domain.WebColumn;

import java.util.List;

/**
 * 菜单栏项目服务类
 * Created by zzr on 2017/5/6.
 */
public interface WebColumnService {

    void addWebMenuItem(String companyId,String creator);

    List<WebColumn> findAllByType(Short columnType);

    List<WebColumn> getSelectByCompanyId(String companyId,short type);

    Boolean isEffectiveLink(String url);
}
