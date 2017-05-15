package com.jmu.service.web;

import com.jmu.domain.BaseSetting;
import com.jmu.domain.WebBannerImg;

import java.util.List;

/**
 * Created by zzr on 2017/5/6.
 */
public interface WebBannerImgService {

    public BaseSetting findAllByCompanyId(String companyId);


    public List<WebBannerImg> findAll(String companyId);
}
