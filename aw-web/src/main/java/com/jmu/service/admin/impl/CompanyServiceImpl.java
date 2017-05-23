package com.jmu.service.admin.impl;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.dao.*;
import com.jmu.domain.Company;
import com.jmu.domain.vo.CompanyVo;
import com.jmu.service.admin.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @Description: 公司服务实现类
 * @author: zhouzunrong
 * @create: 2017-05-07 18:37
 * @version: 1.0
 **/
@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private AuditingMapper auditingMapper;
    @Autowired
    private BaseSettingMapper baseSettingMapper;
    @Autowired
    private BullentinBoardMapper bullentinBoardMapper;
    @Autowired
    private CompanyMapper companyMapper;
    @Autowired
    private MessageBoardMapper messageBoardMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private WebBannerImgMapper webBannerImgMapper;
    @Autowired
    private WebColumnMapper webColumnMapper;
    @Autowired
    private WebContentMapper webContentMapper;
    @Autowired
    private WebFooterMapper webFooterMapper;




    @Override
    public Company findByUrl(String url) {
        return companyMapper.selectByVisitUrl(url);
    }

    @Override
    public AjaxPageResponse findAll(CompanyVo companyVo, AjaxPageResponse pageResponse) {
        companyMapper.findAll(companyVo,pageResponse);
        return pageResponse;
    }

    @Override
    public AjaxResponse updateState(CompanyVo companyVo) {
        if(companyVo.getCompanyState() == null || companyVo.getCompanyIds() ==null){
            return AjaxResponse.fail("单位为空");
        }
        companyMapper.updateStateByPrimaryKey(companyVo);
        return AjaxResponse.success();
    }

    @Override
    public AjaxResponse deleteCompany(String[] companyIds) {
        if (companyIds != null && companyIds.length > 0){
            // 审核表
            auditingMapper.batchDeleteByCompanyId(companyIds);
            // 基础配置表
            baseSettingMapper.batchDeleteByCompanyId(companyIds);
            // 用户表
            userMapper.batchDeleteByCompanyId(companyIds);
            // 横幅图片表
            webBannerImgMapper.batchDeleteByCompanyId(companyIds);
            // 横幅栏目表
            webColumnMapper.batchDeleteByCompanyId(companyIds);
            // 网站内容表
            webContentMapper.batchDeleteByCompanyId(companyIds);
            // 网站底部表
            webFooterMapper.batchDeleteByCompanyId(companyIds);
            // 公告栏
            bullentinBoardMapper.batchDeleteByCompanyId(companyIds);
            // 产品
            productMapper.batchDeleteByCompanyId(companyIds);
            // 留言板
            messageBoardMapper.batchDeleteByCompanyId(companyIds);
            // 公司表
            companyMapper.batchDeleteByPrimaryId(companyIds);
            return  AjaxResponse.success();
        }
        return AjaxResponse.fail("没有可删除的数据！");

    }

    @Override
    public AjaxResponse updateCompany(Company company) {
        if(company.getCompanyId() != null){
            company.setModifyTime(new Date());
            companyMapper.updateByPrimaryKeySelective(company);
            return AjaxResponse.success();
        } else {
            return AjaxResponse.fail("单位ID不存在");
        }
    }


    @Override
    public Company getCompany(String companyId) {
        if(companyId != null){
            return companyMapper.selectByPrimaryKey(companyId);
        } else {
            return null;
        }
    }


}