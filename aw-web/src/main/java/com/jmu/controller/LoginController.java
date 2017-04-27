package com.jmu.controller;

import com.jmu.common.AjaxResponse;
import com.jmu.domain.vo.LoginUSer;
import com.jmu.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Description: 登录controller
 * @author: zhouzunrong
 * @create: 2017-04-23 10:40
 * @version: 1.0
 **/
@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    /**
     *  进入登录界面
     * @return
     */
    @RequestMapping(value = "/login",method=RequestMethod.GET)
    public String loginPage(){
        return "login";
    }

    @ResponseBody
    @RequestMapping(value="/login",method = RequestMethod.POST)
    public AjaxResponse checkLogin(LoginUSer loginUSer,HttpSession session){
        return  loginService.checkLogin(loginUSer,session);
    }

}