package com.jmu.service.admin.impl;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.dao.UserMapper;
import com.jmu.domain.User;
import com.jmu.domain.vo.UserVo;
import com.jmu.service.admin.UserService;
import com.jmu.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

/**
 * @Description: 用户服务实现类
 * @author: zhouzunrong
 * @create: 2017-05-15 1:11
 * @version: 1.0
 **/
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserVo getUserAndAuditing(String companyId) {
        return userMapper.selectUserAuditingByCompanyId(companyId);
    }

    @Override
    public Integer getUserCount(String companyId) {
        return userMapper.selectCountByCompanyId(companyId);
    }

    @Override
    public AjaxPageResponse getUser(String companyId,AjaxPageResponse page) {
        if(companyId != null && companyId != ""){
            userMapper.selectByCompanyId(companyId,page);
            return page;
        }
        return null;
    }

    @Override
    public User getUser(String userId) {
        if(userId != "" && userId != null){
            return  userMapper.selectByPrimaryKey(userId);
        } else {
            return null;
        }
    }


    @Override
    public AjaxResponse updateUser(User user) {
        if(user.getUserId() != null){
            user.setModifyTime(new Date());
            userMapper.updateByPrimaryKeySelective(user);
            return AjaxResponse.success();
        } else{
            return  AjaxResponse.fail("用户id为空");
        }
    }

    @Override
    public AjaxPageResponse findAll(UserVo userVo, AjaxPageResponse page) {
            userMapper.selectAllByCompanyId(userVo,page);
            return  page;
    }


    @Override
    public AjaxResponse saveUser(User user) {
        user.setUserId(UUID.randomUUID().toString().replace("-", ""));
        user.setUserType((short) 0);
        user.setPassword(CommonUtils.MD5("123456"));
        user.setSysAccount(CommonUtils.createSysAccount(user.getMailbox()));
        user.setUserState((short)0);
        user.setPicSrc("/pic/sys/PictureLibrary/1.jpg");
        userMapper.insertSelective(user);
        return AjaxResponse.success();
    }

    @Override
    public AjaxResponse deleteUser(String[] userIds) {
        if(userIds!=null  && userIds.length>0){
            userMapper.batchDeleteByPrimaryKey(userIds);
            return  AjaxResponse.success();
        } else {
            return  AjaxResponse.fail("删除ID不存在");
        }
    }

    @Override
    public AjaxResponse updateUserState(UserVo userVo) {
        if(userVo.getUserState() == null || userVo.getUserState() ==null){
            return AjaxResponse.fail("状态为空");
        }
        userMapper.updateStateByPrimaryKey(userVo);
        return AjaxResponse.success();
    }
}