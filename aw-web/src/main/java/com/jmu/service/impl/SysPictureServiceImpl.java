package com.jmu.service.impl;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.jmu.dao.SysPictureMapper;
import com.jmu.dao.WebBannerImgMapper;
import com.jmu.domain.SysPicture;
import com.jmu.domain.User;
import com.jmu.domain.WebBannerImg;
import com.jmu.service.SysPictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description: 图片管理实现类
 * @author: zhouzunrong
 * @create: 2017-05-04 21:31
 * @version: 1.0
 **/
@Service
public class SysPictureServiceImpl implements SysPictureService {

    @Autowired
    private SysPictureMapper sysPictureMapper;
    @Autowired
    private WebBannerImgMapper webBannerImgMapper;

    /**
     * 过滤已选的处理
     * @param companyId
     * @return
     */
    @Override
    public List getAll(String companyId,User user) {
        List<SysPicture> sysImgs = sysPictureMapper.selectByCompanyId(companyId);
        List<WebBannerImg> webBannerImgs = webBannerImgMapper.selectByCompanyId(user.getCompanyId());

        sysImgs = Lists.transform(sysImgs, new Function<SysPicture, SysPicture>() {
            @Override
            public SysPicture apply(SysPicture sysPicture) {
                for(WebBannerImg img:webBannerImgs){
                    if(img.getBannerPic() .equals(sysPicture.getPictureUrl()) ){
                        sysPicture.setIsSelected(true);
                        break;
                    }
                }
                return sysPicture;
            }
        });
        return  sysImgs;
    }
}