/**
 * Created by zzr on 2017/5/4.
 */

define(function(require, exports, module) {

    var $ = require('jquery');
    var editUtils = require("editutils");

    exports.bgBgEvent =  function (val) {
        debugger
        switch (val) {
            case "default":
                $("#leftSidebar_background .setting_background .content").hide();
                editUtils.setBgColor($("#mainContent"), "#E4E6E9");
                editUtils.setBgColor($("#webHeader"), "");
                editUtils.setBgImg($("#mainContent"), "");
                break;
            case "custom":
                $("#leftSidebar_background .setting_background .content").show();
                var imgSrc = $("#bg_bg_img img").attr("src");
                if (imgSrc != undefined) {
                    editUtils.setBgImg($("#mainContent"), imgSrc);
                } else {
                    $("#bg_bg_img").hide();
                    $("#bg_bg_img img").removeAttr("src");
                    editUtils.setBgColor($("#mainContent"), $('#background_background-colorpicker').val());
                    $("select[name='bg_bg_showStyle'] option:first-child").prop("selected", 'selected');
                }
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
});