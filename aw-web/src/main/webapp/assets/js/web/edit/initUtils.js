/**
 * Created by zzr on 2017/5/4.
 */

define(function(require, exports, module) {

    var $ = require('jquery');
    var editUtils = require("editutils");
    var baseSettingUtils = require("./basesetting");

    function bgBgShowStyle(val) {
        if (val == "no"){
            //$("#bg_bg_img").hide();
            $("#bg_bg_img img").removeAttr("src");
            editUtils.setBgImg($("#mainContent"),"");
            editUtils.setBgSize($("#mainContent"),"");
            editUtils.setBgRepeat($("#mainContent"),"");
            updateBS('bgBgPic',"");
        }
        else if (val == "no-repeat" || val == "repeat-y" || val =="repeat-x"){
            editUtils.setBgRepeat($("#mainContent"),val);
            editUtils.setBgSize($("#mainContent"),"");
        } else{
            editUtils.setBgSize($("#mainContent"),val);
            editUtils.setBgRepeat($("#mainContent"),"");
        }
        // 保存更新
        updateBS('bg_bg_showStyle',val);
    }
    function updateBS(key,value) {
        // 保存更新
        baseSettingUtils.baseSettingMap[key]['bsValue'] = value;
        baseSettingUtils.updateBsMap[key] = baseSettingUtils.baseSettingMap[key];
    }
    function  setIndexBgSize(value) {

        $(".inner_header").css("width",value+"%");
        $("#webMenu .inner_menu").css("width",value+"%");
        $("#webBanner").css("width",value+"%");
        $("#webContainer").css("width",value+"%");
        $(".inner_footer").css("width",value+"%");


        updateBS("bgWidthSlider",value);
        updateBS("bgWidthSpiner",value);
        updateBS("menu_widthSlider",value);
        updateBS("banner_widthSlider",value);
        updateBS("banner_widthSpinner",value);
        updateBS("content_widthSlider",value);
    }

    function headerBgShowStyle(val){
        if (val == "no"){
            $("#header_bg_img").hide();
            $("#header_bg_img img").removeAttr("src");
            editUtils.setBgImg($("#webHeader"),"");
            editUtils.setBgSize($("#webHeader"),"");
            editUtils.setBgRepeat($("#webHeader"),"");
            updateBS('headerBgPic',"");
        }
        else if (val == "no-repeat" || val == "repeat-y" || val =="repeat-x"){
            editUtils.setBgRepeat($("#webHeader"),val);
            editUtils.setBgSize($("#webHeader"),"");
        } else{
            editUtils.setBgSize($("#webHeader"),val);
            editUtils.setBgRepeat($("#webHeader"),"");
        }
        // 保存更新
        updateBS('header_bg_showStyle',val);
    }

    /**
     * 背景--默认自定义
     */
    exports.bgBgEvent =  function () {
        switch ($(this).val()) {
            case "default":
                $("#leftSidebar_background .setting_background .content").hide();
                editUtils.setBgColor($("#mainContent"), "#E4E6E9");
                editUtils.setBgImg($("#mainContent"), "");
                // 保存更新
                updateBS('background_background-colorpicker',"#E4E6E9");
                updateBS('bg_bg',"default");
                break;
            case "hide":
                $("#leftSidebar_background .setting_background .content").hide();
                editUtils.setBgColor($("#mainContent"),"");
                editUtils.setBgImg($("#mainContent"),"");
                // 保存更新
                updateBS('background_background-colorpicker',"");
                updateBS('bg_bg',"hide");
                break;
            case "custom":
                $("#leftSidebar_background .setting_background .content").show();
                var imgSrc = $("#bg_bg_img img").attr("src");
                if (imgSrc != undefined) {
                    var val = $("select[name='bg_bg_showStyle']").val();
                    if (val!= "no") { editUtils.setBgImg($("#mainContent"), imgSrc);}
                    bgBgShowStyle(val);
                } else {
                    $("#bg_bg_img").hide();
                    $("#bg_bg_img img").removeAttr("src");
                    editUtils.setBgColor($("#mainContent"), $('#background_background-colorpicker').colorpicker("getValue"));
                }
                // 保存更新
                updateBS('bg_bg',"custom");
                break;
            default:
                alert("出错啦！");
                break;
        }
    };
    /**
     * 背景图片展示方式
     */
    exports.bgBgShowStyleEvent = function () {
        bgBgShowStyle($(this).val());
    }

    /**
     * 背景宽度
     * @param val
     * @param $widthSpinner
     */
    exports.bgWidthEvent = function (val,$widthSpinner) {
        switch(val) {
            case "default":
                $("#leftSidebar_background .setting_width .content").hide();
                // 宽度100%
                setIndexBgSize("100");
                // 保存更新
                updateBS("bg_width","default");
                break;
            case "custom":
                $("#leftSidebar_background .setting_width .content").show();
                setIndexBgSize($widthSpinner.val());
                // 保存更新
                updateBS("bg_width","custom");
                break;
            default:
                alert("出错啦！");
                break;
        }
    }

    /**
     *  头部背景  默认自定义
     */
    exports.headerBgEvent = function() {
        switch($(this).val()) {
            case "default":
                $("#leftSidebar_header .setting_bg .content").hide();
                editUtils.setBgColor($("#webHeader"),"#E4E6E9");
                editUtils.setBgImg($("#webHeader"),"");
                // 保存更新
                updateBS('header_bg_colorpicker',"#E4E6E9");
                updateBS('header_bg',"default");

                break;
            case "hide":
                $("#leftSidebar_header .setting_bg .content").hide();
                editUtils.setBgColor($("#webHeader"), "");
                editUtils.setBgImg($("#webHeader"),"");
                // 保存更新
                updateBS('header_bg_colorpicker',"");
                updateBS('header_bg',"hide");
                break;
            case "custom":
                $("#leftSidebar_header .setting_bg .content").show();
                var imgSrc = $("#header_bg_img img").attr("src");
                if (imgSrc != undefined){
                    var val = $("select[name='header_bg_showStyle']").val();
                    if (val!= "no") { editUtils.setBgImg($("#webHeader"), imgSrc);}
                    headerBgShowStyle(val);
                } else {
                    $("#header_bg_img").hide();
                    $("#header_bg_img img").removeAttr("src");
                    editUtils.setBgColor($("#webHeader"), $('#header_bg_colorpicker').colorpicker("getValue"));
                }
                // 保存更新
                updateBS('header_bg',"custom");
                break;
            default:
                alert("出错啦！11");
                break;
        }
    }

    /**
     * 头部图片展示方式
     */
    exports.headerBgShowStyleEvent = function () {
        headerBgShowStyle($(this).val());
    }

    /**
     * 头部边框事件
     * @param val
     * @param $border_heightSlider
     */
    exports.headerBorderEvent = function (val,$border_heightSlider) {
        switch(val) {
            case "hide":
                $("#leftSidebar_header .setting_border .content").hide();
                $("#webHeader").css("border-bottom","");
                // 保存更新
                updateBS('header_border',"hide");
                break;
            case "custom":
                $("#leftSidebar_header .setting_border .content").show();
                var color = $('#header_border_colorpicker').colorpicker("getValue");
                var width = $border_heightSlider.slider('option', 'value');
                var style = $("select[name='header_border_showStyle']").val();
                $("#webHeader").css("border-bottom",width+"px  "+style+" "+color);
                updateBS('header_border',"custom");
                break;
            default:
                alert("出错啦！");
                break;
        }
    }

    /**
     * 头部高度
     * @param val
     * @param $footer_heightSpinner
     */
    exports.headerHeightEvent = function (val,$header_heightSpinner) {
        switch(val) {
            case "default":
                $("#leftSidebar_header .setting_height .content").hide();
                editUtils.setHeight($("#webHeader"),"100px");
                // 保存更新
                updateBS('header_height',"default");
                updateBS('headerWidthSlider',"100");
                updateBS('headerWidthSpiner',"100");
                break;
            case "custom":
                $("#leftSidebar_header .setting_height .content").show();
                editUtils.setHeight($("#webHeader"),$header_heightSpinner.val()+"px");
                // 保存更新
                updateBS('header_height',"custom");
                updateBS('headerWidthSlider',$header_heightSpinner.val());
                updateBS('headerWidthSpiner',$header_heightSpinner.val());
                break;
            default:
                alert("出错啦！");
                break;
        }
    }



    /**
     * 底部高度
     * @param val
     * @param $footer_heightSpinner
     */
    exports.footerHeightEvent = function (val,$footer_heightSpinner) {
        switch(val) {
            case "default":
                $("#leftSidebar_footer .setting_height .content").hide();
                // 高度100px
                editUtils.setHeight($("#webFooter"),"80px");
                // 保存更新
                updateBS('footer_height',"default");
                updateBS('footer_heightSlider',"80");
                updateBS('footer_heightSpinner',"80");
                break;
            case "custom":
                $("#leftSidebar_footer .setting_height .content").show();
                editUtils.setHeight($("#webFooter"),$footer_heightSpinner.val()+"px");
                // 保存更新
                updateBS('footer_height',"custom");
                updateBS('footer_heightSlider',$footer_heightSpinner.val());
                updateBS('footer_heightSpinner',$footer_heightSpinner.val());
                break;
            default:
                alert("出错啦！");
                break;
        }
    }


    exports.footerBgEvent =function () {
        switch($(this).val()) {
            case "default":
                $("#leftSidebar_footer .setting_bg .content").hide();
                editUtils.setBgColor($("#webFooter"),"#222222");
                // 保存更新
                updateBS('footer_bg',"default");
                updateBS('footer_bg_colorpicker',"#222222");
                break;
            case "custom":
                $("#leftSidebar_footer .setting_bg .content").show();
                editUtils.setBgColor($("#webFooter"),$('#footer_bg_colorpicker').colorpicker("getValue"));
                // 保存更新
                updateBS('footer_bg',"custom");
                updateBS('footer_bg_colorpicker',$('#footer_bg_colorpicker').colorpicker("getValue"));
                break;
            default:
                alert("出错啦！");
                break;
        }
    }

});