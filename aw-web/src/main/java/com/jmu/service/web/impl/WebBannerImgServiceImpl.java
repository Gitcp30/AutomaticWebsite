package com.jmu.service.web.impl;

import com.jmu.dao.WebBannerImgMapper;
import com.jmu.domain.BaseSetting;
import com.jmu.domain.WebBannerImg;
import com.jmu.service.web.WebBannerImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description: 横幅图片服务实现类
 * @author: zhouzunrong
 * @create: 2017-05-06 21:44
 * @version: 1.0
 **/
@Service
public class WebBannerImgServiceImpl implements WebBannerImgService {

    @Autowired
    private WebBannerImgMapper webBannerImgMapper;

    @Override
    public BaseSetting findAllByCompanyId(String companyId) {

        BaseSetting bannerImg = new BaseSetting();

        List<WebBannerImg> webBannerImgList = webBannerImgMapper.selectByCompanyId(companyId);
        StringBuffer imgBuffer = new StringBuffer();

        for(WebBannerImg img:webBannerImgList){
            imgBuffer.append(img.getBannerPic()+",");
        }
        if(!imgBuffer.equals("")){
            bannerImg.setBaseSettingId(webBannerImgList.get(0).getBannerImgId());
            bannerImg.setBsValue(imgBuffer.toString());
        }
        return bannerImg;
    }

    @Override
    public List<WebBannerImg> findAll(String companyId) {
        return webBannerImgMapper.selectByCompanyId(companyId);
    }
}