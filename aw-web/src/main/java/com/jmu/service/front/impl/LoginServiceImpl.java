package com.jmu.service.front.impl;

import com.jmu.common.AjaxResponse;
import com.jmu.constant.Constants;
import com.jmu.dao.CompanyMapper;
import com.jmu.dao.UserMapper;
import com.jmu.domain.Company;
import com.jmu.domain.User;
import com.jmu.domain.vo.LoginUSer;
import com.jmu.service.front.LoginService;
import com.jmu.util.CommonUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

/**
 * @Description: 验证登录服务实现类
 * @author: zhouzunrong
 * @create: 2017-04-23 10:48
 * @version: 1.0
 **/
@Service
public class LoginServiceImpl implements LoginService {


    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CompanyMapper companyMapper;

    /**
     * 验证登录
     * @param loginUSer
     * @param session
     * @return
     */
    @Override
    public AjaxResponse checkLogin(LoginUSer loginUSer, HttpSession session) {
        // 1 验证码是否通过
        String patchca = (String) session.getAttribute("patchca");
        session.removeAttribute("patchca");
        if (StringUtils.isNotEmpty(patchca) && StringUtils.isNotEmpty(loginUSer.getPatchca())) {
           Boolean b = patchca.equalsIgnoreCase(loginUSer.getPatchca());
           if (!b) return AjaxResponse.fail("验证码错误!");
        } else {
            return AjaxResponse.fail("验证码不能为空!");
        }
        // 2 查询数据库验证
        String pwd = loginUSer.getPassword();
        loginUSer.setPassword(CommonUtils.MD5(pwd));
        User currentUser = userMapper.selectByLogin(loginUSer);
        if (currentUser == null){
            return AjaxResponse.fail("密码错误!");
        } else {
            // 判断当前用用户类型，为系统管理员直接进入系统
            if (currentUser.getUserType() == Constants.USER_SYS_ADMIN){
                session.setAttribute("currentUser",currentUser);
                return AjaxResponse.success();
                // 否则判断用户状态
            } else if (currentUser.getUserState() == Constants.STATE_NORMAL){
                Company company = companyMapper.selectByPrimaryKey(currentUser.getCompanyId());
                // 判断公司状态
                if (company !=null && company.getCompanyState() == Constants.STATE_NORMAL) {
                    session.setAttribute("currentUser",currentUser);
                    session.setAttribute("company",company);
                    return AjaxResponse.success();
                } else {
                    String msg = "登录失败";
                    if (company != null){
                        switch (company.getCompanyState()){
                            case 1:msg = "公司被锁定!";break;
                            case 2:msg = "公司审核中!";break;
                            case 3:msg = "公司审核失败!";break;
                        }
                    }
                    return AjaxResponse.fail(msg);
                }
            }  // 当前用户是否被锁定
            else {
                return AjaxResponse.fail("当前用户被锁定!");
            }
        }
    }



    @Override
    public AjaxResponse checkWebLogin(LoginUSer loginUSer, HttpSession session) {
        // 2 查询数据库验证
        String pwd = loginUSer.getPassword();
        loginUSer.setPassword(CommonUtils.MD5(pwd));
        User currentUser = userMapper.selectByLogin(loginUSer);
        if (currentUser == null){
            return AjaxResponse.fail("密码错误!");
        } else {
            if (currentUser.getUserState() == Constants.STATE_NORMAL){
                Company company = companyMapper.selectByPrimaryKey(currentUser.getCompanyId());
                if(!company.getVisitUrl().equals(loginUSer.getCompanyUrl())){
                    return AjaxResponse.fail("登录失败!");
                }
                // 判断公司状态
                if (company !=null && company.getCompanyState() == Constants.STATE_NORMAL) {
                    session.setAttribute("currentUser",currentUser);
                    session.setAttribute("company",company);
                    return AjaxResponse.success();
                } else {
                    String msg = "登录失败";
                    if (company != null){
                        switch (company.getCompanyState()){
                            case 1:msg = "公司被锁定!";break;
                            case 2:msg = "公司审核中!";break;
                            case 3:msg = "公司审核失败!";break;
                        }
                    }
                    return AjaxResponse.fail(msg);
                }
            }  // 当前用户是否被锁定
            else {
                return AjaxResponse.fail("当前用户被锁定!");
            }
        }
    }

}