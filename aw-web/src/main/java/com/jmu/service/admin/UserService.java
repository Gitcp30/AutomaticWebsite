package com.jmu.service.admin;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.domain.User;
import com.jmu.domain.vo.UserVo;

/**
 * Created by zzr on 2017/5/15.
 */
public interface UserService {

    public UserVo getUserAndAuditing(String companyId);

    public Integer getUserCount(String companyId);

    public AjaxPageResponse getUser(String companyId,AjaxPageResponse page);

    public User getUser(String userId);

    public AjaxResponse updateUser(User user);
}
