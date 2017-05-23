package com.jmu.service.admin.impl;

import com.jmu.common.AjaxResponse;
import com.jmu.constant.Constants;
import com.jmu.dao.AuditingMapper;
import com.jmu.dao.CompanyMapper;
import com.jmu.dao.UserMapper;
import com.jmu.domain.Auditing;
import com.jmu.domain.Company;
import com.jmu.service.admin.AuditingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @Description: 单位审核服务实现类
 * @author: zhouzunrong
 * @create: 2017-05-16 1:35
 * @version: 1.0
 **/
@Service
public class AuditingServiceImpl implements AuditingService {

    @Autowired
    private AuditingMapper auditingMapper;
    @Autowired
    private CompanyMapper companyMapper;
    @Autowired
    private UserMapper userMapper;


    @Override
    public AjaxResponse updateAuditing(Auditing auditing) {
        if(auditing.getAuditingId() == null && auditing.getAuditingState() == null){
            AjaxResponse.fail("参数错误！");
        }

        // 保存审核表
        auditing.setAuditingTime(new Date());
        auditingMapper.updateByCompanyId(auditing);
        // 保存单位表
        Company company = new Company();
        company.setCompanyId(auditing.getCompanyId());
        if(auditing.getAuditingState() == Constants.AUDITING_SUCCESS){
            company.setCompanyState(Constants.STATE_NORMAL);
        } else {
            company.setCompanyState(Constants.AUDITING_FAIL);
        }
        companyMapper.updateByPrimaryKeySelective(company);
        // 发送邮件通知结果
        return  AjaxResponse.success();
    }

    @Override
    public AjaxResponse deleteAuditing(String[] companyIds) {
        // 单位ID不为空
        if (companyIds != null && companyIds.length > 0){
            // 删除用户表
            userMapper.batchDeleteByCompanyId(companyIds);
            // 删除审核表
            auditingMapper.batchDeleteByCompanyId(companyIds);
            // 删除单位表
            companyMapper.batchDeleteByPrimaryId(companyIds);
        }
        return AjaxResponse.success();
    }
}