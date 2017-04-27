package com.jmu.controller;

import com.jmu.common.AjaxResponse;
import com.jmu.constant.ResponseCode;
import com.jmu.domain.vo.RegisterVo;
import com.jmu.entity.Email;
import com.jmu.service.EmailService;
import com.jmu.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * @Description: 注册controller
 * @author: zhouzunrong
 * @create: 2017-04-23 20:44
 * @version: 1.0
 **/
@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    private EmailService emailService;
    @Autowired
    private RegisterService registerService;

    @RequestMapping(value = "",method = RequestMethod.GET)
    public String registerPage(){
        return  "register";
    }

    @ResponseBody
    @RequestMapping(value = "/checkMailbox",method = RequestMethod.POST)
    public AjaxResponse checkMailbox(@RequestParam("mailbox") String mailbox){
        return registerService.checkMailbox(mailbox);
    }

    @ResponseBody
    @RequestMapping(value = "/createVerificationCode",method = RequestMethod.POST)
    public AjaxResponse sendVerificationCode(@RequestParam("mailbox") String to, HttpSession session){
        Email email = registerService.createEmail(to,session);
        emailService.sendEmail(email);
        return AjaxResponse.success();
    }

    @ResponseBody
    @RequestMapping(value = "/checkVerificationCode",method = RequestMethod.POST)
    public AjaxResponse checkVerificationCode(@RequestParam("mailbox") String mailbox,@RequestParam("verificationCode") String verificationCode, HttpSession session){
        AjaxResponse response = new AjaxResponse();
        String code = (String) session.getAttribute(mailbox);
        if(code == null || !code.equals(verificationCode)){
            response.setMessage("验证码错误！");
            response.setCode(ResponseCode.FAIL);
        }
        return response;
    }


    @ResponseBody
    @RequestMapping(value="/checkVisitUrl",method = RequestMethod.POST)
    public AjaxResponse checkVisitUrl(@RequestParam("visitUrl") String visitUrl){
        return registerService.checkVisitUrl(visitUrl);
    }

    @ResponseBody
    @RequestMapping(value="/save",method = RequestMethod.POST)
    public AjaxResponse save(@RequestBody RegisterVo registerVo){
       // return registerService.save(registerVo.getUser(),registerVo.getCompany());
        return AjaxResponse.success();
    }
    @ResponseBody
    @RequestMapping(value="/save2",method = RequestMethod.POST)
    public AjaxResponse save2(@RequestBody RegisterVo registerVo){
        return registerService.save(registerVo.getUser(),registerVo.getCompany());
    }


}