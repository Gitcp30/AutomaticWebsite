package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.WebBannerImg;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WebBannerImgMapper extends BaseMapper<WebBannerImg> {

    int batchInsert(List<WebBannerImg> webBannerImgs);

    int deleteByCompanyId(String companyId);

    List selectByCompanyId(String companyId);

    int batchDeleteByCompanyId(String[] companyIds);

}