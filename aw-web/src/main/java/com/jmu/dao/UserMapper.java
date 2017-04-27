package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.domain.User;
import com.jmu.domain.vo.LoginUSer;

public interface UserMapper extends BaseMapper<User> {

    public User selectByLogin(LoginUSer loginUSer);

    public User selectByMailBox(String mailbox);

}