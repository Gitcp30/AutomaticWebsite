package com.jmu.controller;

import com.jmu.common.AjaxResponse;
import com.jmu.domain.*;
import com.jmu.domain.vo.WebSettingVo;
import com.jmu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
    @Autowired
    private WebContentService webContentService;

    /**
     *  进入编辑界面
     * @return
     */
    @RequestMapping(value = "/editPage/{url}",method= RequestMethod.GET)
    public String editPage(@PathVariable("url")String url ,Map<String, Object> map,HttpSession session){
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

    @ResponseBody
    @RequestMapping(value = "getContent/{url}",method = RequestMethod.GET)
    public AjaxResponse getWebContent(@PathVariable("url")String url ,HttpSession session){
        User user = (User) session.getAttribute("currentUser");
        // 获取内容
        /*{x: 0, y: 0, width: 3, height: 30},
        {x: 4, y: 0, width: 9, height: 30},*/
        List<WebContent> webContentList = webContentService.findContent(url,user.getCompanyId());
        if(webContentList.isEmpty()){
            WebContent w = new WebContent();
            w.setComumnId("a");
            w.setPositionX(0);
            w.setPositionY(0);
            w.setSizeWidth(3);
            w.setSizeHeight(30);
            w.setComponentId("component_login");
            w.setComumnId(url);
            WebContent w2 = new WebContent();
            w2.setComumnId("a");
            w2.setPositionX(4);
            w2.setPositionY(0);
            w2.setSizeWidth(9);
            w2.setSizeHeight(30);
            w2.setComponentId("component_bulletinBoard");
            w2.setComumnId(url);
            webContentList.add(w);
            webContentList.add(w2);
        }
        AjaxResponse ajaxResponse = new AjaxResponse();
        ajaxResponse.setData(webContentList);
        return ajaxResponse;
    }


    /**
     *  更新配置
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updateSettings",method = RequestMethod.POST)
    public AjaxResponse updateSettings(@RequestBody Map<String,WebSettingVo> webSettingMap, HttpSession session){
        // seesion获取公司ID
        User user = (User) session.getAttribute("currentUser");
        return initWebService.updateWeb(webSettingMap,user);
    }




}