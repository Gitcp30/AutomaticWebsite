package com.jmu.service.web.impl;

import com.jmu.common.AjaxResponse;
import com.jmu.dao.BaseSettingMapper;
import com.jmu.dao.WebBannerImgMapper;
import com.jmu.dao.WebContentMapper;
import com.jmu.dao.WebFooterMapper;
import com.jmu.domain.*;
import com.jmu.domain.vo.WebSettingVo;
import com.jmu.service.web.InitWebService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @Description: 初始化公司编辑页面
 * @author: zhouzunrong
 * @create: 2017-05-03 20:36
 * @version: 1.0
 **/
@Service
public class InitWebServiceImpl implements InitWebService {

    @Autowired
    private BaseSettingMapper baseSettingMapper;
    @Autowired
    private WebFooterMapper webFooterMapper;
    @Autowired
    private WebBannerImgMapper webBannerImgMapper;
    @Autowired
    private WebContentMapper webContentMapper;

    @Override
    public AjaxResponse initWeb(String companyId,String modifier) {

        addWebBaseSetting(companyId,modifier);
        addWebFooter(companyId,modifier);
        addBannerImg(companyId,modifier);
        return AjaxResponse.success();

    }

    @Override
    public AjaxResponse updateWeb(Map<String, WebSettingVo> webSettingVo, User user,String url) {

        // 提取底部菜单栏配置并更新
        WebFooter webFooter = new WebFooter();
        WebSettingVo webMenu = webSettingVo.get("webMenu");
        WebSettingVo webLink = webSettingVo.get("webLink");
        WebSettingVo webCopyRight = webSettingVo.get("webCopyRight");


        if(webMenu != null){
            webFooter.setFooterId(webMenu.getBaseSettingId());
            webFooter.setMenuSelectIds(webMenu.getBsValue());
            webSettingVo.remove("webMenu");
        }
        if(webLink != null){
            webFooter.setFooterId(webLink.getBaseSettingId());
            webFooter.setLinkSelectIds(webLink.getBsValue());
            webSettingVo.remove("webLink");
        }
        if(webCopyRight != null){
            webFooter.setFooterId(webCopyRight.getBaseSettingId());
            webFooter.setCopyrightText(webCopyRight.getBsValue());
            webSettingVo.remove("webCopyRight");
        }
        if(webFooter.getFooterId() != null){
            webFooterMapper.updateByPrimaryKeySelective(webFooter);
        }

        // 更新横幅
        WebSettingVo webBanner = webSettingVo.get("bannerImg");

        if(webBanner != null){
            webSettingVo.remove("bannerImg");
            if(webBanner.getBsValue() != ""){
                List<WebBannerImg> webBannerImgList = new ArrayList<WebBannerImg>();
                String[] imgs = webBanner.getBsValue().split(",");
                for(int i=0;i<imgs.length;i++){
                    webBannerImgList.add(new WebBannerImg(UUID.randomUUID().toString().replace("-", ""),user.getCompanyId(),imgs[i],"#",user.getUserId(),i));
                }
                webBannerImgMapper.deleteByCompanyId(user.getCompanyId());
                webBannerImgMapper.batchInsert(webBannerImgList);
            }
        }

        // 更新内容区域信息
        List<WebContent> webContents = new ArrayList<WebContent>();


        Iterator<Map.Entry<String, WebSettingVo>> it = webSettingVo.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry<String, WebSettingVo> entry=it.next();
            WebSettingVo webSetting = entry.getValue();
            if(webSetting.getComumnId() !=null){
                WebContent content = new WebContent();
                BeanUtils.copyProperties(webSetting,content);
                content.setContentId(UUID.randomUUID().toString().replace("-", ""));
                content.setCompanyId(user.getCompanyId());
                content.setModifier(user.getUserId());
                webContents.add(content);
                it.remove();
            }

        }
        webContentMapper.deleteByCompanyId(url,user.getCompanyId());
        if(!webContents.isEmpty()){
            webContentMapper.batchInsert(webContents);
        }


