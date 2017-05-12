seajs.use(['componentutils', '../../../assets/js/web/edit/editutils', '../../../assets/js/web/edit/basesetting', '../../../assets/js/web/edit/initUtils', 'jquery-ui.custom', 'spinbox', 'colorbox', 'bootstrap-wysiwyg', 'jquery.hotkeys.index', 'bootstrap-duallistbox', 'nestable', 'bootstrap-colorpicker', 'phoenix'], function (componentUtils, editUtils, baseSettingUtils, initUtils) {

    // 初始化基础数据
    baseSettingUtils.baseSettingMap = baseSettingUtils.getBaseSettings();
    // 基础数据
    var baseSettingMap = baseSettingUtils.baseSettingMap;

    $(function () {

        // 格式设置面板
        var $panes = $(".panes");
        //格式设置面板上的按钮
        var $showPanelBtn = $(".showPanelBtn i");
        // 当前获取图片框的状态
        var pic_state = "";

        $panes.hide();

        /**
         * 设置格式面板显示|隐藏
         */
        $(".showPanelBtn").click(function () {
            if ($showPanelBtn.hasClass('glyphicon-chevron-down')) {
                $showPanelBtn.removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
                $panes.show();
                $("#close-left-menu-btn").trigger("click");
            } else {
                $showPanelBtn.removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
                $panes.hide();
            }
        });
        /**
         * 直接点击格式面板按钮，设置格式面板显示
         */
        $("#styleDesign .nav a").click(function () {
            $showPanelBtn.removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
            $panes.show();
            $("#close-left-menu-btn").trigger("click");
        });

        /**
         * 网站内容区域显示
         */
        $("#mainContent").load(ctx + "/web/edit/index");

        /**
         * 侧边栏生成
         */
        $('.modal.aside').ace_aside();

        /**
         * 侧边栏出现时，设置格式面板要隐藏
         */
        $("#leftSidebar .aside-trigger").click(function () {
            $showPanelBtn.removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
            $panes.hide();
        });


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //  侧边栏初始化
        function updateBS(key, value) {
            // 保存更新
            baseSettingUtils.baseSettingMap[key]['bsValue'] = value;
            baseSettingUtils.updateBsMap[key] = baseSettingUtils.baseSettingMap[key];
        }

        // 1.1背景-背景
        var bg_bg_Data = baseSettingMap['bg_bg'];
        var bg_bg_color_Data = baseSettingMap['background_background-colorpicker'];
        var bg_bg_img_Data = baseSettingMap['bgBgPic'];
        var bg_bg_showStyle_Data = baseSettingMap['bg_bg_showStyle'];

        // 初始化图片
        if (bg_bg_img_Data.bsValue != '') {
            $("#bg_bg_img").show();
            $("#bg_bg_img img").attr("src", ctx + bg_bg_img_Data.bsValue);
        }

        if (bg_bg_Data.bsValue == "default" || bg_bg_Data.bsValue == "hide") {
            $("#leftSidebar_background .setting_background .content").hide();
        }

        $(":radio[name='bg_bg'][value='" + bg_bg_Data.bsValue + "']").prop("checked", "checked");

        // 初始化背景颜色改变框(背景->背景)
        $('#background_background-colorpicker').colorpicker({
            color: bg_bg_color_Data.bsValue,
            align: 'left',
            colorSelectors: {
                'white': '#ffffff',
                'black': '#000000',
                'red': '#FF0000',
                'default': '#777777',
                'primary': '#337ab7',
                'success': '#5cb85c',
                'info': '#5bc0de',
                'warning': '#f0ad4e',
                'danger': '#d9534f'
            }
        }).on('changeColor', function (e) {
            editUtils.setBgColor($("#mainContent"), e.color.toHex());
            $('#background_background-colorpicker').colorpicker('hide');
            // 保存更新
            updateBS('background_background-colorpicker', e.color.toHex());
        });

        $("select[name='bg_bg_showStyle']").val(bg_bg_showStyle_Data.bsValue);

        // 背景->背景
        $(":radio[name='bg_bg']").on("click", initUtils.bgBgEvent);

        // 背景--背景--自定义显示方式
        $("select[name='bg_bg_showStyle']").change(initUtils.bgBgShowStyleEvent);


        // 1.2背景-宽度

        var bg_width_Data = baseSettingMap['bg_width'];
        var bg_WidthSlider_Data = baseSettingMap['bgWidthSlider'];

        if (bg_width_Data.bsValue == "default") {
            $("#leftSidebar_background .setting_width .content").hide();
        }
        $(":radio[name='bg_width'][value='" + bg_width_Data.bsValue + "']").prop("checked", "checked");



        // 背景->宽度
        $(":radio[name='bg_width']").on("click", function () {
           // initUtils.bgWidthEvent($(this).val(), $widthSpinner);
            switch($(this).val()) {
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
        });





        // 初始化  滑动条(背景->宽度)
        var $widthSlider = $("#leftSidebar_background .setting_width .ui-slider-blue");
        $widthSlider.css({width: '90%', 'float': 'left', margin: '15px'}).each(function () {
            // read initial values from markup and remove that
            $(this).empty().slider({
                value: bg_WidthSlider_Data.bsValue,
                range: "min",
                min: 30,
                max: 100,
                animate: true,
                slide: function (event, ui) {
                    $widthSpinner.val(ui.value);
                    setIndexBgSize(ui.value);
                }
            });
        });

        // 初始化数字改变框(背景->宽度)
        var $widthSpinner = $("#leftSidebar_background .setting_width .spiner input");
        $widthSpinner.ace_spinner({
            value: bg_WidthSlider_Data.bsValue,
            min: 30,
            max: 100,
            step: 1,
            btn_up_class: 'btn-info',
            btn_down_class: 'btn-info'
        })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function () {
                $widthSlider.slider("value", $widthSpinner.val());
                setIndexBgSize($widthSpinner.val());
            });

        function setIndexBgSize(value) {
            $(".inner_header").css("width", value + "%");
            $("#webMenu .inner_menu").css("width", value + "%");
            $("#webBanner").css("width", value + "%");
            $("#webContainer").css("width", value + "%");
            $(".inner_footer").css("width", value + "%");
            updateBS("bgWidthSlider", value);
            updateBS("bgWidthSpiner", value);
            updateBS("menu_widthSlider", value);
            updateBS("banner_widthSlider", value);
            updateBS("banner_widthSpinner", value);
            updateBS("content_widthSlider", value);
            updateBanner();
        }


        // 2.1头部-背景
        var header_bg_Data = baseSettingMap['header_bg'];
        var header_bg_color_Data = baseSettingMap['header_bg_colorpicker'];
        var header_bg_img_Data = baseSettingMap['headerBgPic'];
        var header_bg_showStyle_Data = baseSettingMap['header_bg_showStyle'];


        // 初始化图片
        if (header_bg_img_Data.bsValue != '') {
            $("#header_bg_img").show();
            $("#header_bg_img img").attr("src", ctx + header_bg_img_Data.bsValue);
        }

        if (header_bg_Data.bsValue == "default" || header_bg_Data.bsValue == "hide") {
            $("#leftSidebar_header .setting_bg .content").hide();
        }

        $(":radio[name='header_bg'][value='" + header_bg_Data.bsValue + "']").prop("checked", "checked");

        // 初始化背景颜色改变框(顶部->背景)
        $('#header_bg_colorpicker').colorpicker({
            color: header_bg_color_Data.bsValue,
            align: 'left',
            colorSelectors: {
                'white': '#ffffff',
                'black': '#000000',
                'red': '#FF0000',
                'default': '#777777',
                'primary': '#337ab7',
                'success': '#5cb85c',
                'info': '#5bc0de',
                'warning': '#f0ad4e',
                'danger': '#d9534f'
            }
        }).on('changeColor', function (e) {
            editUtils.setBgColor($("#webHeader"), e.color.toHex());
            $('#header_bg_colorpicker').colorpicker('hide');
            // 保存更新
            updateBS('header_bg_colorpicker', e.color.toHex());
        });

        $("select[name='header_bg_showStyle']").val(header_bg_showStyle_Data.bsValue);

        // 顶部->背景
        $(":radio[name='header_bg']").on("click", initUtils.headerBgEvent);

        // 顶部--背景--自定义显示方式
        $("select[name='header_bg_showStyle']").change(initUtils.headerBgShowStyleEvent);

        // 背景--背景--添加图片点击
        $("#leftSidebar_background button[data-target=#picModal]").on("click", function () {
            // $("#close-left-menu-btn").trigger("click");
            //1取消其他选中的图片（由于只能选中一张图片）
            var $tocancel = $("#picModal_sys .toSelectGallery .text a[data-target='tocancel']");
            cancelSelectPic($tocancel);
            pic_state = "SET_BG";
        });

        // 顶部--背景--添加图片点击
        $("#leftSidebar_header button[data-target=#picModal]").on("click", function () {
            // $("#close-left-menu-btn").trigger("click");
            //1取消其他选中的图片（由于只能选中一张图片）
            var $tocancel = $("#picModal_sys .toSelectGallery .text a[data-target='tocancel']");
            cancelSelectPic($tocancel);
            pic_state = "SET_HEADER";
        });


        // 2.2头部-底部边框
        var header_border_Data = baseSettingMap['header_border'];
        var header_border_color_Data = baseSettingMap['header_border_colorpicker'];
        var header_border_height_Data = baseSettingMap['borderHeightSlider'];
        var header_border_showStyle_Data = baseSettingMap['header_border_showStyle'];

        if (header_border_Data.bsValue == "hide") {
            $("#leftSidebar_header .setting_border .content").hide();
        }
        $(":radio[name='header_border'][value='" + header_border_Data.bsValue + "']").prop("checked", "checked");

        $("select[name='header_border_showStyle']").val(header_border_showStyle_Data.bsValue);

        // 顶部->边框
        $(":radio[name='header_border']").on("click", function () {
            initUtils.headerBorderEvent($(this).val(), $border_heightSlider);
        });

        // 初始化背景颜色改变框(顶部->边框)
        $('#header_border_colorpicker').colorpicker({
            color: header_border_color_Data.bsValue,
            align: 'left',
            colorSelectors: {
                'white': '#ffffff',
                'black': '#000000',
                'red': '#FF0000',
                'default': '#777777',
                'primary': '#337ab7',
                'success': '#5cb85c',
                'info': '#5bc0de',
                'warning': '#f0ad4e',
                'danger': '#d9534f'
            }
        }).on('changeColor', function (e) {
            $("#webHeader").css("border-bottom-color", e.color.toHex());
            $('#header_border_colorpicker').colorpicker('hide');
            // 保存更新
            updateBS('header_border_colorpicker', e.color.toHex());
        });

        // 初始化  滑动条(顶部->边框)
        var $border_heightSlider = $("#leftSidebar_header .setting_border .ui-slider-blue");
        $border_heightSlider.css({width: '90%', 'float': 'left', margin: '15px 15px 15px 0'}).each(function () {
            $(this).empty().slider({
                value: header_border_height_Data.bsValue,
                range: "min",
                min: 0,
                max: 50,
                animate: true,
                slide: function (event, ui) {
                    $("#webHeader").css("border-bottom-width", ui.value + "px");
                    // 保存更新
                    updateBS('borderHeightSlider', ui.value);
                }
            });
        });

        // 顶部--背景--自定义显示方式
        $("select[name='header_border_showStyle']").change(function () {
            $("#webHeader").css("border-bottom-style", $(this).val());
            // 保存更新
            updateBS('header_border_showStyle', $(this).val());
        });


        // 2.3头部-高度
        var header_height_Data = baseSettingMap['header_height'];
        var header_WidthSlider_Data = baseSettingMap['headerWidthSlider'];
        var headerWidthSpiner_Data = baseSettingMap['headerWidthSpiner'];


        if (header_height_Data.bsValue == "default") {
            $("#leftSidebar_header .setting_height .content").hide();
        }
        $(":radio[name='header_height'][value='" + header_height_Data.bsValue + "']").prop("checked", "checked");

        // 顶部->高度
        $(":radio[name='header_height']").on("click", function () {
            initUtils.headerHeightEvent($(this).val(), $header_heightSpinner);
        });

        // 初始化  滑动条(顶部->高度)
        var $header_heightSlider = $("#leftSidebar_header .setting_height .ui-slider-blue");
        $header_heightSlider.css({width: '90%', 'float': 'left', margin: '15px'}).each(function () {
            $(this).empty().slider({
                value: header_WidthSlider_Data.bsValue,
                range: "min",
                min: 50,
                max: 200,
                animate: true,
                slide: function (event, ui) {
                    $header_heightSpinner.val(ui.value);
                    editUtils.setHeight($("#webHeader"), ui.value + "px");
                    // 保存更新
                    updateBS('headerWidthSlider', ui.value);

                }
            });
        });
        // 初始化数字改变框(顶部->高度)
        var $header_heightSpinner = $("#leftSidebar_header .setting_height .spiner input");
        $header_heightSpinner.ace_spinner({
            value: 100,
            min: 50,
            max: 200,
            step: 5,
            btn_up_class: 'btn-info',
            btn_down_class: 'btn-info'
        })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function () {
                $header_heightSlider.slider("value", $header_heightSpinner.val());
                editUtils.setHeight($("#webHeader"), $header_heightSpinner.val() + "px");
                // 保存更新
                updateBS('headerWidthSpiner', $header_heightSpinner.val() + "px");
            });


        // 3.1横幅-宽度
        var banner_width_Data = baseSettingMap['banner_width'];
        var banner_widthSlider_Data = baseSettingMap['banner_widthSlider'];
        var banner_widthSpinner_Data = baseSettingMap['banner_widthSpinner'];

        if (banner_width_Data.bsValue == "default") {
            $("#leftSidebar_banner .setting_width .content").hide();
        }
        $(":radio[name='banner_width'][value='" + banner_width_Data.bsValue + "']").prop("checked", "checked");


        // 横幅->宽度
        $(":radio[name='banner_width']").on("click", function () {
            switch ($(this).val()) {
                case "default":
                    $("#leftSidebar_banner .setting_width .content").hide();
                    // 宽度100%
                    editUtils.setWidth($("#webBanner"), "100%");
                    // 保存更新
                    updateBS('banner_width', "default");
                    updateBS('banner_widthSlider', "100");
                    updateBS('banner_widthSpinner', "100");
                    // 更新横幅状态
                    updateBanner();
                    break;
                case "custom":
                    $("#leftSidebar_banner .setting_width .content").show();
                    editUtils.setWidth($("#webBanner"), $banner_widthSpinner.val() + "%");
                    // 保存更新
                    updateBS('banner_width', "custom");
                    updateBS('banner_widthSlider', $banner_widthSpinner.val());
                    updateBS('banner_widthSpinner', $banner_widthSpinner.val());
                    // 更新横幅状态
                    updateBanner();
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });

        // 初始化  滑动条(横幅->宽度)
        var $banner_widthSlider = $("#leftSidebar_banner .setting_width .ui-slider-blue");
        $banner_widthSlider.css({width: '90%', 'float': 'left', margin: '15px'}).each(function () {
            $(this).empty().slider({
                value: banner_widthSlider_Data.bsValue,
                range: "min",
                min: 30,
                max: 100,
                animate: true,
                slide: function (event, ui) {
                    $banner_widthSpinner.val(ui.value);
                    editUtils.setWidth($("#webBanner"), ui.value + "%");
                    // 保存更新
                    updateBS('banner_widthSlider', ui.value);
                    updateBS('banner_widthSpinner', ui.value);
                    updateBanner();
                }
            });
        });

        // 初始化数字改变框(横幅->宽度)
        var $banner_widthSpinner = $("#leftSidebar_banner .setting_width .spiner input");
        $banner_widthSpinner.ace_spinner({
            value: banner_widthSpinner_Data.bsValue,
            min: 30,
            max: 100,
            step: 5,
            btn_up_class: 'btn-info',
            btn_down_class: 'btn-info'
        })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function () {

                $banner_widthSlider.slider("value", $banner_widthSpinner.val());
                editUtils.setWidth($("#webBanner"), $banner_widthSpinner.val() + "%");
                // 保存更新
                updateBS('banner_widthSlider', $banner_widthSpinner.val());
                updateBS('banner_widthSpinner', $banner_widthSpinner.val());
                updateBanner();
            });


        // 3.2横幅-高度
        var banner_height_Data = baseSettingMap['banner_height'];
        var banner_heightSlider_Data = baseSettingMap['banner_heightSlider'];
        var banner_heightSpinner_Data = baseSettingMap['banner_heightSpinner'];

        if (banner_height_Data.bsValue == "default") {
            $("#leftSidebar_banner .setting_height .content").hide();
        }
        $(":radio[name='banner_height'][value='" + banner_height_Data.bsValue + "']").prop("checked", "checked");


        // 横幅->高度
        $(":radio[name='banner_height']").click(function () {
            switch ($(this).val()) {
                case "default":
                    $("#leftSidebar_banner .setting_height .content").hide();
                    // 宽度100%
                    editUtils.setHeight($("#webBanner"), "350px");
                    // 保存更新
                    updateBS('banner_height', "default");
                    updateBS('banner_heightSlider', "350");
                    updateBS('banner_heightSpinner', "350");
                    // 更新横幅状态
                    updateBanner();
                    break;
                case "custom":
                    $("#leftSidebar_banner .setting_height .content").show();
                    editUtils.setHeight($("#webBanner"), $banner_heightSpinner.val() + "px");
                    // 保存更新
                    updateBS('banner_height', "custom");
                    updateBS('banner_heightSlider', $banner_heightSpinner.val());
                    updateBS('banner_heightSpinner', $banner_heightSpinner.val());// 更新横幅状态
                    updateBanner();
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });


        // 初始化  滑动条(横幅->高度)
        var $banner_heightSlider = $("#leftSidebar_banner .setting_height .ui-slider-blue");
        $banner_heightSlider.css({width: '90%', 'float': 'left', margin: '15px'}).each(function () {
            // read initial values from markup and remove that
            $(this).empty().slider({
                value: banner_heightSlider_Data.bsValue,
                range: "min",
                min: 200,
                max: 500,
                animate: true,
                slide: function (event, ui) {
                    $banner_heightSpinner.val(ui.value);
                    editUtils.setHeight($("#webBanner"), ui.value + "px");
                    // 保存更新
                    updateBS('banner_heightSlider', ui.value);
                    updateBS('banner_heightSpinner', ui.value);
                    updateBanner();
                }
            });
        });
        /**
         * 初始化数字改变框(横幅->高度)
         */
        var $banner_heightSpinner = $("#leftSidebar_banner .setting_height .spiner input");
        $banner_heightSpinner.ace_spinner({
            value: banner_heightSpinner_Data.bsValue,
            min: 200,
            max: 500,
            step: 10,
            btn_up_class: 'btn-info',
            btn_down_class: 'btn-info'
        })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function () {
                $banner_heightSlider.slider("value", $banner_heightSpinner.val());
                editUtils.setHeight($("#webBanner"), $banner_heightSpinner.val() + "px");
                // 保存更新
                updateBS('banner_heightSlider', $banner_heightSpinner.val());
                updateBS('banner_heightSpinner', $banner_heightSpinner.val());
                updateBanner();

            });


        // 4.1内容宽度
        var content_widthSlider_Data = baseSettingMap['content_widthSlider'];

        // 初始化  滑动条(内容->宽度)
        var $content_widthSlider = $("#leftSidebar_content .setting_width .ui-slider-blue");
        $content_widthSlider.css({width: '90%', 'float': 'left', margin: '15px 15px 15px 0'}).each(function () {
            $(this).empty().slider({
                value: content_widthSlider_Data.bsValue,
                range: "min",
                min: 30,
                max: 100,
                animate: true,
                slide: function (event, ui) {
                    $("#webContainer").css("width", ui.value + "%");
                    // 保存更新
                    updateBS('content_widthSlider', ui.value);
                }
            });
        });

        // 4.2.1内容边距上
        var content_marginTopSlider_Data = baseSettingMap['content_marginTopSlider'];

        // 初始化  滑动条(内容->边距---上边距)
        var $content_marginTopSlider = $("#leftSidebar_content .setting_margin .settingMarginTop .ui-slider-blue");
        $content_marginTopSlider.css({width: '90%', 'float': 'left', margin: '15px 15px 15px 0'}).each(function () {
            $(this).empty().slider({
                value: content_marginTopSlider_Data.bsValue,
                range: "min",
                min: 0,
                max: 100,
                animate: true,
                slide: function (event, ui) {
                    $("#webContainer").css("margin-top", ui.value + "px");
                    // 保存更新
                    updateBS('content_marginTopSlider', ui.value);
                }
            });
        });
        // 4.2.2内容边距下
        var content_marginBottomSlider_Data = baseSettingMap['content_marginBottomSlider'];
        // 初始化  滑动条(内容->边距---下边距)
        var $content_marginBottomSlider = $("#leftSidebar_content .setting_margin .settingMarginbottom  .ui-slider-blue");
        $content_marginBottomSlider.css({width: '90%', 'float': 'left', margin: '15px 15px 15px 0'}).each(function () {
            $(this).empty().slider({
                value: content_marginBottomSlider_Data.bsValue,
                range: "min",
                min: 0,
                max: 100,
                animate: true,
                slide: function (event, ui) {
                    $("#webContainer").css("margin-bottom", ui.value + "px");
                    // 保存更新
                    updateBS('content_marginBottomSlider', ui.value);
                }
            });
        });


        // 5.1底部-高度
        var footer_height_Data = baseSettingMap['footer_height'];
        var footer_heightSlider_Data = baseSettingMap['footer_heightSlider'];
        var footer_heightSpinner_Data = baseSettingMap['footer_heightSpinner'];

        if (footer_height_Data.bsValue == "default") {
            $("#leftSidebar_footer .setting_height .content").hide();
        }
        $(":radio[name='footer_height'][value='" + footer_height_Data.bsValue + "']").prop("checked", "checked");

        // 底部->高度
        $(":radio[name='footer_height']").click(function () {
            initUtils.footerHeightEvent($(this).val(), $footer_heightSpinner);
        });

        // 初始化  滑动条(底部->高度)
        var $footer_heightSlider = $("#leftSidebar_footer .setting_height .ui-slider-blue");
        $footer_heightSlider.css({width: '90%', 'float': 'left', margin: '15px'}).each(function () {
            $(this).empty().slider({
                value: footer_heightSlider_Data.bsValue,
                range: "min",
                min: 0,
                max: 200,
                animate: true,
                slide: function (event, ui) {
                    $footer_heightSpinner.val(ui.value);
                    editUtils.setHeight($("#webFooter"), ui.value + "px");
                    // 保存更新
                    updateBS('footer_heightSlider', ui.value);
                    updateBS('footer_heightSpinner', ui.value);
                }
            });
        });
        // 初始化数字改变框(底部->高度)
        var $footer_heightSpinner = $("#leftSidebar_footer .setting_height .spiner input");
        $footer_heightSpinner.ace_spinner({
            value: footer_heightSpinner_Data.bsValue,
            min: 0,
            max: 200,
            step: 5,
            btn_up_class: 'btn-info',
            btn_down_class: 'btn-info'
        })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function () {
                $footer_heightSlider.slider("value", $footer_heightSpinner.val());
                editUtils.setHeight($("#webFooter"), $footer_heightSpinner.val() + "px");
                // 保存更新
                updateBS('footer_heightSlider', $footer_heightSpinner.val());
                updateBS('footer_heightSpinner', $footer_heightSpinner.val());
            });


        // 5.2底部-背景

        var footer_bg_Data = baseSettingMap['footer_bg'];
        var footer_bg_colorpicker_Data = baseSettingMap['footer_bg_colorpicker'];


        if (footer_bg_Data.bsValue == "default") {
            $("#leftSidebar_footer .setting_bg .content").hide();
        }
        $(":radio[name='footer_bg'][value='" + footer_bg_Data.bsValue + "']").prop("checked", "checked");

        // 底部->背景
        $(":radio[name='footer_bg']").on("click", initUtils.footerBgEvent);

        $('#footer_bg_colorpicker').colorpicker({
            color: footer_bg_colorpicker_Data.bsValue,
            align: 'left',
            colorSelectors: {
                'white': '#ffffff',
                'black': '#000000',
                'red': '#FF0000',
                'default': '#777777',
                'primary': '#337ab7',
                'success': '#5cb85c',
                'info': '#5bc0de',
                'warning': '#f0ad4e',
                'danger': '#d9534f'
            }
        }).on('changeColor', function (e) {
            editUtils.setBgColor($("#webFooter"), e.color.toHex());
            $('#footer_bg_colorpicker').colorpicker('hide');
            // 保存更新
            updateBS('footer_bg_colorpicker', e.color.toHex());
        });


        // 5.3底部-栏目文字
        var footer_linktext_Data = baseSettingMap['footer_linktext'];
        var footer_linktext_colorpicker_Data = baseSettingMap['footer_linktext_colorpicker'];
        var footer_linkhover_colorpicker_Data = baseSettingMap['footer_linkhover_colorpicker'];
        var footer_textSlider_Data = baseSettingMap['footer_textSlider'];

        if (footer_linktext_Data.bsValue == "default") {
            $("#leftSidebar_footer .setting_linktext .content").hide();
        }
        $(":radio[name='footer_linktext'][value='" + footer_linktext_Data.bsValue + "']").prop("checked", "checked");
        // 底部->栏目字体---大小
        $(":radio[name='footer_linktext']").click(function () {
            switch ($(this).val()) {
                case "default":
                    $("#leftSidebar_footer .setting_linktext .content").hide();
                    // 1字体默认 font-size: 14px; 2.颜色默认color: #8b939d;color: #ffffff
                    $(".inner_footer .footLinks a").css("color", "#8b939d");
                    $(".inner_footer .footLinks a").hover(function () {
                        $(this).css("color", "#ffffff");
                    }, function () {
                        $(this).css("color", "#8b939d");
                    });
                    $(".inner_footer .footLinks a").css("font-size", "14px");

                    // 保存更新
                    updateBS('footer_linktext', "default");
                    updateBS('footer_linktext_colorpicker', "#8b939d");
                    updateBS('footer_linkhover_colorpicker', "#ffffff");
                    updateBS('footer_textSlider', "14");
                    break;

                case "custom":
                    $("#leftSidebar_footer .setting_linktext .content").show();

                    $(".inner_footer .footLinks a").css("color", $('#footer_linktext_colorpicker').colorpicker("getValue"));
                    $(".inner_footer .footLinks a").hover(function () {
                        $(this).css("color", $('#footer_linkhover_colorpicker').colorpicker("getValue"));
                    }, function () {
                        $(this).css("color", $('#footer_linktext_colorpicker').colorpicker("getValue"));
                    });
                    var size = $footer_textSlider.slider('option', 'value');
                    $(".inner_footer .footLinks a").css("font-size", size);

                    // 保存更新
                    updateBS('footer_linktext', "custom");
                    updateBS('footer_linktext_colorpicker', $('#footer_linktext_colorpicker').colorpicker("getValue"));
                    updateBS('footer_linkhover_colorpicker', $('#footer_linkhover_colorpicker').colorpicker("getValue"));
                    updateBS('footer_textSlider', size);
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });


        // 初始化字体颜色改变框(底部 ->字体)
        $('#footer_linktext_colorpicker').colorpicker({
            color: footer_linktext_colorpicker_Data.bsValue,
            align: 'left',
            colorSelectors: {
                'white': '#ffffff',
                'black': '#000000',
                'red': '#FF0000',
                'default': '#777777',
                'primary': '#337ab7',
                'success': '#5cb85c',
                'info': '#5bc0de',
                'warning': '#f0ad4e',
                'danger': '#d9534f'
            }
        }).on('changeColor', function (e) {
            editUtils.setTextColor($(".inner_footer .footLinks a"), e.color.toHex());
            $('#footer_linktext_colorpicker').colorpicker('hide');
            // 保存更新
            updateBS('footer_linktext_colorpicker', e.color.toHex());
        });

        // 初始化字体颜色改变框(底部 ->鼠标悬浮字体)
        $('#footer_linkhover_colorpicker').colorpicker({
            color: footer_linkhover_colorpicker_Data.bsValue,
            align: 'left',
            colorSelectors: {
                'white': '#ffffff',
                'black': '#000000',
                'red': '#FF0000',
                'default': '#777777',
                'primary': '#337ab7',
                'success': '#5cb85c',
                'info': '#5bc0de',
                'warning': '#f0ad4e',
                'danger': '#d9534f'
            }
        }).on('changeColor', function (e) {
            $('#footer_linkhover_colorpicker').colorpicker('hide');
            $(".inner_footer .footLinks a").hover(function () {
                $(this).css("color", e.color.toHex());
            }, function () {
                $(this).css("color", $('#footer_linktext_colorpicker').colorpicker("getValue") + " !important");
            });
            // 保存更新
            updateBS('footer_linkhover_colorpicker', e.color.toHex());
        });

        // 初始化  滑动条(底部->字体大小)
        var $footer_textSlider = $("#leftSidebar_footer .setting_linktext .ui-slider-blue");
        $footer_textSlider.css({width: '90%', 'float': 'left', margin: '15px'}).each(function () {
            $(this).empty().slider({
                value: footer_textSlider_Data.bsValue,
                range: "min",
                min: 5,
                max: 20,
                animate: true,
                slide: function (event, ui) {
                    $(".inner_footer .footLinks a").css("font-size", ui.value + "px");
                    updateBS('footer_textSlider', ui.value);
                }
            });
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

        // 初始化背景颜色改变框(菜单栏)
        $('#menu_colorpicker').colorpicker({
            color: menu_colorpicker_Data.bsValue,
            align: 'left',
            colorSelectors: {
                'white': '#ffffff',
                'black': '#000000',
                'red': '#FF0000',
                'default': '#777777',
                'primary': '#337ab7',
                'success': '#5cb85c',
                'info': '#5bc0de',
                'warning': '#f0ad4e',
                'danger': '#d9534f'
            }
        }).on('changeColor', function (e) {
            $('#menu_colorpicker').colorpicker('hide');
            $("#webMenu").css("background-color", e.color.toHex());
            // 保存更新
            updateBS('menu_colorpicker', e.color.toHex());
        });


        // 初始化背景颜色改变框(菜单栏->背景)
        $('#menu_bg_colorpicker').colorpicker({
            color: menu_bg_colorpicker_Data.bsValue,
            align: 'left',
            colorSelectors: {
                'white': '#ffffff',
                'black': '#000000',
                'red': '#FF0000',
                'default': '#777777',
                'primary': '#337ab7',
                'success': '#5cb85c',
                'info': '#5bc0de',
                'warning': '#f0ad4e',
                'danger': '#d9534f'
            }
        }).on('changeColor', function (e) {
            $('#menu_bg_colorpicker').colorpicker('hide');
            $("#webMenu .inner_menu ul").css("background-color", e.color.toHex());
            // 保存更新
            updateBS('menu_bg_colorpicker', e.color.toHex());
        });


        // 初始化背景颜色改变框(菜单栏->字体 )
        $('#menu_font_colorpicker').colorpicker({
            color: menu_font_colorpicker_Data.bsValue,
            align: 'left',
            colorSelectors: {
                'white': '#ffffff',
                'black': '#000000',
                'red': '#FF0000',
                'default': '#777777',
                'primary': '#337ab7',
                'success': '#5cb85c',
                'info': '#5bc0de',
                'warning': '#f0ad4e',
                'danger': '#d9534f'
            }
        }).on('changeColor', function (e) {
            $('#menu_font_colorpicker').colorpicker('hide');
            $("#webMenu .inner_menu ul li a").css("color", e.color.toHex());
            // 保存更新
            updateBS('menu_font_colorpicker', e.color.toHex());
        });


        // 初始化背景颜色改变框(菜单栏->选中颜色)
        $('#menu_selectItem_colorpicker').colorpicker({
            color: menu_selectItem_colorpicker_Data.bsValue,
            align: 'left',
            colorSelectors: {
                'white': '#ffffff',
                'black': '#000000',
                'red': '#FF0000',
                'default': '#777777',
                'primary': '#337ab7',
                'success': '#5cb85c',
                'info': '#5bc0de',
                'warning': '#f0ad4e',
                'danger': '#d9534f'
            }
        }).on('changeColor', function (e) {
            $('#menu_selectItem_colorpicker').colorpicker('hide');

            $("#webMenu .inner_menu ul li a").hover(
                //当鼠标放上去的时候,程序处理
                function () {
                    $(this).css("background-color", e.color.toHex());
                },
                //当鼠标离开的时候,程序处理
                function () {
                    $(this).css("background-color", $('#menu_bg_colorpicker').colorpicker('getValue', defaultValue));
                });

            // 保存更新
            updateBS('menu_selectItem_colorpicker', e.color.toHex());
        });


        //  初始化  修改菜单栏长度
        var $menu_widthSlider = $("#menuModal_width.ui-slider-blue");
        $menu_widthSlider.css({width: '90%', 'float': 'left', margin: '15px 15px 15px 0'}).each(function () {
            $(this).empty().slider({
                value: menu_widthSlider_Data.bsValue,
                range: "min",
                min: 20,
                max: 100,
                animate: true,
                slide: function (event, ui) {
                    $("#webMenu .inner_menu").css("width", ui.value + "%");
                    // 保存更新
                    updateBS('menu_widthSlider', ui.value);
                }
            });
        });


        // 头部logo
        var opacity_logoSlider_Data = baseSettingMap['opacity_logoSlider'];
        var logoPic_Data = baseSettingMap['logoPic'];
        var radius_logoSlider_Data = baseSettingMap['radius_logoSlider'];
        var webTitle_Data = baseSettingMap['webTitle'];

        $("#goloModal_pic .logoPic img").attr("src", ctx + logoPic_Data.bsValue);
        $("#webLogo .weblogo-content img").attr("src", ctx + logoPic_Data.bsValue);

        $("#goloModal_pic .logoPic img").css("opacity", opacity_logoSlider_Data.bsValue / 100);
        $("#webLogo .weblogo-content img").css("opacity", opacity_logoSlider_Data.bsValue / 100);

        $("#goloModal_pic .logoPic img").css("border-radius", radius_logoSlider_Data.bsValue + "%");
        $("#webLogo .weblogo-content img").css("border-radius", radius_logoSlider_Data.bsValue + "%");

        // 透明度
        var $opacity_logoSlider = $("#logoModal_opacity.ui-slider-blue");
        $opacity_logoSlider.css({width: '90%', 'float': 'left', margin: '15px 15px 15px 0'}).each(function () {
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: opacity_logoSlider_Data.bsValue,
                range: "min",
                min: 0,
                max: 100,
                animate: true,
                slide: function (event, ui) {
                    $("#goloModal_pic .logoPic img").css("opacity", ui.value / 100);
                    $("#webLogo .weblogo-content img").css("opacity", ui.value / 100);
                    updateBS("opacity_logoSlider", ui.value);
                }
            });
        });

        // 初始化  logo编辑框(修改图片圆角)
        var $radius_logoSlider = $("#logoModal_radius.ui-slider-blue");
        $radius_logoSlider.css({width: '90%', 'float': 'left', margin: '15px 15px 15px 0'}).each(function () {
            $(this).empty().slider({
                value: radius_logoSlider_Data.bsValue,
                range: "min",
                min: 0,
                max: 50,
                animate: true,
                slide: function (event, ui) {
                    $("#goloModal_pic .logoPic img").css("border-radius", ui.value + "%");
                    $("#webLogo .weblogo-content img").css("border-radius", ui.value + "%");
                    updateBS("radius_logoSlider", ui.value);
                }
            });
        });

        $("#goloModal_pic .logoPic img").on("click", function () {
            pic_state = "SET_LOGO";
            $("#picModal").modal("show");
        });

        $("#title-editor").html(webTitle_Data.bsValue);
        // 顶部title编辑框
        $('#title-editor').ace_wysiwyg({
            toolbar: ['font',
                null,
                'fontSize',
                null,
                {name: 'bold', className: 'btn-info'},
                {name: 'italic', className: 'btn-info'},
                {name: 'underline', className: 'btn-info'},
                null,
                'foreColor',
                null,
                {name: 'undo', className: 'btn-grey'},
                {name: 'redo', className: 'btn-grey'}
            ],
            'wysiwyg': {
                fileUploadError: function () {
                }
            }
        }).prev().addClass('wysiwyg-style2');

        // 设置标题信息
        $("#titlegoModal_footer_commitbtn").on("click", function () {
            var titleHtml = $("#title-editor").html();
            $("#webTitle span").html(titleHtml);
            updateBS("webTitle", titleHtml);
        });


        // 菜单栏---设置栏目
        $('#menuModal_menu .dd').nestable();

        $('#menuModal_menu .dd-handle a').on('mousedown', function (e) {
            e.stopPropagation();
        });

        /**
         * 选中栏目
         */
        $("#menuModal_menu li .action-buttons").find("a:first").on("click", function () {
            var $i = $(this).find("i");
            if ($i.hasClass("fa-check")) {
                $i.removeClass("fa-check").addClass("fa-close").parent().removeClass("green").addClass("red");
            } else {
                $i.removeClass("fa-close").addClass("fa-check").parent().removeClass("red").addClass("green");
            }


        });

        /**
         * 提交结果
         */
        $("#menuModal_footer_commitbtn").on("click", function () {

            $("#webMenu .inner_menu ul").empty();

            // 获取选中的栏目
            $("#menuModal_menu .dd-list li").map(function () {
                var $li = $(this).find(".fa-check");
                if ($li.length == 1) {
                    var text = $(this).find(".dd2-content .row div:first").text();
                    $("#webMenu .inner_menu ul").append('<li><a href="' + ctx + $(this).attr("data-href") + '">' + text + '</a></li>');
                }
            });
            // 初始化样式
            initMenuStyle();
            // 保存更新
            var id = $.map($("#menuModal_menu .dd-list li"), function (item) {
                var $li = $(item).find(".fa-check");
                if ($li.length == 1) {
                    return $(item).attr("data-id");
                }
            });
            var menus = id.join("/");
            updateBS("webMenu", menus);

        });


        function initMenuStyle() {
            $("#webMenu").css("background-color", menu_colorpicker_Data.bsValue);
            $("#webMenu .inner_menu ul").css("background-color", menu_bg_colorpicker_Data.bsValue);
            $("#webMenu .inner_menu ul li a").css("color", menu_font_colorpicker_Data.bsValue);
            $("#webMenu .inner_menu ul li a").hover(
                //当鼠标放上去的时候,程序处理
                function () {
                    $(this).css("background-color", menu_selectItem_colorpicker_Data.bsValue);
                },
                //当鼠标离开的时候,程序处理
                function () {
                    $(this).css("background-color", menu_bg_colorpicker_Data.bsValue);
                }
            );
        }


/////////////////////////////////////////////////////////////////////////////////////////////////////

        //底部栏目编辑框
        $('#copyright-editor').ace_wysiwyg({
            toolbar: [
                'font',
                null,
                'fontSize',
                null,
                {name: 'bold', className: 'btn-info'},
                {name: 'italic', className: 'btn-info'},
                {name: 'underline', className: 'btn-info'},
                null,
                {name: 'justifyleft', className: 'btn-primary'},
                {name: 'justifycenter', className: 'btn-primary'},
                {name: 'justifyright', className: 'btn-primary'},
                {name: 'justifyfull', className: 'btn-inverse'},
                null,
                'foreColor',
                null,
                {name: 'undo', className: 'btn-grey'},
                {name: 'redo', className: 'btn-grey'}
            ],
            'wysiwyg': {
                fileUploadError: function () {
                }
            }
        }).prev().addClass('wysiwyg-style2');


        $("#copyright-editor").html(baseSettingMap['webCopyRight'].bsValue);

        /**
         * 设置Copyright信息
         */
        $("#footerModal_footer_commitbtn").on("click", function () {
            var copyrightHtml = $("#copyright-editor").html();
            $("#webFooter div.footCpy").html(copyrightHtml);


            $("#webFooter .footLinks").empty();
            /*var link = $('select[name="footer_column"] option:selected').map(function(){
             $("#webFooter .footLinks").append('<span><a hidefocus="true" href="'+$(this).attr("OpHref")+'">'+$(this).val()+'</a></span>');
             return $(this).attr("OpId");
             });*/

            var link = $.map($('select[name="footer_column"] option:selected'), function (item) {
                $("#webFooter .footLinks").append('<span><a hidefocus="true" href="' + $(item).attr("OpHref") + '">' + $(item).val() + '</a></span>');
                return $(item).attr("OpId");
            });
            setLinkTestStyle();
            // 保存更新
            var links = link.join("/");
            var crHtml = copyrightHtml.replace("©", "&copy; ");
            updateBS("webCopyRight", crHtml);
            updateBS("webLink", links);
        });

        // 设置底部--链接字体样式
        function setLinkTestStyle() {
            $("#webFooter .inner_footer .footLinks a").css("font-size", footer_textSlider_Data.bsValue + "px");
            $("#webFooter .inner_footer .footLinks a").css("color", footer_linktext_colorpicker_Data.bsValue);
            $("#webFooter .inner_footer .footLinks a").hover(function () {
                $(this).css("color", footer_linkhover_colorpicker_Data.bsValue);
            }, function () {
                $(this).css("color", footer_linktext_colorpicker_Data.bsValue);
            });

        }


        /**
         *  选择栏目
         * @type {jQuery}
         */
        var footer_column = $('select[name="footer_column"]').bootstrapDualListbox({
            nonSelectedListLabel: '待选栏目',
            selectedListLabel: '已选栏目',
            infoText: false,
            showFilterInputs: false,
        });
        // 设置按钮样式
        var container = footer_column.bootstrapDualListbox('getContainer');
        container.find('.btn').addClass('btn-white btn-info btn-bold');


/////////////////////////////////////////////////////////////////////////////////////////////////////
        /**
         * 图片编辑框---素材库
         */
        var $picModal_overflow = '';
        var picModal_params = {
            rel: 'picModal_colorbox',
            reposition: true,
            scalePhotos: true,
            scrolling: false,
            previous: '<i class="ace-icon fa fa-arrow-left"></i>',
            next: '<i class="ace-icon fa fa-arrow-right"></i>',
            close: '&times;',
            current: '{current} of {total}',
            /*width:"500px",
             height:"500px",*/
            maxWidth: '100%',
            maxHeight: '100%',
            onOpen: function () {
                $picModal_overflow = document.body.style.overflow;
                document.body.style.overflow = 'hidden';
            },
            onClosed: function () {
                document.body.style.overflow = $picModal_overflow;
            },
            onComplete: function () {
                $.colorbox.resize();
            }
        };
        $('.ace-thumbnails [data-rel="picModal_colorbox"]').colorbox(picModal_params);


        /**
         * 图片编辑框---素材库 选中图片
         */

        $("#picModal_sys .toSelectGallery .text").on("click", "a[data-target='toadd']", function () {
            //1取消其他选中的图片（由于只能选中一张图片）
            var $tocancel = $("#picModal_sys .toSelectGallery .text a[data-target='tocancel']");
            cancelSelectPic($tocancel);
            // 2添加“使用”标记
            // 获取父节点li
            var $parentLi = $(this).parents("li:first");
            $parentLi.find('.tags:first').append("<span class='label label-success arrowed'>使用</span>");
            // 3 删除.fa-check-square-o改为fa-trash-o  data-target='toadd'-->todelete
            $(this).find("i").removeClass("fa-check-square-o").addClass("fa-trash-o");
            $(this).attr('data-target', 'tocancel');

        });

        /**
         *  图片编辑框---素材库  待选画廊取消选中图片
         */
        $("#picModal_sys .toSelectGallery .text").on("click", "a[data-target='tocancel']", function () {
            cancelSelectPic($(this));
        });

        // 取消选中图片方法
        function cancelSelectPic($obj) {
            // 1删除添加“使用”标记
            // 获取父节点li
            var $parentLi = $obj.parents("li:first");
            $parentLi.find('.tags:first').empty();
            // 2 删除fa-trash-o.改为fa-check-square-o
            $obj.find("i").removeClass("fa-trash-o").addClass("fa-check-square-o");
            $obj.attr('data-target', 'toadd');
        }


        /**
         * 图片编辑框提交修改
         */
        $("#picModal_footer_commitbtn").on("click", function () {
            // 获取选中的图片
            var $tocancel = $("#picModal_sys .toSelectGallery .text a[data-target='tocancel']");
            var img = $tocancel.parents("li:first").find("img").attr("src");
            if (img == undefined) {
                alert("没有选中图片，无法提交。。");
                return;
            }
            switch (pic_state) {
                case "SET_BG":
                    $("#bg_bg_img").show();
                    $("#bg_bg_img img").attr("src", img);
                    editUtils.setBgImg($("#mainContent"), img);
                    // 保存更新
                    img = img.replace(ctx, "");
                    updateBS('bgBgPic', img);
                    break;
                case "SET_HEADER":
                    $("#header_bg_img").show();
                    $("#header_bg_img img").attr("src", img);
                    editUtils.setBgImg($("#webHeader"), img);
                    // 保存更新
                    img = img.replace(ctx, "");
                    updateBS('headerBgPic', img);
                    break;
                case "SET_LOGO":
                    $("#goloModal_pic .logoPic img").attr("src", img);
                    $("#webLogo .weblogo-content img").attr("src", img);
                    // 保存更新
                    img = img.replace(ctx, "");
                    updateBS('logoPic', img);
                    break;

                default:
                    alert("错误");
                    break;
            }

            $("#picModal").modal('hide');
        });


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        /**
         * 横幅编辑中   常规 （画廊）
         */
        var banner_pattern_Data = baseSettingMap['banner_pattern'];
        var banner_animation_Data = baseSettingMap['banner_animation'];
        var bannerModal_interTimeSpinner_Data = baseSettingMap['bannerModal_interTimeSpinner'];
        var bannerModal_delayTimeSpinner_Data = baseSettingMap['bannerModal_delayTimeSpinner'];
        var bannerImg_Data = baseSettingMap['bannerImg'];

        // 剩余可以横幅图片
        var $availableBannerNum = $("#bannerModal_common .availableBannerNum span");

        if (bannerImg_Data.bsValue != null) {
            var banner = bannerImg_Data.bsValue.split(",");
            $availableBannerNum.text(6 - banner.length + 1);
        } else {
            $availableBannerNum.text(6);
        }

        // 初始化样式
        $("#" + banner_pattern_Data.bsValue).addClass("imgBorderDown");

        //横幅修改样式
        $("#bannerModal_pattern .imgBorder").on("click", function () {
            $("#bannerModal_pattern .imgBorder").removeClass("imgBorderDown");
            // 移除所有选中图片imgBorderDown
            // 添加选中图标
            $(this).addClass("imgBorderDown");
            // 选中id
            var id = $(this).attr("id");
            switch (id) {
                case "numSilde":
                    $("#webBanner #slideBox a.prev,#webBanner #slideBox a.next").hide();
                    $("#webBanner #slideBox .hd").show();
                    updateBS("banner_pattern", "numSilde");
                    break;
                case "arrowSilde":
                    $("#webBanner #slideBox .hd").hide();
                    $("#webBanner #slideBox a.prev,#webBanner #slideBox a.next").show();
                    updateBS("banner_pattern", "arrowSilde");
                    break;
                default:
                    alert("选择横幅样式错误！");
                    break;
            }
        });


        // 初始化动画
        $("#bannerModal_animation " + ' .effect[data-effect=' + banner_animation_Data.bsValue + ']').addClass("imgBorderDown");

        //横幅修改动画
        $("#bannerModal_animation .effect").on("click", function () {
            // 移除所有选中图片imgBorderDown
            $("#bannerModal_animation .effect").removeClass("imgBorderDown");
            // 添加选中图标
            $(this).addClass("imgBorderDown");
            var animation = $(this).attr("data-effect");
            updateBS("banner_animation", animation);
            updateBanner();
        });


        // 初始化数字改变框(横幅编辑框->高级设置---横幅展示时间)
        var $bannerModal_interTimeSpinner = $("#bannerModal_senior_interTime input");
        $bannerModal_interTimeSpinner.ace_spinner({
            value: bannerModal_interTimeSpinner_Data.bsValue,
            min: 0,
            max: 10000,
            step: 100,
            btn_up_class: 'btn-info',
            btn_down_class: 'btn-info'
        })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function () {
                updateBS("bannerModal_interTimeSpinner", $bannerModal_interTimeSpinner.val());
                updateBanner();
            });

        // 初始化数字改变框(横幅编辑框->高级设置---动画切换时间)
        var $bannerModal_delayTimeSpinner = $("#bannerModal_senior_delayTime input");
        $bannerModal_delayTimeSpinner.ace_spinner({
            value: bannerModal_delayTimeSpinner_Data.bsValue,
            min: 0,
            max: 2000,
            step: 100,
            btn_up_class: 'btn-info',
            btn_down_class: 'btn-info'
        })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function () {
                updateBS("bannerModal_delayTimeSpinner", $bannerModal_delayTimeSpinner.val());
                updateBanner();
            });


        var $overflow = '';
        var colorbox_params = {
            rel: 'colorbox',
            reposition: true,
            scalePhotos: true,
            scrolling: false,
            previous: '<i class="ace-icon fa fa-arrow-left"></i>',
            next: '<i class="ace-icon fa fa-arrow-right"></i>',
            close: '&times;',
            current: '{current} of {total}',
            /*width:"500px",
             height:"500px",*/
            maxWidth: '100%',
            maxHeight: '100%',
            onOpen: function () {
                $overflow = document.body.style.overflow;
                document.body.style.overflow = 'hidden';
            },
            onClosed: function () {
                document.body.style.overflow = $overflow;
            },
            onComplete: function () {
                $.colorbox.resize();
            }
        };
        $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);

        /**
         *  横幅编辑弹出框 中 常规  -> 选中图片可拖拽
         */
        $("#bannerModal_common_selectedIMG").sortable({
            //placeholder: "ui-state-highlight",
            cursor: "move",
            items: "li:not(.ui-state-disabled)"
        });


        /**
         * 选中画廊删除图片
         */
        $("#bannerModal_common_selectedIMG").on("click", "a[data-target='todelete']", function () {
            // 1删除 已选中该条信息
            var $parentLi = $(this).parents("li:first");
            $parentLi.remove();
            // 2待选画廊修改图片信息
            var imgName = $parentLi.find("img").attr("src");
            $("#bannerModal_common .toSelectGallery li").each(function () {
                if ($(this).find("img").attr("src") === imgName) {
                    // 1删除添加“使用”标记
                    $(this).find('.tags:first').empty();
                    // 2 删除fa-trash-o.改为fa-check-square-o
                    $(this).find("a[data-target='todelete'] i").removeClass("fa-trash-o").addClass("fa-check-square-o");
                    $(this).find("a[data-target='todelete']").attr('data-target', 'toadd');
                    return;
                }
            });
            // 3在框中显示剩余可以使用横幅数量
            var num = parseInt($availableBannerNum.text());
            $availableBannerNum.text(++num);
        });
        /**
         * 待选画廊选中图片
         */
        $("#bannerModal_common .toSelectGallery .text").on("click", "a[data-target='toadd']", function () {
            var num = parseInt($availableBannerNum.text());
            if (num == 0) {
                alert("可使用横幅为0");
            } else {
                // 1添加“使用”标记
                // 获取父节点li
                var $parentLi = $(this).parents("li:first");
                $parentLi.find('.tags:first').append("<span class='label label-success arrowed'>使用</span>");
                // 2 删除.fa-check-square-o改为fa-trash-o  data-target='toadd'-->todelete
                $(this).find("i").removeClass("fa-check-square-o").addClass("fa-trash-o");
                $(this).attr('data-target', 'todelete');
                // 3在选中框中添加li
                var imgName = $parentLi.find("img").attr("src");
                /*var $addLi = $("#bannerModal_common_selectedIMG").children("li:first").clone();
                 $addLi.find("img").attr("src",imgName);*/
                $addLi = componentUtils.bannerCommonSelectGallery(imgName);
                $("#bannerModal_common_selectedIMG").append($addLi);
                // 4在框中显示剩余可以使用横幅数量
                $availableBannerNum.text(--num);
            }
        });
        /**
         * 待选画廊删除图片
         */
        $("#bannerModal_common .toSelectGallery .text").on("click", "a[data-target='todelete']", function () {
            // 1删除添加“使用”标记
            // 获取父节点li
            var $parentLi = $(this).parents("li:first");
            $parentLi.find('.tags:first').empty();
            // 2 删除fa-trash-o.改为fa-check-square-o
            $(this).find("i").removeClass("fa-trash-o").addClass("fa-check-square-o");
            $(this).attr('data-target', 'toadd');
            // 3在选中框中删除li
            var imgName = $parentLi.find("img").attr("src");
            $("#bannerModal_common_selectedIMG li").each(function () {
                if ($(this).find("img").attr("src") === imgName) {
                    $(this).remove();
                    return;
                }
            });
            // 4在框中显示剩余可以使用横幅数量
            var num = parseInt($availableBannerNum.text());
            $availableBannerNum.text(++num);
        });

        /**
         * 横幅编辑框提交修改，设置横幅
         */
        $("#bannerModal_footer_commitbtn").on("click", function () {
            var imgs = "";
            $("#bannerModal_common_selectedIMG li img").map(function (index) {
                var img = $(this).attr("src").replace(ctx, "");
                imgs += img + ",";
            });
            if (imgs == "") {
                alert("必须选择一张图片");
                return;
            }
            updateBS("bannerImg", imgs);
            updateBanner();
            $("#bannerModal").modal("hide");
        });

        /**
         * 更新横幅栏
         * @param setWidth
         * @param setHeight
         */
        function updateBanner() {
            debugger
            $("#slideBox .bd").empty();
            $("#slideBox .bd").append('<ul style="margin: 0;"></ul>');

            $("#slideBox .hd ul").empty();

            if (bannerImg_Data.bsValue != null) {
                var banner = bannerImg_Data.bsValue.split(",");

                $.map(banner,function (item,index) {
                    if(item != ""){
                        $("#slideBox .bd ul").append(
                            '<li><a href='+item+' target="_blank"><img src="'+ctx+item+'" /></a></li>');
                        $("#slideBox .hd ul").append('<li>'+(index+1)+'</li>');
                    }
                });
                /*if (setWidth != undefined) {
                    $(".slideBox .bd li").css("width",setWidth);
                }
                if(setHeight != undefined){
                    $(".slideBox .bd li").css("height",setHeight);
                }*/
debugger
                $("#webBanner").css("width",banner_widthSlider_Data.bsValue+"%");
                $("#webBanner").css("height",banner_heightSlider_Data.bsValue+"px");
                $(".slideBox .bd li").css("height",banner_heightSlider_Data.bsValue+"px");
                $(".slideBox").slide({ mainCell: ".bd ul", effect: banner_animation_Data.bsValue,autoPlay:true, delayTime:bannerModal_delayTimeSpinner_Data.bsValue,interTime:bannerModal_interTimeSpinner_Data.bsValue});

            } else {
                return;
            }

        }


    });

});