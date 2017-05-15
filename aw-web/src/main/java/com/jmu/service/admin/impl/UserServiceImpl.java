package com.jmu.service.admin.impl;

import com.jmu.dao.UserMapper;
import com.jmu.domain.vo.UserVo;
import com.jmu.service.admin.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}