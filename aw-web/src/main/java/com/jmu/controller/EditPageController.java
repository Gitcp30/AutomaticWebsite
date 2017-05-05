package com.jmu.controller;

import com.jmu.common.AjaxResponse;
import com.jmu.domain.BaseSetting;
import com.jmu.domain.Company;
import com.jmu.domain.User;
import com.jmu.service.BaseSettingService;
import com.jmu.service.SysPictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @Description: 编辑页面controller类
 * @author: zhouzunrong
 * @create: 2017-04-28 0:48
 * @version: 1.0
 **/
@Controller
@RequestMapping("/web/edit")
public class EditPageController {

    @Autowired
    private BaseSettingService baseSettingService;
    @Autowired
    private SysPictureService sysPictureService;

    /**
     *  进入编辑界面
     * @return
     */
    @RequestMapping(value = "",method= RequestMethod.GET)
    public String editPage(Map<String, Object> map){
        List list = sysPictureService.getAll("sys");
        map.put("sysPics",list);
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


    /**
     * 获取基础配置
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getBaseSettings",method = RequestMethod.GET)
    public Map getBaseSettings(HttpSession session){
        // seesion获取公司ID
        Company company = (Company) session.getAttribute("company");
        if(company == null){
            return null;
        }
        // 获取基础配置
        Map map = baseSettingService.getBaseSettings(company.getCompanyId());
        return map;
    }

    /**
     *  更新基础配置
     * @param baseSettingMap
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updateBaseSettings",method = RequestMethod.POST)
    public AjaxResponse updateBaseSettings(@RequestBody Map<String,BaseSetting> baseSettingMap, HttpSession session){
        // seesion获取公司ID
        User user = (User) session.getAttribute("currentUser");
        return baseSettingService.updateBaseSettings(baseSettingMap,user.getUserId());
    }




}