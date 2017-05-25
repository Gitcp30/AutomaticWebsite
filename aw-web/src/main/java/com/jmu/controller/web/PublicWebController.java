package com.jmu.controller.web;

import com.jmu.domain.*;
import com.jmu.service.admin.BullentinBoardService;
import com.jmu.service.admin.CompanyService;
import com.jmu.service.admin.SysPictureService;
import com.jmu.service.web.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Description: 外部访问控制类
 * @author: zhouzunrong
 * @create: 2017-05-07 16:40
 * @version: 1.0
 **/
@Controller
@RequestMapping("/qw")
public class PublicWebController {


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

    @Autowired
    private CompanyService companyService;
    @Autowired
    private BullentinBoardService bullentinBoardService;

    /**
     *  进入index界面
     * @return
     */
    @RequestMapping(value ="/{companyUrl}/{companyPage}",method= RequestMethod.GET)
    public String adminPage(@PathVariable("companyUrl")String companyUrl,
          @PathVariable("companyPage") String companyPage,Map<String, Object> map){
        // 获取公司ID
        Company company = companyService.findByUrl(companyUrl);
        if(company == null){
            return "error/error";
        }
        List<WebColumn> webColumnList = webColumnService.getSelectByCompanyId(company.getCompanyId(),(short)0);
        List<WebBannerImg> webBannerImgList = webBannerImgService.findAll(company.getCompanyId());
        WebFooter webFooter =webFooterService.findByCompanyId(company.getCompanyId());

        map.put("webBannerImgList",webBannerImgList);
        map.put("sysMenuColumns",webColumnList);
        map.put("webFooter",webFooter);
        return "web/public/index";
    }

    /**
     * 获取基础配置
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getBaseSettings",method = RequestMethod.POST)
    public Map getBaseSettings(@RequestParam("companyUrl")String companyUrl,@RequestParam("companyPage") String companyPage){
        companyPage = companyPage.replace("#","");
        boolean bool = webColumnService.isEffectiveLink(companyPage);
        if(!bool && companyPage.indexOf("bullentinBoardDetail")==-1){
            return null;
        }
        // 获取公司ID
        Company company = companyService.findByUrl(companyUrl);
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
        List<WebContent> webContentList = new ArrayList<WebContent>();
        // 包含(说明是 公告栏)
        if(companyPage.indexOf("bullentinBoardDetail")!=-1){
            // 不包含
            WebContent w = new WebContent();
            w.setComumnId("a");
            w.setPositionX(0);
            w.setPositionY(0);
            w.setSizeWidth(12);
            w.setSizeHeight(40);
            w.setComponentId(companyPage);
            webContentList.add(w);
        }else{
            // 内容区域
            webContentList = webContentService.findContent(companyPage,company.getCompanyId());

        }
        map.put("webContentList",webContentList);
        return map;
    }


    /**
     * 获取公告栏信息
     * @param companyUrl
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getBulletinBoard",method = RequestMethod.POST)
    public List getBulletinBoard(String companyUrl){
        if(companyUrl != null){
            return bullentinBoardService.getBullentinBoard(companyUrl);
        } else {
            return null;
        }
    }


    /**
     *  获取公告栏信息细节
     * @param bullentinBoardId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getBulletinBoardDetail",method = RequestMethod.POST)
    public BullentinBoard getBulletinBoardDetail(String bullentinBoardId){
        if(bullentinBoardId != null){
            return bullentinBoardService.findOne(bullentinBoardId);
        } else {
            return null;
        }
    }


}