package com.jmu.service.front;

import com.jmu.common.AjaxResponse;
import com.jmu.domain.Company;
import com.jmu.domain.User;
import com.jmu.domain.vo.UserVo;
import com.jmu.entity.Email;

import javax.servlet.http.HttpSession;

/**
 * Created by zzr on 2017/4/24.
 */
public interface RegisterService {

    public Email createEmail(String to,HttpSession session);

    public AjaxResponse checkMailbox(String mailbox);

    public AjaxResponse checkVisitUrl(String checkVisitUrl);

    public AjaxResponse save(User user, Company company);

    public AjaxResponse saveMemberRegister(UserVo userVo);

}
