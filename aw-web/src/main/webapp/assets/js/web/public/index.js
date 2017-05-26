/**
 * Created by zzr on 2017/4/28.
 */
seajs.use(['jquery', 'lodash','componentutils','phoenix.util', 'gridstack', 'jquery.SuperSlide','jquery.newsbox','jquery-ui.custom','phoenix.date','phoenix.form', 'bootstrap','ace-elements', 'ace','jquery-validate'], function ($, _,componentUtils,phoenixUtils) {


    $(function () {

        // 基础数据
        var baseSettingMap  = "";
        // 内容布局
        var serialized_data =[];

        var company_url = document.URL.split("/")[5];
        var company_page = document.URL.split("/")[6];
        debugger
        $.ajax({
            type: "POST",
            url: ctx + "/qw/getBaseSettings",
            data:{
                companyUrl:company_url,
                companyPage:company_page
            },
            dataType: 'json',
            cache: false,
            async: false,
            success: function (res) {
                if(res == null){
                    alert("获取系统配置出错了");
                } else {
                    baseSettingMap = res;
                    serialized_data = baseSettingMap.webContentList;
                }
            }, error: function () {
                alert("获取系统配置出错了");
            }
        });

        // 1.1背景-背景
        var bg_bg_Data = baseSettingMap['bg_bg'];
        var bg_bg_color_Data = baseSettingMap['background_background-colorpicker'];
        var bg_bg_img_Data = baseSettingMap['bgBgPic'];
        var bg_bg_showStyle_Data = baseSettingMap['bg_bg_showStyle'];

        $("body").css("background-color",bg_bg_color_Data.bsValue);
        // 自定义要设置图片及显示样式
        if(bg_bg_Data.bsValue == "custom" && bg_bg_img_Data.bsValue !=""){
            $("body").css('background-image',"url("+ctx+bg_bg_img_Data.bsValue+")");
            var showStyle = bg_bg_showStyle_Data.bsValue;
            if (showStyle == "no-repeat" || showStyle == "repeat-y" || showStyle =="repeat-x"){
                $("body").css("background-repeat",showStyle);
            } else{
                $("body").css("background-size",showStyle);
            }
        }

        // 1.2背景-宽度
        var bg_WidthSlider_Data = baseSettingMap['bgWidthSlider'];
        /*$("#mainContent").css("width",bg_WidthSlider_Data.bsValue+"%");*/


        $(".inner_header").css("width",bg_WidthSlider_Data.bsValue+"%");
        $("#webMenu .inner_menu").css("width",bg_WidthSlider_Data.bsValue+"%");
        $("#webBanner").css("width",bg_WidthSlider_Data.bsValue+"%");
        $("#webContainer").css("width",bg_WidthSlider_Data.bsValue+"%");
        $(".inner_footer").css("width",bg_WidthSlider_Data.bsValue+"%");


        // 2.1头部-背景
        var header_bg_Data = baseSettingMap['header_bg'];
        var header_bg_color_Data = baseSettingMap['header_bg_colorpicker'];
        var header_bg_img_Data = baseSettingMap['headerBgPic'];
        var header_bg_showStyle_Data = baseSettingMap['header_bg_showStyle'];

        $("#webHeader").css("background-color",header_bg_color_Data.bsValue);
        // 自定义要设置图片及显示样式
        if(header_bg_Data.bsValue == "custom" && header_bg_img_Data.bsValue !=""){
            $("#webHeader").css("background-image","url("+ctx+header_bg_img_Data.bsValue+")");
            var showStyle = header_bg_showStyle_Data.bsValue;
            if (showStyle == "no-repeat" || showStyle == "repeat-y" || showStyle =="repeat-x"){
                $("#webHeader").css("background-repeat",showStyle);
            } else{
                $("#webHeader").css("background-size",showStyle);
            }
        }

        // 2.2头部-底部边框
        var header_border_Data = baseSettingMap['header_border'];
        var header_border_color_Data = baseSettingMap['header_border_colorpicker'];
        var header_border_height_Data = baseSettingMap['borderHeightSlider'];
        var header_border_showStyle_Data = baseSettingMap['header_border_showStyle'];
        // 底部边框自定义
        if(header_border_Data.bsValue == 'custom'){
            var color = header_border_color_Data.bsValue;
            var width = header_border_height_Data.bsValue;
            var style = header_border_showStyle_Data.bsValue;
            $("#webHeader").css("border-bottom",width+"px  "+style+" "+color);
        }

        // 2.3头部-高度
        var header_WidthSlider_Data = baseSettingMap['headerWidthSlider'];
        $("#webHeader").css("height",header_WidthSlider_Data.bsValue+"px");

        // 3.1横幅-宽度
        var banner_widthSlider_Data = baseSettingMap['banner_widthSlider'];
        $("#webBanner").css("width",banner_widthSlider_Data.bsValue+"%");

        // 3.2横幅-高度
        var banner_heightSlider_Data = baseSettingMap['banner_heightSlider'];
        $("#webBanner").css("height",banner_heightSlider_Data.bsValue+"px");
        // 要设置横幅slide的高度
        $(".slideBox .bd li").css("height",banner_heightSlider_Data.bsValue+"px");

        // 4.1内容宽度
        var content_widthSlider_Data = baseSettingMap['content_widthSlider'];
        $("#webContainer").css("width",content_widthSlider_Data.bsValue+"%");

        // 4.2.1内容边距上
        var content_marginTopSlider_Data = baseSettingMap['content_marginTopSlider'];
        $("#webContainer").css("margin-top",content_marginTopSlider_Data.bsValue+"px");

        // 4.2.2内容边距下
        var content_marginBottomSlider_Data = baseSettingMap['content_marginBottomSlider'];
        $("#webContainer").css("margin-bottom",content_marginBottomSlider_Data.bsValue+"px");

        // 5.1底部-高度
        var footer_heightSlider_Data = baseSettingMap['footer_heightSlider'];
        $("#webFooter").css("height",footer_heightSlider_Data.bsValue+"px");

        // 5.2底部-背景
        var footer_bg_colorpicker_Data = baseSettingMap['footer_bg_colorpicker'];
        $("#webFooter").css("background-color",footer_bg_colorpicker_Data.bsValue);

        // 5.3底部-栏目文字
        var footer_linktext_colorpicker_Data = baseSettingMap['footer_linktext_colorpicker'];
        var footer_linkhover_colorpicker_Data = baseSettingMap['footer_linkhover_colorpicker'];
        var footer_textSlider_Data = baseSettingMap['footer_textSlider'];
        $(".inner_footer .footLinks a").css("font-size",footer_textSlider_Data.bsValue + "px");

        $("#webFooter .inner_footer .footLinks a").css("color",footer_linktext_colorpicker_Data.bsValue);
            $("#webFooter .inner_footer .footLinks a").hover(function(){
                $(this).css("color",footer_linkhover_colorpicker_Data.bsValue);
            },function(){
                $(this).css("color",footer_linktext_colorpicker_Data.bsValue);
            });

        // 5.1菜单栏颜色
        var menu_colorpicker_Data = baseSettingMap['menu_colorpicker'];
        // 5.2菜单栏选项颜色
        var menu_bg_colorpicker_Data = baseSettingMap['menu_bg_colorpicker'];
        // 5.3文字颜色
        var menu_font_colorpicker_Data = baseSettingMap['menu_font_colorpicker'];
        // 5.4选中颜色
        var menu_selectItem_colorpicker_Data = baseSettingMap['menu_selectItem_colorpicker'];
        // 5.5菜单栏长度
        var menu_widthSlider_Data = baseSettingMap['menu_widthSlider'];

        $("#webMenu").css("background-color",menu_colorpicker_Data.bsValue);
        $("#webMenu .inner_menu ul").css("background-color",menu_bg_colorpicker_Data.bsValue);
        $("#webMenu .inner_menu ul li a").css("color",menu_font_colorpicker_Data.bsValue);
        $("#webMenu .inner_menu ul li a").hover(
            //当鼠标放上去的时候,程序处理
            function(){
                $(this).css("background-color",menu_selectItem_colorpicker_Data.bsValue);
            },
            //当鼠标离开的时候,程序处理
            function(){
                $(this).css("background-color",menu_bg_colorpicker_Data.bsValue);
            }
        );

        $("#webMenu .inner_menu").css("width",menu_widthSlider_Data.bsValue + "%");


        // 头部logo
        var opacity_logoSlider_Data = baseSettingMap['opacity_logoSlider'];
        var logoPic_Data = baseSettingMap['logoPic'];
        var radius_logoSlider_Data = baseSettingMap['radius_logoSlider'];
        var logo_x_Data = baseSettingMap['logo_x'];
        var logo_y_Data = baseSettingMap['logo_y'];
        var logo_height_Data = baseSettingMap['logo_height'];
        var logo_width_Data = baseSettingMap['logo_width'];
        var webTitle_Data = baseSettingMap['webTitle'];
        var title_x_Data = baseSettingMap['title_x'];
        var title_y_Data = baseSettingMap['title_y'];

        $("#webLogo .weblogo-content img").attr("src",ctx+logoPic_Data.bsValue);
        $("#webLogo .weblogo-content img").css("opacity",opacity_logoSlider_Data.bsValue/100);
        $("#webLogo .weblogo-content img").css("border-radius",radius_logoSlider_Data.bsValue + "%");
        $("#webLogo").css("left",logo_x_Data.bsValue+"px");
        $("#webLogo").css("top",logo_y_Data.bsValue+"px");
        $("#webLogo").css("height",logo_height_Data.bsValue);
        $("#webLogo").css("width",logo_width_Data.bsValue);

        $("#webTitle span").html(webTitle_Data.bsValue);
        $("#webTitle").css("left",title_x_Data.bsValue+"px");
        $("#webTitle").css("top",title_y_Data.bsValue+"px");

//////////////////////////////////////////////////////////////////////////////

        // 横幅信息
        var banner_pattern_Data = baseSettingMap['banner_pattern'];
        var banner_animation_Data = baseSettingMap['banner_animation'];
        var bannerModal_interTimeSpinner_Data = baseSettingMap['bannerModal_interTimeSpinner'];
        var bannerModal_delayTimeSpinner_Data = baseSettingMap['bannerModal_delayTimeSpinner'];

        switch (banner_pattern_Data.bsValue) {
            case "numSilde":
                $("#webBanner #slideBox a.prev,#webBanner #slideBox a.next").hide();
                $("#webBanner #slideBox .hd").show();
                break;
            case "arrowSilde":
                $("#webBanner #slideBox .hd").hide();
                $("#webBanner #slideBox a.prev,#webBanner #slideBox a.next").show();
                break;
            default:
                alert("选择横幅样式错误！");
                break;
        }

        // 初始化横幅
        $(".slideBox").slide({ mainCell: ".bd ul", effect: banner_animation_Data.bsValue,autoPlay:true, delayTime:bannerModal_delayTimeSpinner_Data.bsValue,interTime:bannerModal_interTimeSpinner_Data.bsValue});


        //////////////////////////////////////////////////////////////////////////////
        var options = {
            auto: false,
            float: true,
            vertical_margin: 0,
            cell_height: 10,
            always_show_resize_handle: false,
        };

        function contentType(node) {
            debugger
            switch (node.componentId) {
                case "default":
                    return '<div></div>';
                    break;
                case "component_login":
                    return componentUtils.memberLogin();
                    break;
                case "component_register":
                    return componentUtils.memberRegister();
                    break;
                case "component_bulletinBoard":
                    var context = { };
                    $.ajax({
                        type: "POST",
                        url: ctx + "/qw/getBulletinBoard",
                        data:{
                            companyUrl:company_url,
                        },
                        dataType: 'json',
                        cache: false,
                        async: false,
                        success: function (res) {
                            if(res == null){
                                alert("获取系统配置出错了");
                            } else {
                                $.each(res,function (index,row) {
                                    res[index].createTime =  dateFormatter(row.createTime);
                                })
                                context = {news:res};
                            }
                        }, error: function () {
                            alert("获取系统配置出错了");
                        }
                    });
                    return componentUtils.bulletinBoard(context);
                    break;
                case "component_messageBoard":
                    return componentUtils.messageBoard();
                    break;
                case "component_product":
                    var context = { };
                    $.ajax({
                        type: "POST",
                        url: ctx + "/qw/getProduct",
                        data:{
                            companyUrl:company_url,
                        },
                        dataType: 'json',
                        cache: false,
                        async: false,
                        success: function (res) {
                            if(res == null){
                                alert("获取系统配置出错了");
                            } else {
                                $.each(res,function (index,row) {
                                    res[index].createTime =  dateFormatter(row.createTime);
                                    res[index].state = stateFormatter(row.state);
                                })
                                context = {product:res};
                            }
                        }, error: function () {
                            alert("获取系统配置出错了");
                        }
                    });
                    return componentUtils.product(context);
                    break;
                case company_page:
                    var bbId = company_page.split("bbId=")[1];
                    debugger
                    var context = {};
                    $.ajax({
                        type: "POST",
                        url: ctx + "/qw/getBulletinBoardDetail",
                        data:{
                            bullentinBoardId:bbId,
                        },
                        dataType: 'json',
                        cache: false,
                        async: false,
                        success: function (res) {
                            if(res == null){
                                alert("获取系统配置出错了");
                            } else {
                                res.createTime =  dateFormatter(res.createTime);
                                context = res;
                            }
                        }, error: function () {
                            alert("获取系统配置出错了");
                        }
                    });
                    return componentUtils.bulletinBoardDetail(context);
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        };

        $('.grid-stack').gridstack(options);
        var demoGrid = $('.grid-stack').data('gridstack');

        var gridMethod = {
            load_grid: function (data) {
                demoGrid.remove_all();
                var items = GridStackUI.Utils.sort(data);
                _.each(items, function (node) {
                    var content = contentType(node);
                    var model=  demoGrid.add_widget($('<div><div class="grid-stack-item-content">'+content+'</div>'),node.positionX, node.positionY, node.sizeWidth, node.sizeHeight);
                    debugger
                    if(node.componentId == 'component_bulletinBoard'){
                        $(model).find(".grid-stack-item-content .bulletinBoard-content").bootstrapNews({
                            newsPerPage: 5,
                            autoplay: false,
                            pauseOnHover: true,
                            direction: 'up',
                            newsTickerInterval: 4000,
                            onToDo: function () {
                                // console.log(this);
                            }
                        });
                        $(model).find(".grid-stack-item-content .bulletinBoard-content .news-item a").on('click',function () {
                            window.open(ctx +"/qw/"+company_url+"/bullentinBoardDetail?bbId="+$(this).attr('data-bbId'),'_blank');
                            return false;
                        });
                        // 留言板
                    }
                    else if(node.componentId == 'component_messageBoard'){
                       $(model).find(".grid-stack-item-content .messageBoard button").on('click',function () {
                            var data = $('.messageBoardForm').toObject();
                            if(data.userName == "" || data.mailBox == "" || data.content == ""){
                                layer.msg("信息不完整，请继续输入！");
                            } else {
                                debugger
                                var temp = $.extend({}, data, {companyId:company_url});
                                phoenixUtils.jsonAjaxRequest(ctx+'/qw/saveMessageBoard',temp,function (res) {
                                    if(res.code == 0){
                                        $('.messageBoardForm').reset();
                                        layer.msg("保存成功！");
                                    }else {
                                        layer.msg(res.message);
                                    }
                                });
                            }
                           return false;
                       });
                       // 登录
                    }
                    else if(node.componentId == 'component_login'){
                        $(model).find(".grid-stack-item-content .user_login button").on('click',function () {
                            var data = $('.loginForm').toObject();
                            debugger
                            if(data.loginName == "" || data.password == ""){
                                layer.msg("信息不完整，请继续输入！");
                            } else {
                               $.extend(data, {companyUrl:company_url});
                                phoenixUtils.jsonAjaxRequest(ctx+'/qw/login',data,function (res) {
                                    if(res.code == 0){
                                        $('.loginForm').reset();
                                        // 设置名称号码
                                        window.location.reload();
                                    }else {
                                        layer.msg(res.message);
                                    }
                                });
                            }
                            return false;
                        });
                    }
                    else if(node.componentId == 'component_register'){
                        var $form = $(model).find(".grid-stack-item-content .registerForm");
                        $(model).find(".grid-stack-item-content .memberRegister button").on('click',function () {
                            var data = $('.registerForm').toObject();
                            debugger
                            // 前端验证
                            if($form.valid()){
                                // 提交表单
                                $.extend(data, {companyUrl:company_url});
                                phoenixUtils.jsonAjaxRequest(ctx+'/qw/memberRegister',data,function (res) {
                                    if(res.code == 0){
                                        $('.registerForm').reset();
                                        layer.msg("注册成功，等待审核");
                                    }else {
                                        layer.msg(res.message);
                                    }
                                });
                            }

                            return false;
                        });
                        // 用户注册form验证
                        $form.validate({
                            errorElement: 'div',
                            errorClass: 'help-block',
                            focusInvalid: false,
                            ignore: "",
                            rules: {
                                mailbox: {
                                    required: true,
                                    email:true,
                                    remote: {
                                        type: "post",
                                        //请求方式
                                        url: ctx+"/register/checkMailbox",     //发送请求的url地址
                                        data: {
                                            mailbox: function(){
                                                return $("#mailbox").val();
                                            }
                                        },
                                        dataType: "json",        //发送的数据类型
                                        dataFilter: function(res) { //返回结果
                                            res = $.parseJSON(res);
                                            if (res.code == "0") {
                                                return true;
                                            }else {
                                                return false;
                                            }
                                        }
                                    }
                                },
                                password: {
                                    required: true,
                                    minlength: 6,
                                    maxlength:16
                                },
                                password2: {
                                    required: true,
                                    minlength: 6,
                                    maxlength:16,
                                    equalTo: "#password"
                                }
                            },

                            messages: {
                                mailbox: {
                                    required: "请输入注册邮箱！",
                                    email: "请输入合法的邮箱地址！",
                                    remote:"输入邮箱已存在或公司正在审核中！"
                                },
                                password: {
                                    required: "请输入6-16位数字，字母等组成的密码！",
                                    minlength: "密码长度为6-16位！",
                                    maxlength:"密码长度为6-16位！"
                                },
                                password2: {
                                    required: "请输入6-16位数字，字母等组成的密码！",
                                    minlength: "密码长度为6-16位！",
                                    maxlength:"密码长度为6-16位！",
                                    equalTo: "与输入密码不匹配！"
                                }
                            },


                            highlight: function (e) {
                                $(e).closest('.form-group').removeClass('has-success').addClass('has-error');
                            },

                            success: function (e) {
                                $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
                                $(e).remove();
                            },

                            errorPlacement: function (error, element) {
                                error.insertAfter(element.parent());
                            },

                            submitHandler: function (form) {
                            },
                            invalidHandler: function (form) {
                            }
                        });

                    }
                });
            }

        };


        gridMethod.load_grid(serialized_data);

        demoGrid.movable('.grid-stack-item', false);
        demoGrid.resizable('.grid-stack-item', false);

    });


    // 点击退出登录
    $("#navbar .navbar-header .ace-nav").find(".islogin a.loginout").on("click",function () {
        phoenixUtils.jsonAjaxRequest(ctx+'/qw/loginout',{},function (res) {
            if(res.code == 0){
                window.location.reload();
            }else {
                layer.msg(res.message);
            }
        });
        return false;
    });



    var dateFormatter = function(value,row,index){
        return (new Date(value)).phoenixDateFormat("yyyy/MM/dd");
    }

    // 状态转化
    var stateFormatter = function (value) {
        debugger
        switch (value){
            case 0:return '正常';break;
            case 1:return '停用';break;
            case 2:return '置顶';break;
            default:return'未说明';break;
        }
    }

});
