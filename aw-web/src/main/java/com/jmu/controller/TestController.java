package com.jmu.controller;

import com.jmu.service.FunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description: aa
 * @author: zhouzunrong
 * @create: 2017-04-22 1:18
 * @version: 1.0
 **/

@Controller
public class TestController {

    @Autowired
    private FunctionService functionService;


    @RequestMapping("/user")
    public String login(){
        /*Function function = new Function();
        function.setFunctionId("122");
        function.setFunctionName("系统功能");
        function.setFunctionDesc("aaaaaaaaaaaaaaaaaaaaa");
        function.setFunctionType((short) 1);
        functionService.saveSelective(function);*/
        return "user";
    }

    @RequestMapping("/logins")
    public String logisn(){
        /*Function function = new Function();
        function.setFunctionId("122");
        function.setFunctionName("系统功能");
        function.setFunctionDesc("aaaaaaaaaaaaaaaaaaaaa");
        function.setFunctionType((short) 1);
        functionService.saveSelective(function);*/
        return "user";
    }

}