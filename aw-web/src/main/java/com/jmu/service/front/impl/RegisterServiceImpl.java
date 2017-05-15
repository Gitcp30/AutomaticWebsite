package com.jmu.service.front.impl;

import com.google.common.collect.Lists;
import com.jmu.common.AjaxResponse;
import com.jmu.constant.Constants;
import com.jmu.constant.ResponseCode;
import com.jmu.dao.CompanyMapper;
import com.jmu.dao.UserMapper;
import com.jmu.domain.Company;
import com.jmu.domain.User;
import com.jmu.entity.Email;
import com.jmu.service.front.RegisterService;
import com.jmu.util.CommonUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.UUID;

/**
 * @Description: 注册用户服务实现类
 * @author: zhouzunrong
 * @create: 2017-04-24 0:37
 * @version: 1.0
 **/

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CompanyMapper companyMapper;

    /**
     * 生成校验邮箱验证码
     * @param to
     * @return
     */
    @Override
    public Email createEmail(String to,HttpSession session) {
        String verificationCode = CommonUtils.createVerificationCode();
        String subject = "自动建站注册用户提示";
        String text = "[自动建站]您的注册验证码是<font color=\"red\">"+verificationCode+"</font>！";
        Email email = new Email(to,subject,text);
        session.setAttribute(to,verificationCode);
        return email;
    }

    @Override
    public AjaxResponse checkMailbox(String mailbox) {
        User user = userMapper.selectByMailBox(mailbox);
        AjaxResponse response = new AjaxResponse();
        // 用户为空，可以注册
        if (user != null){
            // 用户不为空，则判断公司状态
            Company company = companyMapper.selectByPrimaryKey(user.getCompanyId());
            if (company != null && company.getCompanyState() == Constants.AUDITING_FAIL){
                // 公司注册失败，回显
                response.setData(Lists.newArrayList(company));
            } else {
                response.setCode(ResponseCode.FAIL);
                response.setMessage("该账号对应公司已存在！");
            }
        }
        return response;
    }

    @Override
    public AjaxResponse checkVisitUrl(String checkVisitUrl) {
        if(StringUtils.isNotEmpty(checkVisitUrl) && companyMapper.selectByVisitUrl(checkVisitUrl) ==null){
            return  AjaxResponse.success();
        }
        return AjaxResponse.fail();
    }

    @Override
    public AjaxResponse save(User user, Company company) {
        // 保存公司
        company.setCompanyId(UUID.randomUUID().toString().replace("-", ""));
        company.setCompanyState((short)2);
        company.setMailbox(user.getMailbox());
        companyMapper.insert(company);
        // 保存用户
        user.setUserId(UUID.randomUUID().toString().replace("-", ""));
        user.setUserType((short) 1);
        user.setPassword(CommonUtils.MD5(user.getPassword()));
        user.setSysAccount(CommonUtils.createSysAccount(user.getMailbox()));
        user.setUserState((short)0);
        user.setCompanyId(company.getCompanyId());
        userMapper.insert(user);

        return AjaxResponse.success();
    }
}