        // 获取基础配置并更新
        List<BaseSetting> baseSettings = new ArrayList<BaseSetting>();
        for (String key : webSettingVo.keySet()) {
            WebSettingVo webSetting = webSettingVo.get(key);
            BaseSetting baseSetting = new BaseSetting();
            BeanUtils.copyProperties(webSetting,baseSetting);
            baseSetting.setModifier(user.getUserId());
            baseSetting.setModifyTime(new Date());
            baseSettings.add(baseSetting);
        }
        if (!baseSettings.isEmpty()){
            baseSettingMapper.batchUpdateByPrimaryKey(baseSettings);
        }
        return AjaxResponse.success();
    }

    /**
     * 初始化基础配置
     * @param companyId
     * @param modifier
     */
    private void addWebBaseSetting(String companyId,String modifier){
        BaseSetting[] BaseSettings = new BaseSetting[55];
        // 基础信息
        // 1.1背景-背景
        BaseSettings[0] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"bg-bg","bg_bg","default","#mainContent","",modifier);
        BaseSettings[1] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"bg-bg","background_background-colorpicker","#E4E6E9","#mainContent","background-color",modifier);
        BaseSettings[2] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"bg-bg","bgBgPic","","#mainContent","src",modifier);
        BaseSettings[3] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"bg-bg","bg_bg_showStyle","contain","#mainContent","",modifier);

        // 1.2背景-宽度
        BaseSettings[4] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"bg-width","bg_width","default","#mainContent","",modifier);
        BaseSettings[5] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"bg-width","bgWidthSlider","100","#mainContent","width",modifier);
        BaseSettings [6] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"bg-width","bgWidthSpiner","100","#mainContent","width",modifier);

        // 2.1头部-背景
        BaseSettings [7] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"header-bg","header_bg","default","#webHeader","",modifier);
        BaseSettings [8] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"header-bg","header_bg_colorpicker","#E4E6E9","#webHeader","background-color",modifier);
        BaseSettings [9] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"header-bg","headerBgPic","","#webHeader","src",modifier);
        BaseSettings [10] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"header-bg","header_bg_showStyle","contain","#webHeader","",modifier);

        // 2.2头部-底部边框
        BaseSettings [11] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"header-border","header_border","hide","#webHeader","",modifier);
        BaseSettings [12] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"header-border","header_border_colorpicker","#ffffff","#webHeader","border-bottom",modifier);
        BaseSettings [13] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"header-border","borderHeightSlider","0","#webHeader","border-bottom",modifier);
        BaseSettings [14] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"header-border","header_border_showStyle","solid","#webHeader","border-bottom",modifier);

        // 2.3头部-高度
        BaseSettings [15] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"header-height","header_height","default","#webHeader","",modifier);
        BaseSettings [16] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"header-height","headerWidthSlider","100","#webHeader","height",modifier);
        BaseSettings [17] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"header-height","headerWidthSpiner","100","#webHeader","height",modifier);

        // 3.1横幅-宽度
        BaseSettings [18] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"banner-width","banner_width","default","#webBanner","",modifier);
        BaseSettings [19] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"banner-width","banner_widthSlider","100","#webBanner","width",modifier);
        BaseSettings [20] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"banner-width","banner_widthSpinner","100","#webBanner","width",modifier);

        // 3.2横幅-高度
        BaseSettings [21] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"banner-height","banner_height","default","#webBanner","",modifier);
        BaseSettings [22] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"banner-height","banner_heightSlider","350","#webBanner","height",modifier);
        BaseSettings [23] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"banner-height","banner_heightSpinner","350","#webBanner","height",modifier);

        // 4.1内容宽度
        BaseSettings [24] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"content-width","content_widthSlider","100","#webContainer","width",modifier);
        // 4.2内容边距
        BaseSettings [25] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"content-width","content_marginTopSlider","0","#webContainer","margin-top",modifier);
        BaseSettings [26] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"content-width","content_marginBottomSlider","0","#webContainer","margin-bottom",modifier);

        // 5.1底部-高度
        BaseSettings [27] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"footer-height","footer_height","default","#webFooter","",modifier);
        BaseSettings [28] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"footer-height","footer_heightSlider","80","#webFooter","height",modifier);
        BaseSettings [29] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"footer-height","footer_heightSpinner","80","#webFooter","height",modifier);
        // 5.2底部-背景
        BaseSettings [30] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"footer-bg","footer_bg","default","#webFooter","",modifier);
        BaseSettings [31] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"footer-bg","footer_bg_colorpicker","#222222","#webFooter","background-color",modifier);

        // 5.3底部-栏目文字
        BaseSettings [32] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"footer-font","footer_linktext","default",".inner_footer .footLinks a","",modifier);
        BaseSettings [33] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"footer-font","footer_linktext_colorpicker","#8b939d",".inner_footer .footLinks a","color",modifier);
        BaseSettings [34] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"footer-font","footer_linkhover_colorpicker","#ffffff",".inner_footer .footLinks a:hover","color",modifier);
        BaseSettings [35] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"footer-font","footer_textSlider","14",".inner_footer .footLinks span","font-size",modifier);

        // 5.1菜单栏颜色
        BaseSettings [36] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"menu","menu_colorpicker","#e60012","#webMenu","background-color",modifier);
        // 5.1菜单栏选项颜色
        BaseSettings [37] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"menu","menu_bg_colorpicker","#e60012","#webMenu .inner_menu ul","background-color",modifier);
        // 5.1文字颜色
        BaseSettings [38] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"menu","menu_font_colorpicker","#ffffff","#webMenu .inner_menu ul li a","color",modifier);
        // 5.1选中颜色
        BaseSettings [39] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"menu","menu_selectItem_colorpicker","#cc0010","#webMenu .inner_menu ul li a:hover","background-color",modifier);
        // 5.1菜单栏长度
        BaseSettings [40] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"menu","menu_widthSlider","80","#webMenu .inner_menu","width",modifier);
        // 头部信息
        // 1.1logo透明度
        BaseSettings [41] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"logo","opacity_logoSlider","100","#goloModal_pic .logoPic img","opacity",modifier);
        // 1.2logo路径
        BaseSettings [42] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"logo","logoPic","/pic/sys/default/jmu-logo.png","#goloModal_pic .logoPic img","src",modifier);
        // 1.3logo弧度
        BaseSettings [43] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"logo","radius_logoSlider","0","#goloModal_pic .logoPic img","border-radius",modifier);
        // 1.4logo位置x
        BaseSettings [44] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"logo","logo_x","238","#goloModal_pic .logoPic img","left",modifier);
        // 1.5logo位置y
        BaseSettings [45] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"logo","logo_y","12","#goloModal_pic .logoPic img","top",modifier);
        // 1.6logo高度
        BaseSettings [46] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"logo","logo_height","75","#goloModal_pic .logoPic img","height",modifier);
        // 1.7logo宽度
        BaseSettings [47] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"logo","logo_width","280","#goloModal_pic .logoPic img","width",modifier);
        // 1.8标题
        BaseSettings [48] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"title","webTitle","<font size=\"7\" color=\"#f83a22\">集美大学</font>","#webTitle","html",modifier);
        // 1.4标题位置x
        BaseSettings [49] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"title","title_x","650","#webTitle","left",modifier);
        // 1.5标题位置y
        BaseSettings [50] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"title","title_y","-65","#webTitle","top",modifier);

        // 横幅基本配置
        // 1.1横幅样式
        BaseSettings [51] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"banner","banner_pattern","arrowSilde","#bannerModal_pattern .imgBorder","",modifier);
        // 1.2横幅滚动
        BaseSettings [52] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"banner","banner_animation","fold","#bannerModal_animation","effect",modifier);
        // 1.3横幅展示时间
        BaseSettings [53] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"banner","bannerModal_interTimeSpinner","2500","#banner","interTime",modifier);
        // 1.4动画切换时间
        BaseSettings [54] = new BaseSetting(UUID.randomUUID().toString().replace("-", ""),companyId,"banner","bannerModal_delayTimeSpinner","500","#banner","delayTime",modifier);




        for(int i=0;i<BaseSettings.length;i++){
            baseSettingMapper.insertSelective(BaseSettings[i]);
        }
    }

    /**
     * 初始化网站底部栏
     * @param companyId
     * @param modifier
     */
    private void addWebFooter(String companyId,String modifier){
        WebFooter webFooter = new WebFooter();
        webFooter.setFooterId(UUID.randomUUID().toString().replace("-", ""));
        webFooter.setCompanyId(companyId);
        webFooter.setCopyrightText("<font color=\"#cabdbf\" size=\"2\">Copyright &copy; 2010-2017 福建省厦门集美大学</font>");
        webFooter.setModifier(modifier);
        webFooter.setLinkSelectIds("e09b490d6a364dd99b4046d827d74f04/ef7334b835da42fd9d79e2b834e62b65/4465a5934f4f4c04aa6ec3fee693f411/27d102bcb9da4c5486046560f3fbe0ac");
        webFooter.setMenuSelectIds("e09b490d6a364dd99b4046d827d74f04/ef7334b835da42fd9d79e2b834e62b65/4465a5934f4f4c04aa6ec3fee693f411/27d102bcb9da4c5486046560f3fbe0ac");
        webFooterMapper.insertSelective(webFooter);

    }


    private void addBannerImg(String companyId,String modifier){
        List<WebBannerImg> webBannerImgList = new ArrayList<WebBannerImg>();
        WebBannerImg banner1 = new WebBannerImg(UUID.randomUUID().toString().replace("-", ""),companyId,"/pic/sys/PictureLibrary/banner-3.jpg","#",modifier,1);
        WebBannerImg banner2 = new WebBannerImg(UUID.randomUUID().toString().replace("-", ""),companyId,"/pic/sys/PictureLibrary/banner-4.jpg","#",modifier,2);
        WebBannerImg banner3 = new WebBannerImg(UUID.randomUUID().toString().replace("-", ""),companyId,"/pic/sys/PictureLibrary/banner-5.jpg","#",modifier,3);
        webBannerImgList.add(banner1);
        webBannerImgList.add(banner2);
        webBannerImgList.add(banner3);
        webBannerImgMapper.batchInsert(webBannerImgList);

    }



}