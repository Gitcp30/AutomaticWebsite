package com.jmu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Description: 后台管理系统controller
 * @author: zhouzunrong
 * @create: 2017-04-27 16:46
 * @version: 1.0
 **/
@Controller
@RequestMapping("/admin")
public class AdminController {

    /**
     *  进入admin界面
     * @return
     */
    @RequestMapping(value = "",method= RequestMethod.GET)
    public String adminPage(){
        return "admin/index";
    }

    /**
     *  加载footer界面
     * @return
     */
    @RequestMapping(value = "/footer",method= RequestMethod.GET)
    public String footerPage(){
        return "admin/footer";
    }

    /**
     *  加载head界面
     * @return
     */
    @RequestMapping(value = "/head",method= RequestMethod.GET)
    public String headPage(){
        return "admin/head";
    }

    /**
     *  加载forward界面
     * @return
     */
    @RequestMapping(value = "/forward",method= RequestMethod.GET)
    public String forwardPage(){
        return "admin/forward";
    }

    /**
     *  加载content界面
     * @return
     */
    @RequestMapping(value = "/welcome",method= RequestMethod.GET)
    public String contentPage(){
        return "admin/welcome";
    }


}