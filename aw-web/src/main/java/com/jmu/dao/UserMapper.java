package com.jmu.dao;

import com.jmu.base.BaseMapper;
import com.jmu.common.AjaxPageResponse;
import com.jmu.domain.User;
import com.jmu.domain.vo.LoginUSer;
import com.jmu.domain.vo.UserVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper extends BaseMapper<User> {

    public User selectByLogin(LoginUSer loginUSer);

    public User selectByMailBox(String mailbox);

    public UserVo selectUserAuditingByCompanyId(String companyId);

    int batchDeleteByCompanyId(String[] companyIds);

    Integer selectCountByCompanyId(String companyId);

    List<User> selectByCompanyId(String companyId, AjaxPageResponse page);

    List<User> selectAllByCompanyId(UserVo userVo, AjaxPageResponse page);

    int batchDeleteByPrimaryKey(String[] userIds);

    int updateStateByPrimaryKey(UserVo userVo);

}