package com.jmu.service.front;

import com.jmu.common.AjaxResponse;
import com.jmu.domain.vo.LoginUSer;

import javax.servlet.http.HttpSession;

/**
 * Created by zzr on 2017/4/23.
 */
public interface LoginService {

    AjaxResponse checkLogin(LoginUSer loginUSer, HttpSession session);
}
