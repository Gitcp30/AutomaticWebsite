/**
 * Created by zzr on 2017/4/28.
 */
seajs.use(['jquery', 'lodash','componentutils','baseSettingUtils', 'gridstack', 'jquery.SuperSlide','jquery.newsbox'], function ($, _,componentUtils,baseSettingUtils) {


    var options = {
        auto: false,
        float: true,
        vertical_margin: 0,
        cell_height: 10,
        always_show_resize_handle: false

    };


    $(function () {

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
            $("#mainContent").css("background-image",ctx+bg_bg_img_Data.bsValue);
            var showStyle = bg_bg_showStyle_Data.bsValue;
            if (showStyle == "no-repeat" || showStyle == "repeat-y" || showStyle =="repeat-x"){
                $("#mainContent").css("background-repeat",showStyle);
            } else{
                $("#mainContent").css("background-size",showStyle);
            }
        }

        // 1.2背景-宽度
        var bg_WidthSlider_Data = baseSettingMap['bgWidthSlider'];
        $("#mainContent").css("width",bg_WidthSlider_Data.bsValue+"%");

        // 2.1头部-背景
        var header_bg_Data = baseSettingMap['header_bg'];
        var header_bg_color_Data = baseSettingMap['header_bg_colorpicker'];
        var header_bg_img_Data = baseSettingMap['headerBgPic'];
        var header_bg_showStyle_Data = baseSettingMap['header_bg_showStyle'];

        $("#webHeader").css("background-color",header_bg_color_Data.bsValue);
        // 自定义要设置图片及显示样式
        if(header_bg_Data.bsValue == "custom" && header_bg_img_Data.bsValue !=""){
            $("#webHeader").css("background-image",ctx+header_bg_img_Data.bsValue);
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


        // 4.1内容宽度
        var content_widthSlider_Data = baseSettingMap['content_widthSlider'];
        $("#webContainer").css("width",content_widthSlider_Data.bsValue+"%");

        // 4.2.1内容边距上
        var content_marginTopSlider_Data = baseSettingMap['content_marginTopSlider'];
        $("#webContainer").css("margin-top",content_marginTopSlider_Data.bsValue+"%");

        // 4.2.2内容边距下
        var content_marginBottomSlider_Data = baseSettingMap['content_marginBottomSlider'];
        $("#webContainer").css("margin-bottom",content_marginBottomSlider_Data.bsValue+"%");

        // 5.1底部-高度
        var footer_heightSlider_Data = baseSettingMap['footer_heightSlider'];
        $("#webFooter").css("height",footer_heightSlider_Data.bsValue+"px");

        // 5.2底部-背景
        var footer_bg_colorpicker_Data = baseSettingMap['footer_bg_colorpicker'];
        $("#webFooter").css("background-color",footer_bg_colorpicker_Data.bsValue);
        // 5.3底部-栏目文字

        var footer_linktext_colorpicker_Data = baseSettingMap['footer_linktext_colorpicker'];
        var footer_linkhover_colorpicker_Data = baseSettingMap['footer_linkhover_colorpicker'];
        $("#webFooter .inner_footer .footLinks a").css("color",footer_linktext_colorpicker_Data.bsValue);
        $("#webFooter .inner_footer .footLinks a").change(function() {
            $(".inner_footer .footLinks a").hover(function(){
                $(this).css("color",footer_linkhover_colorpicker_Data.bsValue);
            },function(){
                $(this).css("color",footer_linktext_colorpicker_Data.bsValue+" !important");
            });
        });

//////////////////////////////////////////////////////////////////////////////

        //1










        /**
         * 初始化横幅
         */
        $(".slideBox").slide({mainCell: ".bd ul", effect: "top", autoPlay: true, delayTime: 500, interTime: 2500});
        /**
         * 底部编辑栏点击确定
         */
        $("a[data-target=#footerModal]").on("click", function () {
            var copyrightHtml = $("#webFooter div.footCpy").html();
            $("#copyright-editor").html(copyrightHtml);
        });


        /**
         * logo设置
         */
        $("#webLogo").draggable({
            containment: ".inner_header", scroll: false,
            opacity: 0.35,
            stop: function (event, ui) {
                //   debugger
            }
        });
        $("#webLogo").resizable();

        /*
         * title设置
         */
        $("#webTitle").draggable({
            containment: ".inner_header", scroll: false,
            stop: function (event, ui) {
                //   debugger
            }
        });

        // 第一种布局
        var serialized_data = [
            {x: 0, y: 0, width: 3, height: 30},
            {x: 4, y: 0, width: 9, height: 30},
        ];


/*
        var serialized_data = [
            {x: 0, y: 0, width: 12, height: 30},
        ];*/

        var html = '<div class="editLayer"><ul> <li><a>删除</a></li></ul> </div>';


        $('.grid-stack').gridstack(options);
        var demoGrid = $('.grid-stack').data('gridstack');

        var gridMethod = {
            load_grid: function (data) {
                demoGrid.remove_all();
                var items = GridStackUI.Utils.sort(data);
                _.each(items, function (node) {
                    demoGrid.add_widget($('<div><div class="grid-stack-item-content"><div class="addNewModule"></div></div>'+html),
                        node.x, node.y, node.width, node.height);

                });
            },
            save_grid: function () {
                var data = _.map($('.grid-stack > .grid-stack-item:visible'), function (el) {
                    el = $(el);
                    var node = el.data('_gridstack_node');
                    return {
                        x: node.x,
                        y: node.y,
                        width: node.width,
                        height: node.height
                    };
                });
                return JSON.stringify(data, null, ' ');
            },
            add_widget:function(){
                demoGrid.add_widget($('<div><div class="grid-stack-item-content">1adddada</div>'+html),
                   8, 8, 2, 2);
            },
            delete_widget:function () {
                demoGrid.remove_widget();
            }

        };


        gridMethod.load_grid(serialized_data);

        $("#getData").on("click",function () {
            var aa = gridMethod.save_grid();
            gridMethod.add_widget();
            var aa = gridMethod.save_grid();
        });

        $("#webContainer .grid-stack .editLayer").on("click",function () {
            var self = this;
            var parent = $(this).parent();
            demoGrid.remove_widget(parent);
            return ;
        });


        var content;
        /**
         * 点击添加图片
         */

        $("#webContainer .grid-stack-item-content .addNewModule").on("click",function () {
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
                default:
                    alert("出错啦！");
                    break;
            }
        });

    });


});
