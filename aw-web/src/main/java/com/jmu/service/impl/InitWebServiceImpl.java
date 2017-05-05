package com.jmu.service.impl;

import com.jmu.common.AjaxResponse;
import com.jmu.dao.BaseSettingMapper;
import com.jmu.domain.BaseSetting;
import com.jmu.service.InitWebService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

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


    @Override
    public AjaxResponse initWeb(String companyId,String modifier) {

        addWebBaseSetting(companyId,modifier);
        return AjaxResponse.success();

    }

    /**
     * 初始化基础配置
     * @param companyId
     * @param modifier
     */
    private void addWebBaseSetting(String companyId,String modifier){
        BaseSetting[] BaseSettings = new BaseSetting[41];
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

        for(int i=0;i<BaseSettings.length;i++){
            baseSettingMapper.insertSelective(BaseSettings[i]);
        }
    }



    /**
     * 初始化网站菜单栏目
     * @param companyId
     * @param modifier
     */
    private void addWebMenuItem(String companyId,String modifier){

    }


}