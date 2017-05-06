package com.jmu.controller;

import com.jmu.domain.User;
import com.jmu.service.BaseSettingService;
import com.jmu.service.InitWebService;
import com.jmu.service.WebColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @Description: 后台管理系统controller
 * @author: zhouzunrong
 * @create: 2017-04-27 16:46
 * @version: 1.0
 **/
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private InitWebService initWebService;
    @Autowired
    private BaseSettingService baseSettingService;
    @Autowired
    private WebColumnService webColumnService;

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


    /**
     *
     * 测试审核通过，自动生成页面默认代码
     * @return
     */
    @RequestMapping(value = "/pass",method= RequestMethod.GET)
    public String auditingPass(){
        initWebService.initWeb("222","111");
        Map map = baseSettingService.getBaseSettings("222");
        return "web/edit/aaa";
    }


    @RequestMapping(value = "/addWebColumn",method= RequestMethod.GET)
    public String addWebColumn(){
        webColumnService.addWebMenuItem("system","admin");
        return "web/edit/edit";
    }






    /**
     *
     * 测试审核通过，自动生成页面默认代码
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/pass2",method= RequestMethod.GET)
    public Map testmap(){
        Map<String,User> map = new HashMap<String,User>();
        User user1 = new User();
        User user2 = new User();
        user1.setCompanyId("sadad");
        user1.setSysAccount("asdasd");
        user2.setCompanyId("sadad");
        user2.setSysAccount("asdasd");
        map.put("user1",user1);
        map.put("user2",user2);
        return map;
    }
}