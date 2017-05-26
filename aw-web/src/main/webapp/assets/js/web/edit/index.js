/**
 * Created by zzr on 2017/4/28.
 */
seajs.use(['lodash','componentutils','../../../assets/js/web/edit/basesetting', 'gridstack', 'jquery.SuperSlide','jquery.newsbox'], function ( _,componentUtils,baseSettingUtils) {

    $(function () {
        //  侧边栏初始化
        function updateBS(key,value) {
            // 保存更新
            baseSettingUtils.baseSettingMap[key]['bsValue'] = value;
            baseSettingUtils.updateBsMap[key] = baseSettingUtils.baseSettingMap[key];
        }

        // 基础数据
        var baseSettingMap  = baseSettingUtils.baseSettingMap;
        // 1.1背景-背景
        var bg_bg_Data = baseSettingMap['bg_bg'];
        var bg_bg_color_Data = baseSettingMap['background_background-colorpicker'];
        var bg_bg_img_Data = baseSettingMap['bgBgPic'];
        var bg_bg_showStyle_Data = baseSettingMap['bg_bg_showStyle'];

        $("#mainContent").css("background-color",bg_bg_color_Data.bsValue);
        // 自定义要设置图片及显示样式
        if(bg_bg_Data.bsValue == "custom" && bg_bg_img_Data.bsValue !=""){
            $("#mainContent").css('background-image',"url("+ctx+bg_bg_img_Data.bsValue+")");
            var showStyle = bg_bg_showStyle_Data.bsValue;
            if (showStyle == "no-repeat" || showStyle == "repeat-y" || showStyle =="repeat-x"){
                $("#mainContent").css("background-repeat",showStyle);
            } else{
                $("#mainContent").css("background-size",showStyle);
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

        // logo设置
        $("#webLogo").draggable({
            containment: ".inner_header", scroll: false,
            opacity: 0.35,
            stop: function (event, ui) {
                updateBS("logo_x",ui.position.left);
                updateBS("logo_y",ui.position.top);

            }
        });
        $("#webLogo").resizable({
            stop: function(event, ui) {
                updateBS("logo_height",ui.size.height);
                updateBS("logo_width",ui.size.width);
            }
        });

        // title设置
        $("#webTitle").draggable({
            containment: ".inner_header", scroll: false,
            opacity: 0.35,
            stop: function (event, ui) {
                updateBS("title_x",ui.position.left);
                updateBS("title_y",ui.position.top);
            }
        });

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

        /**
         * 初始化横幅
         */
        $(".slideBox").slide({ mainCell: ".bd ul", effect: banner_animation_Data.bsValue,autoPlay:true, delayTime:bannerModal_delayTimeSpinner_Data.bsValue,interTime:bannerModal_interTimeSpinner_Data.bsValue});




        //////////////////////////////////////////////////////////////////////////////

        $(".styleDesignBtnContainer button.btn-info").on("click", function () {
            getContentData();
            debugger
            $.ajax({
                type: "POST",
                url: ctx + "/web/edit/updateSettings/"+currentHref,
                data: JSON.stringify(baseSettingUtils.updateBsMap),
                contentType: "application/json",
                cache: false,
                success: function (res) {
                    if (res == null) {
                        alert("获取系统配置出错了");
                    } else {
                        basesettingMap = res;
                    }
                }, error: function () {
                    alert("获取系统配置出错了");
                }
            });
        });

        function getContentData() {
           var data =  gridMethod.save_grid();
           $.each(data,function (index,obj) {
               baseSettingUtils.updateBsMap["qw"+index] = obj;
           });
        }



        //////////////////////////////////////////////////////////////////////////////
        var options = {
            auto: false,
            float: true,
            vertical_margin: 0,
            cell_height: 10,
            always_show_resize_handle: false

        };


        // 第一种布局
        var serialized_data =[];
        var currentHref ="";
        var aaa = document.URL;
        var href = aaa.replace("editPage","getContent");
        $.ajax({
            type: "GET",
            url: href,
            dataType:"json",
            async: false,
            cache: false,
            success: function (res) {
                serialized_data = res.data;
                currentHref = serialized_data[0].comumnId;
            }, error: function () {
                alert("获取系统配置出错了");
    }
        });


        var html = '<div class="editLayer"><ul> <li><a>删除</a></li></ul> </div>';


        function contentType(node) {
            switch (node.componentId) {
                case "default":
                    return '<div componentId="default"  class="addNewModule"></div>';
                    break;
                case "component_login":
                    return componentUtils.memberLogin();
                    break;
                case "component_register":
                    return componentUtils.memberRegister();
                    break;
                case "component_bulletinBoard":
                    var context = {
                        news: [
                            {
                                time: '2017/05/06',
                                title: '地球炸啦'
                            },
                            {
                                time: '2017/05/06',
                                title: '哈哈哈哈'
                            },
                            {
                                time: '2017/05/06',
                                title: '哈哈哈哈'
                            },
                            {
                                time: '2017/05/06',
                                title: '哈哈哈哈'
                            },
                            {
                                time: '2017/05/06',
                                title: '哈哈哈哈'
                            },
                            {
                                time: '2017/05/06',
                                title: '哈哈哈哈'
                            }
                        ]
                    };
                    return componentUtils.bulletinBoard(context);
                    break;
                case "component_messageBoard":
                    return componentUtils.messageBoard();
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
                   var model=  demoGrid.add_widget($('<div><div class="grid-stack-item-content">'+content+'</div>'+html),node.positionX, node.positionY, node.sizeWidth, node.sizeHeight);
debugger
                    if(node.componentId == 'component_bulletinBoard'){
                        $(model).find(".grid-stack-item-content .bulletinBoard-content").bootstrapNews({
                             newsPerPage: 5,
                             autoplay: true,
                             pauseOnHover: true,
                             direction: 'up',
                             newsTickerInterval: 4000,
                             onToDo: function () {
                                //console.log(this);
                             }
                         });
                    }
                });
            },
            save_grid: function () {
                var data = _.map($('.grid-stack > .grid-stack-item:visible'), function (el,index) {
                    el = $(el);
                    var node = el.data('_gridstack_node');
                    return {
                        positionX: node.x,
                        positionY: node.y,
                        sizeWidth: node.width,
                        sizeHeight: node.height,
                        componentId:el.find(".grid-stack-item-content div:first").attr("componentId"),
                        comumnId:currentHref
                    };
                });
                return data;
            },
            add_widget:function(data){
                $.each(data,function (index,value) {
                    demoGrid.add_widget($('<div><div class="grid-stack-item-content"><div componentId="default"  class="addNewModule"></div></div>'+html),
                        value.x, value.y, value.width,value.height);
                });

            },
            delete_widget:function () {
                demoGrid.remove_widget();
            }

        };


        gridMethod.load_grid(serialized_data);

        // 删除模块
        $("#webContainer ").on("click",".grid-stack .editLayer",function () {
            var parent = $(this).parent();
            demoGrid.remove_widget(parent);
            return ;
        });

        // 内容区域添加模块
        $("#webContainer .addModel.editLayer").on("click",function () {
            var add_data = [{x: 0, y: 0, width: 12, height: 20}];
            gridMethod.add_widget(add_data);
        });

        var content;
        /**
         * 点击添加图片
         */

        $("#webContainer").on("click",".grid-stack-item-content .addNewModule",function () {
            debugger
            content = $(this).parent();
            $("#componentModal").modal("show");
        });

        /**
         * 组件->添加
         */
        $(":radio[name='componentModal_component']").click(function() {
            $("#componentModal").modal("hide");
            debugger
            switch($(this).val()) {
                case "component_login":
                    $(content).empty().html(componentUtils.memberLogin());
                    break;
                case "component_bulletinBoard":
                    var context = {
                        news : [
                            {
                                time: '2017/05/06',
                                title: '地球炸啦'
                            },
                            {
                                time: '2017/05/06',
                                title: '哈哈哈哈'
                            },
                            {
                                time: '2017/05/06',
                                title: '哈哈哈哈'
                            },
                            {
                                time: '2017/05/06',
                                title: '哈哈哈哈'
                            },
                            {
                                time: '2017/05/06',
                                title: '哈哈哈哈'
                            },
                            {
                                time: '2017/05/06',
                                title: '哈哈哈哈'
                            }
                        ]};
                    $(content).empty().html( componentUtils.bulletinBoard(context));
                    $(content).find(".bulletinBoard-content").bootstrapNews({
                        newsPerPage: 5,
                        autoplay: true,
                        pauseOnHover: true,
                        direction: 'up',
                        newsTickerInterval: 4000,
                        onToDo: function() {
                            //console.log(this);
                        }
                    });
                    break;
                case "component_messageBoard":
                    $(content).empty().html(componentUtils.messageBoard());
                    break;
                case "component_register":
                    $(content).empty().html(componentUtils.memberRegister());
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });

    });


});
