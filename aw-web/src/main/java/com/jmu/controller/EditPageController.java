package com.jmu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Description: 编辑页面controller类
 * @author: zhouzunrong
 * @create: 2017-04-28 0:48
 * @version: 1.0
 **/
@Controller
@RequestMapping("/web/edit")
public class EditPageController {

    /**
     *  进入编辑界面
     * @return
     */
    @RequestMapping(value = "",method= RequestMethod.GET)
    public String editPage(){
        return "web/edit/edit";
    }

    /**
     *  获取index界面
     * @return
     */
    @RequestMapping(value = "index",method= RequestMethod.GET)
    public String indexPage(){
        return "web/edit/index";
    }

}