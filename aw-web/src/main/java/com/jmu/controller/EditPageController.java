package com.jmu.controller;

import com.jmu.common.AjaxResponse;
import com.jmu.domain.*;
import com.jmu.service.*;
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
    @Autowired
    private WebColumnService webColumnService;
    @Autowired
    private WebFooterService webFooterService;
    @Autowired
    private InitWebService initWebService;
    @Autowired
    private WebBannerImgService webBannerImgService;

    /**
     *  进入编辑界面
     * @return
     */
    @RequestMapping(value = "",method= RequestMethod.GET)
    public String editPage(Map<String, Object> map,HttpSession session){
        User user = (User) session.getAttribute("currentUser");

        List list = sysPictureService.getAll("sys",user);
        List<WebColumn> webColumnList = webColumnService.getSelectByCompanyId(user.getCompanyId(),(short)0);
        List<WebBannerImg> webBannerImgList = webBannerImgService.findAll(user.getCompanyId());
        map.put("webBannerImgList",webBannerImgList);
        map.put("sysPics",list);
        map.put("sysMenuColumns",webColumnList);
        return "web/edit/edit";
    }

    /**
     *  获取index界面
     * @return
     */
    @RequestMapping(value = "index",method= RequestMethod.GET)
    public String indexPage(Map<String, Object> map,HttpSession session){
        User user = (User) session.getAttribute("currentUser");
        List<WebColumn> webColumnList = webColumnService.getSelectByCompanyId(user.getCompanyId(),(short)0);
        WebFooter webFooter =webFooterService.findByCompanyId(user.getCompanyId());
        List<WebBannerImg> webBannerImgList = webBannerImgService.findAll(user.getCompanyId());


        map.put("webColumnList",webColumnList);
        map.put("webFooter",webFooter);
        map.put("webBannerImgList",webBannerImgList);
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
        Map<String,Object> map = baseSettingService.getBaseSettings(company.getCompanyId());
        // 获取栏目信息
        WebFooter webFooter = webFooterService.findByCompanyId(company.getCompanyId());
        BaseSetting webMenuBaseSetting = new BaseSetting(webFooter.getFooterId(),webFooter.getMenuSelectIds());
        BaseSetting webLinkBaseSetting = new BaseSetting(webFooter.getFooterId(),webFooter.getLinkSelectIds());
        BaseSetting webCopyRightBaseSetting = new BaseSetting(webFooter.getFooterId(),webFooter.getCopyrightText());
        // 设置栏目配置信息
        map.put("webMenu",webMenuBaseSetting);
        map.put("webLink",webLinkBaseSetting);
        map.put("webCopyRight",webCopyRightBaseSetting);

        // 设置横幅配置信息
        BaseSetting bannerImg = webBannerImgService.findAllByCompanyId(company.getCompanyId());
        map.put("bannerImg",bannerImg);
        return map;
    }


    /**
     *  更新配置
     * @param updateSettings
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updateSettings",method = RequestMethod.POST)
    public AjaxResponse updateSettings(@RequestBody Map<String,BaseSetting> updateSettings, HttpSession session){
        // seesion获取公司ID
        User user = (User) session.getAttribute("currentUser");
        return initWebService.updateWeb(updateSettings,user);
    }




}