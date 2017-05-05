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
        }
        else if (val == "no-repeat" || val == "repeat-y" || val =="repeat-x"){
            editUtils.setBgRepeat($("#mainContent"),val);
            editUtils.setBgSize($("#mainContent"),"");
        } else{
            editUtils.setBgSize($("#mainContent"),val);
            editUtils.setBgRepeat($("#mainContent"),"");
        }
    }

    exports.bgBgEvent =  function () {
        switch ($(this).val()) {
            case "default":
                $("#leftSidebar_background .setting_background .content").hide();
                editUtils.setBgColor($("#mainContent"), "#E4E6E9");
                editUtils.setBgImg($("#mainContent"), "");
                // 保存更新
                baseSettingUtils.baseSettingMap['background_background-colorpicker']['bsValue'] = "#E4E6E9";
                baseSettingUtils.updateBsMap['background_background-colorpicker'] = baseSettingUtils.baseSettingMap['background_background-colorpicker'];
                baseSettingUtils.baseSettingMap['bg_bg']['bsValue'] = "default";
                baseSettingUtils.updateBsMap['bg_bg'] = baseSettingUtils.baseSettingMap['bg_bg'];
                break;
            case "hide":
                $("#leftSidebar_background .setting_background .content").hide();
                editUtils.setBgColor($("#mainContent"),"");
                editUtils.setBgImg($("#mainContent"),"");
                // 保存更新
                baseSettingUtils.baseSettingMap['background_background-colorpicker']['bsValue'] = " ";
                baseSettingUtils.updateBsMap['background_background-colorpicker'] = baseSettingUtils.baseSettingMap['background_background-colorpicker'];
                baseSettingUtils.baseSettingMap['bg_bg']['bsValue'] = "hide";
                baseSettingUtils.updateBsMap['bg_bg'] = baseSettingUtils.baseSettingMap['bg_bg'];
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
                    $("select[name='bg_bg_showStyle'] option:first-child").prop("selected", 'selected');
                }
                // 保存更新
                baseSettingUtils.baseSettingMap['bg_bg']['bsValue'] = "custom";
                baseSettingUtils.updateBsMap['bg_bg'] = baseSettingUtils.baseSettingMap['bg_bg'];
                break;
            default:
                alert("出错啦！");
                break;
        }
    };

    exports.bgbgShowStyleEvent = function(){
        var val = $(this).val();
        if (val == "no"){
            //$("#bg_bg_img").hide();
            $("#bg_bg_img img").removeAttr("src");
            editUtils.setBgImg($("#mainContent"),"");
            editUtils.setBgSize($("#mainContent"),"");
            editUtils.setBgRepeat($("#mainContent"),"");
        }
        else if (val == "no-repeat" || val == "repeat-y" || val =="repeat-x"){
            editUtils.setBgRepeat($("#mainContent"),val);
            editUtils.setBgSize($("#mainContent"),"");
        } else{
            editUtils.setBgSize($("#mainContent"),val);
            editUtils.setBgRepeat($("#mainContent"),"");
        }
    }


    exports.bgBgShowStyleEvent = function () {
        bgBgShowStyle($(this).val());
    }




});