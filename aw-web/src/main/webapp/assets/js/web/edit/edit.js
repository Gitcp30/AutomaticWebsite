seajs.use(['componentutils','jquery','editutils','baseSettingUtils','initUtils','bootstrap','jquery-ui.custom','spinbox','colorbox','bootstrap-wysiwyg','jquery.hotkeys.index','bootstrap-duallistbox','nestable','bootstrap-colorpicker','ace-elements','ace','method-extend'],function(componentUtils,$,editUtils,baseSettingUtils,initUtils){

    // 初始化基础数据
    baseSettingUtils.baseSettingMap = baseSettingUtils.getBaseSettings();
    // 基础数据
    var baseSettingMap  = baseSettingUtils.baseSettingMap;

	$(function() {

        var alldData = {};
        alldData.animation = "fold"; // 切换动画
        alldData.delayTime = "500";  // 切换时间
        alldData.interTime = "2500"; // 停留时间
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
		$(".showPanelBtn").click(function() {
			if($showPanelBtn.hasClass('glyphicon-chevron-down')) {
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
		$("#styleDesign .nav a").click(function() {
			$showPanelBtn.removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
			$panes.show();
			$("#close-left-menu-btn").trigger("click");
		});

        /**
         * 网站内容区域显示
         */
        $("#mainContent").load(ctx+"/web/edit/index");

		/**
		 * 侧边栏生成
		 */
		$('.modal.aside').ace_aside();

		/**
		 * 侧边栏出现时，设置格式面板要隐藏
		 */
		$("#leftSidebar .aside-trigger").click(function() {
			$showPanelBtn.removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
			$panes.hide();
		});


		$(".styleDesignBtnContainer button.btn-info").on("click",function(){
            var aa = baseSettingUtils.updateBsMap;

            $.ajax({
                type: "POST",
                url: ctx + "/web/edit/updateBaseSettings",
                data: JSON.stringify(baseSettingUtils.updateBsMap),
                contentType: "application/json",
                cache: false,
                success: function (res) {
                    if(res == null){
                        alert("获取系统配置出错了");
                    } else {
                        basesettingMap = res;
                    }
                }, error: function () {
                    alert("获取系统配置出错了");
                }
            });
		    debugger
        });

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       //  侧边栏初始化


        // 1.1背景-背景
        var bg_bg_Data = baseSettingMap['bg_bg'];
        var bg_bg_color_Data = baseSettingMap['background_background-colorpicker'];
        var bg_bg_img_Data = baseSettingMap['bgBgPic'];
        var bg_bg_showStyle_Data = baseSettingMap['bg_bg_showStyle'];


        if (bg_bg_Data.bsValue == "default" || bg_bg_Data.bsValue == "hide"){
            $("#leftSidebar_background .setting_background .content").hide();
        }

        $(":radio[name='bg_bg'][value='" + bg_bg_Data.bsValue + "']").prop("checked", "checked");

        // 初始化背景颜色改变框(背景->背景)
        $('#background_background-colorpicker').colorpicker({
            color: bg_bg_color_Data.bsValue,
            align: 'left',
            colorSelectors: {
                'black': '#000000',
                'white': '#ffffff',
                'red': '#FF0000',
                'default': '#777777',
                'primary': '#337ab7',
                'success': '#5cb85c',
                'info': '#5bc0de',
                'warning': '#f0ad4e',
                'danger': '#d9534f'
            }
        }).on('changeColor', function(e) {
            editUtils.setBgColor($("#mainContent"), e.color.toHex());
            $('#background_background-colorpicker').colorpicker('hide');
            // 保存更新
            debugger
            bg_bg_color_Data['bsValue'] = e.color.toHex();
            baseSettingUtils.updateBsMap['background_background-colorpicker'] = bg_bg_color_Data;
        });

        // 初始化图片
        if(bg_bg_img_Data.bsValue != ''){
            $("#bg_bg_img img").attr("src",ctx+bg_bg_img_Data.bsValue);
        }
        $("select[name='bg_bg_showStyle']").val(bg_bg_showStyle_Data.bsValue);

        // 背景->背景
        $(":radio[name='bg_bg']").on("click",initUtils.bgBgEvent);

        // 背景--背景--自定义显示方式
        $("select[name='bg_bg_showStyle']").change(initUtils.bgBgShowStyleEvent);


        // 1.2背景-宽度

        var bg_width_Data = baseSettingMap['bg_width'];
        var bg_WidthSlider_Data = baseSettingMap['bgWidthSlider'];

        if (bg_width_Data.bsValue == "default"){
            $("#leftSidebar_background .setting_width .content").hide();
        }
        $(":radio[name='bg_width'][value='" + bg_width_Data.bsValue + "']").prop("checked", "checked");

        // 背景->宽度
        $(":radio[name='bg_width']").on("click",function() {
            switch($(this).val()) {
                case "default":
                    $("#leftSidebar_background .setting_width .content").hide();
                    // 宽度100%
                    setIndexBgSize("100%");
                    break;
                case "custom":
                    $("#leftSidebar_background .setting_width .content").show();
                    setIndexBgSize($widthSpinner.val()+"%");
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });

        // 初始化  滑动条(背景->宽度)
		var $widthSlider = $("#leftSidebar_background .setting_width .ui-slider-blue");
		$widthSlider.css({ width: '90%', 'float': 'left', margin: '15px' }).each(function() {
			// read initial values from markup and remove that
			$(this).empty().slider({
				value: bg_WidthSlider_Data.bsValue,
				range: "min",
				min: 30,
				max: 100,
				animate: true,
				slide: function(event, ui) {
					$widthSpinner.val(ui.value);
                    setIndexBgSize(ui.value + "%");
				}
			});
		});

		// 初始化数字改变框(背景->宽度)
		var $widthSpinner = $("#leftSidebar_background .setting_width .spiner input");
		$widthSpinner.ace_spinner({ value: bg_WidthSlider_Data.bsValue, min: 30, max: 100, step: 1, btn_up_class: 'btn-info', btn_down_class: 'btn-info' })
			.closest('.ace-spinner')
			.on('changed.fu.spinbox', function() {
				$widthSlider.slider("value", $widthSpinner.val());
				setIndexBgSize($widthSpinner.val() + "%");
			});

		function  setIndexBgSize(value) {
            editUtils.setWidth($(".inner_header"),value);
            editUtils.setWidth($("#webMenu .inner_menu"),value);
            editUtils.setWidth($("#webBanner"),value);
            editUtils.setWidth($("#webContainer"),value);
            editUtils.setWidth($(".inner_footer"),value);
        }


        // 2.1头部-背景
        var header_bg_Data = baseSettingMap['header_bg'];
        var header_bg_color_Data = baseSettingMap['header_bg_colorpicker'];
        var header_bg_img_Data = baseSettingMap['headerBgPic'];
        var header_bg_showStyle_Data = baseSettingMap['header_bg_showStyle'];

/*
        if (header_bg_Data.bsValue == "default" || header_bg_Data.bsValue == "hide"){
            $("#leftSidebar_background .setting_background .content").hide();
        }

        $(":radio[name='bg_bg'][value='" + bg_bg_Data.bsValue + "']").prop("checked", "checked");*/





        // 背景--背景--添加图片点击
		$("#leftSidebar_background button[data-target=#picModal]").on("click",function(){
           // $("#close-left-menu-btn").trigger("click");
            //1取消其他选中的图片（由于只能选中一张图片）
            var $tocancel = $("#picModal_sys .toSelectGallery .text a[data-target='tocancel']");
            cancelSelectPic($tocancel);
            pic_state = "SET_BG";
		});

        // 顶部--背景--添加图片点击
        $("#leftSidebar_header button[data-target=#picModal]").on("click",function(){
            // $("#close-left-menu-btn").trigger("click");
            //1取消其他选中的图片（由于只能选中一张图片）
            var $tocancel = $("#picModal_sys .toSelectGallery .text a[data-target='tocancel']");
            cancelSelectPic($tocancel);
            pic_state = "SET_HEADER";
        });




        /**
         * 初始化  滑动条(横幅->宽度)
         */
        var $banner_widthSlider = $("#leftSidebar_banner .setting_width .ui-slider-blue");
        $banner_widthSlider.css({ width: '90%', 'float': 'left', margin: '15px' }).each(function() {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: value,
                range: "min",
                min: 0,
                max: 1440,
                animate: true,
                slide: function(event, ui) {
                    $banner_widthSpinner.val(ui.value);
                    editUtils.setWidth($("#webBanner"),ui.value / 1440 * 100 + "%");
                    updateBanner(ui.value+"px",undefined);
                }
            });
        });
        /**
         * 初始化数字改变框(横幅->宽度)
         */
        var $banner_widthSpinner = $("#leftSidebar_banner .setting_width .spiner input");
        $banner_widthSpinner.ace_spinner({ value: 1440, min: 0, max: 1440, step: 10, btn_up_class: 'btn-info', btn_down_class: 'btn-info' })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function() {
                $banner_widthSlider.slider("value", $banner_widthSpinner.val());
                editUtils.setWidth($("#webBanner"),$banner_widthSpinner.val() / 1440 * 100 + "%");
                updateBanner($banner_widthSpinner.val()+"px",undefined);
            });

        /**
         * 初始化  滑动条(横幅->高度)
         */
        var $banner_heightSlider = $("#leftSidebar_banner .setting_height .ui-slider-blue");
        $banner_heightSlider.css({ width: '90%', 'float': 'left', margin: '15px' }).each(function() {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: value,
                range: "min",
                min: 0,
                max: 500,
                animate: true,
                slide: function(event, ui) {
                    $banner_heightSpinner.val(ui.value);
                    editUtils.setHeight($("#webBanner"),ui.value + "px");
                    updateBanner(undefined,ui.value + "px",undefined);
                }
            });
        });
        /**
         * 初始化数字改变框(横幅->高度)
         */
        var $banner_heightSpinner = $("#leftSidebar_banner .setting_height .spiner input");
        $banner_heightSpinner.ace_spinner({ value: 500, min: 0, max: 500, step: 10, btn_up_class: 'btn-info', btn_down_class: 'btn-info' })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function() {
                $banner_heightSlider.slider("value", $banner_heightSpinner.val());
                editUtils.setHeight($("#webBanner"),$banner_heightSpinner.val()+"px");
                updateBanner(undefined,$banner_heightSpinner.val()+"px");
            });

        /**
         * 初始化背景颜色改变框(顶部->背景)
         */
        $('#header_bg_colorpicker').myColorpicker();

        $('#header_bg_colorpicker').ace_colorpicker();

        $('#header_bg_colorpicker').change(function() {
            editUtils.setBgColor($("#webHeader"), $(this).val());
        });


        /**
         * 初始化  滑动条(顶部->高度)
         */
        var $header_heightSlider = $("#leftSidebar_header .setting_height .ui-slider-blue");
        $header_heightSlider.css({ width: '90%', 'float': 'left', margin: '15px' }).each(function() {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: value,
                range: "min",
                min: 0,
                max: 200,
                animate: true,
                slide: function(event, ui) {
                    $header_heightSpinner.val(ui.value);
                    editUtils.setHeight($("#webHeader"),ui.value + "px");
                }
            });
        });
        /**
         * 初始化数字改变框(顶部->高度)
         */
        var $header_heightSpinner = $("#leftSidebar_header .setting_height .spiner input");
        $header_heightSpinner.ace_spinner({ value: 100, min: 0, max: 200, step: 5, btn_up_class: 'btn-info', btn_down_class: 'btn-info' })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function() {
                $header_heightSlider.slider("value", $header_heightSpinner.val());
                editUtils.setHeight($("#webHeader"),$header_heightSpinner.val()+"px");
            });


        /**
         * 初始化背景颜色改变框(顶部->边框)
         */
        $('#header_border_colorpicker').ace_colorpicker();

        $('#header_border_colorpicker').change(function() {
			$("#webHeader").css("border-bottom-color",$(this).val());
        });



        /**
         * 初始化  滑动条(顶部->边框)
         */
        var $border_heightSlider = $("#leftSidebar_header .setting_border .ui-slider-blue");
        $border_heightSlider.css({ width: '90%', 'float': 'left', margin: '15px 15px 15px 0' }).each(function() {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: value,
                range: "min",
                min: 0,
                max: 100,
                animate: true,
                slide: function(event, ui) {
                    $("#webHeader").css("border-bottom-width",ui.value + "px");
                }
            });
        });



        /**
         * 初始化  滑动条(内容->宽度)
         */
        var $content_widthSlider = $("#leftSidebar_content .setting_width .ui-slider-blue");
        $content_widthSlider.css({ width: '90%', 'float': 'left', margin: '15px 15px 15px 0' }).each(function() {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            debugger
            $(this).empty().slider({
                value: value,
                range: "min",
                min: 30,
                max: 100,
                animate: true,
                slide: function(event, ui) {
                    $("#webContainer").css("width",ui.value + "%");
                }
            });
        });


        /**
         * 初始化  滑动条(内容->边距---上边距)
         */
        var $content_marginTopSlider = $("#leftSidebar_content .setting_margin .settingMarginTop .ui-slider-blue");
        $content_marginTopSlider.css({ width: '90%', 'float': 'left', margin: '15px 15px 15px 0' }).each(function() {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: value,
                range: "min",
                min: 0,
                max: 100,
                animate: true,
                slide: function(event, ui) {
                    $("#webContainer").css("margin-top",ui.value + "px");
                }
            });
        });


        /**
         * 初始化  滑动条(内容->边距---下边距)
         */
        var $content_marginBottomSlider = $("#leftSidebar_content .setting_margin .settingMarginbottom  .ui-slider-blue");
        $content_marginBottomSlider.css({ width: '90%', 'float': 'left', margin: '15px 15px 15px 0' }).each(function() {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: value,
                range: "min",
                min: 0,
                max: 100,
                animate: true,
                slide: function(event, ui) {
                    $("#webContainer").css("margin-bottom",ui.value + "px");
                }
            });
        });




        /**
         * 初始化  滑动条(底部->高度)
         */
        var $footer_heightSlider = $("#leftSidebar_footer .setting_height .ui-slider-blue");
        $footer_heightSlider.css({ width: '90%', 'float': 'left', margin: '15px' }).each(function() {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: value,
                range: "min",
                min: 100,
                max: 500,
                animate: true,
                slide: function(event, ui) {
                    $footer_heightSpinner.val(ui.value);
                    editUtils.setHeight($("#webFooter"),ui.value + "px");
                }
            });
        });
        /**
         * 初始化数字改变框(底部->高度)
         */
        var $footer_heightSpinner = $("#leftSidebar_footer .setting_height .spiner input");
        $footer_heightSpinner.ace_spinner({ value: 100, min: 100, max: 500, step: 5, btn_up_class: 'btn-info', btn_down_class: 'btn-info' })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function() {
                $footer_heightSlider.slider("value", $footer_heightSpinner.val());
                debugger
                editUtils.setHeight($("#webFooter"),$footer_heightSpinner.val()+"px");
            });



        /**
         * 初始化背景颜色改变框(底部 ->背景)
         */
        $('#footer_bg_colorpicker').ace_colorpicker();

        $('#footer_bg_colorpicker').change(function() {
            editUtils.setBgColor($("#webFooter"),$(this).val());
        });

        /**
         * 初始化字体颜色改变框(底部 ->字体)
         */
        $('#footer_linktext_colorpicker').ace_colorpicker();

        $('#footer_linktext_colorpicker').change(function() {
            editUtils.setTextColor($(".inner_footer .footLinks a"),$(this).val());
        });
        /**
         * 初始化字体颜色改变框(底部 ->鼠标悬浮字体)
         */
        $('#footer_linkhover_colorpicker').ace_colorpicker();

        $('#footer_linkhover_colorpicker').change(function() {
            $(".inner_footer .footLinks a").hover(function(){
                $(this).css("color",$('#footer_linkhover_colorpicker').val());
            },function(){
                $(this).css("color",$('#footer_linktext_colorpicker').val()+" !important");
            });
        });


        /**
         * 初始化  滑动条(底部->字体大小)
         */
        var $footer_textSlider = $("#leftSidebar_footer .setting_linktext .ui-slider-blue");
        $footer_textSlider.css({ width: '90%', 'float': 'left', margin: '15px' }).each(function() {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: value,
                range: "min",
                min: 5,
                max: 20,
                animate: true,
                slide: function(event, ui) {
                    $(".inner_footer .footLinks a").css("font-size",ui.value + "px");
                }
            });
        });

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
            onOpen: function() {
                $picModal_overflow = document.body.style.overflow;
                document.body.style.overflow = 'hidden';
            },
            onClosed: function() {
                document.body.style.overflow = $picModal_overflow;
            },
            onComplete: function() {
                $.colorbox.resize();
            }
        };
        $('.ace-thumbnails [data-rel="picModal_colorbox"]').colorbox(picModal_params);


        /**
         * 图片编辑框---素材库  待选画廊选中图片
         */

        $("#picModal_sys .toSelectGallery .text").on("click","a[data-target='toadd']",function() {
            //1取消其他选中的图片（由于只能选中一张图片）
            var $tocancel = $("#picModal_sys .toSelectGallery .text a[data-target='tocancel']");
            cancelSelectPic($tocancel);
            // 2添加“使用”标记
            // 获取父节点li
            var $parentLi = $(this).parents("li:first");
            $parentLi.find('.tags:first').append("<span class='label label-success arrowed'>使用</span>");
            // 3 删除.fa-check-square-o改为fa-trash-o  data-target='toadd'-->todelete
            $(this).find("i").removeClass("fa-check-square-o").addClass("fa-trash-o");
            $(this).attr('data-target','tocancel');

        });

        /**
         * 取消选中图片
         * @param $obj
         */
        function cancelSelectPic($obj){
            // 1删除添加“使用”标记
            // 获取父节点li
            var $parentLi = $obj.parents("li:first");
            debugger
            $parentLi.find('.tags:first').empty();
            // 2 删除fa-trash-o.改为fa-check-square-o
            $obj.find("i").removeClass("fa-trash-o").addClass("fa-check-square-o");
            $obj.attr('data-target','toadd');
        }

        /**
         *  图片编辑框---素材库  待选画廊取消选中图片
         */
        $("#picModal_sys .toSelectGallery .text").on("click","a[data-target='tocancel']",function() {
            cancelSelectPic($(this));
        });

        /**
         * 图片编辑框提交修改，
         */
        $("#picModal_footer_commitbtn").on("click",function(){
            // 获取选中的图片
            var $tocancel = $("#picModal_sys .toSelectGallery .text a[data-target='tocancel']");
            var img =  $tocancel.parents("li:first").find("img").attr("src");
            debugger
            if (img == undefined){
                alert("没有选中图片，无法提交。。");
                return;
            }
            switch (pic_state){
                case "SET_BG":
                    $("#bg_bg_img").show();
					/*$("#leftSidebar button[data-target=#leftSidebar]").trigger("click");*/
                    $("#bg_bg_img img").attr("src",img);
                    editUtils.setBgImg($("#mainContent"),img);
                    break;
                case "SET_HEADER":
                    $("#header_bg_img").show();
					/*$("#leftSidebar button[data-target=#leftSidebar]").trigger("click");*/
                    $("#header_bg_img img").attr("src",img);
                    editUtils.setBgImg($("#webHeader"),img);
                    break;
                case "SET_LOGO":
                    $("#goloModal_pic .logoPic img").attr("src",img);
                    $("#webLogo .weblogo-content img").attr("src",img);
                    break;

                default:alert("错误");break;
            }

            $("#picModal").modal('hide');


        });





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        /**
		 * 横幅编辑中   常规 （画廊）
		 */
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
			onOpen: function() {
				$overflow = document.body.style.overflow;
				document.body.style.overflow = 'hidden';
			},
			onClosed: function() {
				document.body.style.overflow = $overflow;
			},
			onComplete: function() {
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
		// 剩余可以横幅图片
		var $availableBannerNum = $("#bannerModal_common .availableBannerNum span");
		$("#bannerModal_common_selectedIMG").on("click","a[data-target='todelete']",function(){
			// 1删除 已选中该条信息
			var $parentLi = $(this).parents("li:first");
			$parentLi.remove();
			// 2待选画廊修改图片信息
			var imgName = $parentLi.find("img").attr("src");
			$("#bannerModal_common .toSelectGallery li").each(function(){
				if ($(this).find("img").attr("src") === imgName){
					// 1删除添加“使用”标记
					$(this).find('.tags:first').empty();
					// 2 删除fa-trash-o.改为fa-check-square-o
					$(this).find("a[data-target='todelete'] i").removeClass("fa-trash-o").addClass("fa-check-square-o");
					$(this).find("a[data-target='todelete']").attr('data-target','toadd');
					return ;
				}
			});
			// 3在框中显示剩余可以使用横幅数量
			var num = parseInt($availableBannerNum.text());
			$availableBannerNum.text(++num);
		});
		/**
		 * 待选画廊选中图片
		 */
		$("#bannerModal_common .toSelectGallery .text").on("click","a[data-target='toadd']",function(){
			var num = parseInt($availableBannerNum.text());
			if (num == 0){
				alert("可使用横幅为0");
			} else {
				// 1添加“使用”标记  
				// 获取父节点li
				var $parentLi = $(this).parents("li:first");
				$parentLi.find('.tags:first').append("<span class='label label-success arrowed'>使用</span>");
				// 2 删除.fa-check-square-o改为fa-trash-o  data-target='toadd'-->todelete
				$(this).find("i").removeClass("fa-check-square-o").addClass("fa-trash-o");
				$(this).attr('data-target','todelete');
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
		$("#bannerModal_common .toSelectGallery .text").on("click","a[data-target='todelete']",function(){
			// 1删除添加“使用”标记
			// 获取父节点li
			var $parentLi = $(this).parents("li:first");
			$parentLi.find('.tags:first').empty();
			// 2 删除fa-trash-o.改为fa-check-square-o
			$(this).find("i").removeClass("fa-trash-o").addClass("fa-check-square-o");
			$(this).attr('data-target','toadd');
			// 3在选中框中删除li
			var imgName = $parentLi.find("img").attr("src");
			$("#bannerModal_common_selectedIMG li").each(function(){
				if ($(this).find("img").attr("src") === imgName){
					$(this).remove();
					return ;
				}
			});
			// 4在框中显示剩余可以使用横幅数量
			var num = parseInt($availableBannerNum.text());
			$availableBannerNum.text(++num);
		});
		
		/**
		 * 横幅编辑框提交修改，设置横幅
		 */
		$("#bannerModal_footer_commitbtn").on("click",function(){
			/*
				$("#slideBox .bd").empty();
				$("#slideBox .bd").append('<ul style="margin: 0;"></ul>');
				
				
				$("#slideBox .hd ul").empty();
			var imgs = new Array();
			$("#bannerModal_common_selectedIMG li img").each(function(index){
				var img = $(this).attr("src");
                imgs[index] = img;
				$("#slideBox .bd ul").append(
				'<li><a href='+img+' target="_blank"><img src="'+img+'" /></a></li>');
				
				$("#slideBox .hd ul").append('<li>'+(index+1)+'</li>');
			});
			alldData.imgs = imgs;
			$(".slideBox .bd li").css("height","300px");
			$(".slideBox").slide({ mainCell: ".bd ul", effect: "fold"});*/

            var imgs = $("#bannerModal_common_selectedIMG li img").map(function(index){
                return $(this).attr("src");
            });
            alldData.imgs = imgs;
            updateBanner();
		});


		//横幅修改样式

        $("#bannerModal_pattern .imgBorder").on("click",function(){
            $("#bannerModal_pattern .imgBorder").removeClass("imgBorderDown");
            // 移除所有选中图片imgBorderDown
            // 添加选中图标
            $(this).addClass("imgBorderDown");
            var pattern = $(this).parent().find(".slideLabel").text();

            if (pattern == "数字轮播") {
                $("#webBanner #slideBox a.prev,#webBanner #slideBox a.next").hide();
                $("#webBanner #slideBox .hd").show();
            } else  if (pattern == "箭头滑动"){
                $("#webBanner #slideBox .hd").hide();
                $("#webBanner #slideBox a.prev,#webBanner #slideBox a.next").show();
            }
        });



        //横幅修改动画
        $("#bannerModal_animation .effect").on("click",function(){
            // 移除所有选中图片imgBorderDown
            $("#bannerModal_animation .effect").removeClass("imgBorderDown");
            // 添加选中图标
            $(this).addClass("imgBorderDown");
            var animation = $(this).attr("data-effect");
            alldData.animation = animation;
            updateBanner();
        });



        /**
         * 初始化数字改变框(横幅编辑框->高级设置---横幅展示时间)
         */
        var $bannerModal_interTimeSpinner = $("#bannerModal_senior_interTime input");
        $bannerModal_interTimeSpinner.ace_spinner({ value: 2500, min: 0, max: 10000, step: 100, btn_up_class: 'btn-info', btn_down_class: 'btn-info' })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function() {
                alldData.interTime = $bannerModal_interTimeSpinner.val();
                updateBanner();
            });
        /**
         * 初始化数字改变框(横幅编辑框->高级设置---动画切换时间)
         */
        var $bannerModal_delayTimeSpinner = $("#bannerModal_senior_delayTime input");
        $bannerModal_delayTimeSpinner.ace_spinner({ value: 500, min: 0, max: 2000, step: 100, btn_up_class: 'btn-info', btn_down_class: 'btn-info' })
            .closest('.ace-spinner')
            .on('changed.fu.spinbox', function() {
                alldData.delayTime = $bannerModal_delayTimeSpinner.val()
                updateBanner();
            });



        /**
         * 更新横幅栏
         * @param setWidth
         * @param setHeight
         */
		function updateBanner(setWidth,setHeight){
            $("#slideBox .bd").empty();
            $("#slideBox .bd").append('<ul style="margin: 0;"></ul>');

            $("#slideBox .hd ul").empty();

            alldData.imgs.each(function(index,value){
                $("#slideBox .bd ul").append(
                    '<li><a href='+value+' target="_blank"><img src="'+value+'" /></a></li>');

                $("#slideBox .hd ul").append('<li>'+(index+1)+'</li>');
            });
            if (setWidth != undefined) {
                $(".slideBox .bd li").css("width",setWidth);
            }
            if(setHeight != undefined){
                $(".slideBox .bd li").css("height",setHeight);
            }
            $(".slideBox").slide({ mainCell: ".bd ul", effect: alldData.animation,autoPlay:true, delayTime:alldData.delayTime,interTime:alldData.interTime});
        }



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        //底部栏目编辑框
        $('#copyright-editor').ace_wysiwyg({
            toolbar:
                [
                    'font',
                    null,
                    'fontSize',
                    null,
                    {name:'bold', className:'btn-info'},
                    {name:'italic', className:'btn-info'},
                    {name:'underline', className:'btn-info'},
                    null,
                    {name:'justifyleft', className:'btn-primary'},
                    {name:'justifycenter', className:'btn-primary'},
                    {name:'justifyright', className:'btn-primary'},
                    {name:'justifyfull', className:'btn-inverse'},
                    null,
                    'foreColor',
                    null,
                    {name:'undo', className:'btn-grey'},
                    {name:'redo', className:'btn-grey'}
                ],
            'wysiwyg': {
                fileUploadError: function(){}
            }
        }).prev().addClass('wysiwyg-style2');

        /**
         * 设置Copyright信息
         */
        $("#footerModal_footer_commitbtn").on("click",function(){
            var copyrightHtml = $("#copyright-editor").html();
            $("#webFooter div.footCpy").html(copyrightHtml);
            var content = {links:$('select[name="footer_column"]').val()};
            var html = componentUtils.footerLink(content);

            $("#webFooter .footLinks").empty().html(html);
            setLinkTestStyle();
        });

        /**
         * 设置底部--链接字体为custom
         */
        function setLinkTestStyle(){
            var val =$("input:radio[name='footer_linktext']:checked").val();
        if(val == "custom"){
            $("#leftSidebar_footer .setting_linktext .content").show();
            // 1字体默认 font-size: 14px; 2.颜色默认color: #8b939d;color: #ffffff
            $(".inner_footer .footLinks a").css("color",$('#footer_linktext_colorpicker').val());
            $(".inner_footer .footLinks a").hover(function(){
                $(this).css("color",$('#footer_linkhover_colorpicker').val());
            },function(){
                $(this).css("color",$('#footer_linktext_colorpicker').val());
            });
            var size = $footer_textSlider.slider('option', 'value');
            $(".inner_footer .footLinks a").css("font-size",size);

        }

    }

        /**
         *  选择栏目
         * @type {jQuery}
         */
        var footer_column = $('select[name="footer_column"]').bootstrapDualListbox({
            nonSelectedListLabel: '待选栏目',
            selectedListLabel: '已选栏目',
            infoText:false,
            showFilterInputs:false,
        });
        // 设置按钮样式
        var container = footer_column.bootstrapDualListbox('getContainer');
        container.find('.btn').addClass('btn-white btn-info btn-bold');

        ////////////////////////////////////////////////////////////////////////////////////////

        // logo编辑框

        /**
         * 初始化  logo编辑框(修改图片透明度)
         */
        var $opacity_logoSlider = $("#logoModal_opacity.ui-slider-blue");
        $opacity_logoSlider.css({ width: '90%', 'float': 'left', margin: '15px 15px 15px 0' }).each(function() {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: value,
                range: "min",
                min: 0,
                max: 100,
                animate: true,
                slide: function(event, ui) {
                    $("#goloModal_pic .logoPic img").css("opacity",ui.value/100);
                    $("#webLogo .weblogo-content img").css("opacity",ui.value/100);
                }
            });
        });


        /**
         * 初始化  logo编辑框(修改图片圆角)
         */
        var $radius_logoSlider = $("#logoModal_radius.ui-slider-blue");
        $radius_logoSlider.css({ width: '90%', 'float': 'left', margin: '15px 15px 15px 0' }).each(function() {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: value,
                range: "min",
                min: 0,
                max: 50,
                animate: true,
                slide: function(event, ui) {
                    $("#goloModal_pic .logoPic img").css("border-radius",ui.value + "%");
                    $("#webLogo .weblogo-content img").css("border-radius",ui.value + "%");
                }
            });
        });

        $("#goloModal_pic .logoPic img").on("click",function(){
            pic_state = "SET_LOGO";
            $("#picModal").modal("show");
        });

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        // 顶部title编辑框
        $('#title-editor').ace_wysiwyg({
            toolbar:
                [
                    'font',
                    null,
                    'fontSize',
                    null,
                    {name:'bold', className:'btn-info'},
                    {name:'italic', className:'btn-info'},
                    {name:'underline', className:'btn-info'},
                    null,
                    'foreColor',
                    null,
                    {name:'undo', className:'btn-grey'},
                    {name:'redo', className:'btn-grey'}
                ],
            'wysiwyg': {
                fileUploadError: function(){}
            }
        }).prev().addClass('wysiwyg-style2');

        /**
         * 设置标题信息
         */
        $("#titlegoModal_footer_commitbtn").on("click",function(){
            var titleHtml = $("#title-editor").html();
            $("#webTitle span").html(titleHtml);
        });

        ///////////////////////////////////////////////////////////////////////////////////////

        // 菜单栏---设置栏目
        $('#menuModal_menu .dd').nestable();

        $('#menuModal_menu .dd-handle a').on('mousedown', function(e){
            e.stopPropagation();
        });

        /**
         * 选中栏目
         */
        $("#menuModal_menu li .action-buttons").find("a:first").on("click",function(){
                var $i  = $(this).find("i");
                if ($i.hasClass("fa-check")){
                    $i.removeClass("fa-check").addClass("fa-close").parent().removeClass("green").addClass("red");
                } else {
                    $i.removeClass("fa-close").addClass("fa-check").parent().removeClass("red").addClass("green");
                }
        });

        /**
         * 提交结果
         */
        $("#menuModal_footer_commitbtn").on("click",function(){
            // 获取选中的栏目
            var text = $("#menuModal_menu .dd-list li").map(function(){
                var $li = $(this).find(".fa-check");
                if ($li.length == 1){
                    return $(this).find(".dd2-content .row div:first").text();
                }
            });
            $("#webMenu .inner_menu ul").empty();
            debugger
            text.each(function(index,value){
                $("#webMenu .inner_menu ul").append('<li><a href="#">'+value+'</a></li>');
            });

        });


        /**
         * 初始化背景颜色改变框(菜单栏)
         */
        $('#menu_colorpicker').ace_colorpicker();

        $('#menu_colorpicker').change(function() {
            $("#webMenu").css("background-color",$(this).val());
        });

        /**
         * 初始化背景颜色改变框(菜单栏->背景)
         */
        $('#menu_bg_colorpicker').ace_colorpicker();

        $('#menu_bg_colorpicker').change(function() {
            $("#webMenu .inner_menu ul").css("background-color",$(this).val());
        });

        /**
         * 初始化背景颜色改变框(菜单栏->字体 )
         */
        $('#menu_font_colorpicker').ace_colorpicker();

        $('#menu_font_colorpicker').change(function() {
            debugger
            $("#webMenu .inner_menu ul li a").css("color",$(this).val());
        });

        /**
         * 初始化背景颜色改变框(菜单栏->选中颜色)
         */
        $('#menu_selectItem_colorpicker').ace_colorpicker();

        $('#menu_selectItem_colorpicker').change(function() {
            $color = $(this).val();
            $("#webMenu .inner_menu ul li a").hover(
                //当鼠标放上去的时候,程序处理
                function(){
                    $(this).css("background-color",$color);
                },
                //当鼠标离开的时候,程序处理
                function(){
                    $(this).css("background-color",$('#menu_bg_colorpicker').val());
                });
        });


        /**
         * 初始化  logo编辑框(修改图片圆角)
         */
        var $menu_widthSlider = $("#menuModal_width.ui-slider-blue");
        $menu_widthSlider.css({ width: '90%', 'float': 'left', margin: '15px 15px 15px 0' }).each(function() {
            // read initial values from markup and remove that
            var value = parseInt($(this).text(), 10);
            $(this).empty().slider({
                value: value,
                range: "min",
                min: 20,
                max: 100,
                animate: true,
                slide: function(event, ui) {
                    $("#webMenu .inner_menu").css("width",ui.value + "%");
                }
            });
        });

		///////////////////////////////////////////////////////////////////////////////////////
		// 编辑页面 中所有单选按钮的初始化


        /**
         * 横幅->宽度
         */
        $(":radio[name='banner_width']").click(function() {
            switch($(this).val()) {
				case "default":
                    $("#leftSidebar_banner .setting_width .content").hide();
                    // 宽度100%
                    editUtils.setWidth($("#webBanner"),"100%");
                    break;
                case "custom":
                    $("#leftSidebar_banner .setting_width .content").show();
                    editUtils.setWidth($("#webBanner"),$banner_widthSpinner.val());
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });

        /**
         * 横幅->高度
         */
        $(":radio[name='banner_height']").click(function() {
            switch($(this).val()) {
                case "default":
                    $("#leftSidebar_banner .setting_height .content").hide();
                    // 宽度100%
                    editUtils.setHeight($("#webBanner"),"100%");
                    break;
                case "custom":
                    $("#leftSidebar_banner .setting_height .content").show();
                    editUtils.setHeight($("#webBanner"),$banner_heightSpinner.val()+"px");
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });


        /**
         * 顶部->背景
         */
        $(":radio[name='header_bg']").click(function() {
            switch($(this).val()) {
                case "default":
                    $("#leftSidebar_header .setting_bg .content").hide();
                    editUtils.setBgColor($("#webHeader"),"#E4E6E9");
                    editUtils.setBgImg($("#webHeader"),"");
                    break;
                case "custom":
                    $("#leftSidebar_header .setting_bg .content").show();
                    var imgSrc = $("#header_bg_img img").attr("src");
                    if (imgSrc != undefined){
                        editUtils.setBgImg($("#webHeader"),imgSrc);
                    } else {
                        $("#header_bg_img").hide();
                        $("#header_bg_img img").removeAttr("src");
                        $("select[name='header_bg_showStyle'] option:first-child").prop("selected", 'selected');
                    }
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });


        /**
         * 顶部--背景--自定义显示方式
         */
        $("select[name='header_bg_showStyle']").change(function(){
            var val = $(this).val();
            if (val == "no"){
                $("#header_bg_img").hide();
                $("#header_bg_img img").removeAttr("src");
                editUtils.setBgImg($("#webHeader"),"");
                editUtils.setBgSize($("#webHeader"),"");
                editUtils.setBgRepeat($("#webHeader"),"");
            }
            else if (val == "no-repeat" || val == "repeat-y" || val =="repeat-x"){
                editUtils.setBgRepeat($("#webHeader"),val);
                editUtils.setBgSize($("#webHeader"),"");
            } else{
                editUtils.setBgSize($("#webHeader"),val);
                editUtils.setBgRepeat($("#webHeader"),"");
            }
        });


        /**
         * 顶部->高度
         */
        $(":radio[name='header_height']").click(function() {
            switch($(this).val()) {
                case "default":
                    $("#leftSidebar_header .setting_height .content").hide();
                    // 宽度100%
                    editUtils.setHeight($("#webHeader"),"100px");
                    break;
                case "custom":
                    $("#leftSidebar_header .setting_height .content").show();
                    editUtils.setHeight($("#webHeader"),$header_heightSpinner.val()+"px");
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });

        /**
         * 顶部->边框
         */
        $(":radio[name='header_border']").click(function() {
            switch($(this).val()) {
                case "hide":
                    $("#leftSidebar_header .setting_border .content").hide();
                    $("#webHeader").css("border-bottom","");
                    break;
				case "custom":
                    $("#leftSidebar_header .setting_border .content").show();
					var color = $('#header_border_colorpicker').val();
					debugger
					var width = $border_heightSlider.slider('option', 'value');
					var style = $("select[name='header_border_showStyle']").val();
                    $("#webHeader").css("border-bottom",width+"px  "+style+" "+color);
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });

        /**
         * 顶部--背景--自定义显示方式
         */
        $("select[name='header_border_showStyle']").change(function(){
        	debugger
            $("#webHeader").css("border-bottom-style",$(this).val());
        });


        /**
         * 底部->高度
         */
        $(":radio[name='footer_height']").click(function() {
        	debugger
            switch($(this).val()) {
                case "default":
                    $("#leftSidebar_footer .setting_height .content").hide();
                    // 宽度100%
                    editUtils.setHeight($("#webFooter"),"100px");
                    break;
                case "custom":
                    $("#leftSidebar_footer .setting_height .content").show();
                    editUtils.setHeight($("#webFooter"),$footer_heightSpinner.val()+"px");
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });


        /**
         * 底部->背景
         */
        $(":radio[name='footer_bg']").click(function() {
            switch($(this).val()) {
                case "default":
                    $("#leftSidebar_footer .setting_bg .content").hide();
                    editUtils.setBgColor($("#webFooter"),"#222222");
                    break;
                case "custom":
                    $("#leftSidebar_footer .setting_bg .content").show();
                    editUtils.setBgColor($("#webFooter"), $('#footer_border_colorpicker').val());
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });

        /**
         * 底部->栏目字体---大小
         */
        $(":radio[name='footer_linktext']").click(function() {
            switch($(this).val()) {
                case "default":
                    $("#leftSidebar_footer .setting_linktext .content").hide();
                    // 1字体默认 font-size: 14px; 2.颜色默认color: #8b939d;color: #ffffff
                    $(".inner_footer .footLinks a").css("color","#8b939d");
                    $(".inner_footer .footLinks a").hover(function(){
                        $(this).css("color","#ffffff");
                    },function(){
                        $(this).css("color","#8b939d");
                    });
                    $(".inner_footer .footLinks a").css("font-size","14px");
                    break;
                case "custom":
                    $("#leftSidebar_footer .setting_linktext .content").show();
                    // 1字体默认 font-size: 14px; 2.颜色默认color: #8b939d;color: #ffffff
                    $(".inner_footer .footLinks a").css("color",$('#footer_linktext_colorpicker').val());
                    $(".inner_footer .footLinks a").hover(function(){
                        $(this).css("color",$('#footer_linkhover_colorpicker').val());
                    },function(){
                        $(this).css("color",$('#footer_linktext_colorpicker').val());
                    });
                    var size = $footer_textSlider.slider('option', 'value');
                    $(".inner_footer .footLinks a").css("font-size",size);
                    break;
                default:
                    alert("出错啦！");
                    break;
            }
        });


		////////////////////////////////////////////////////////////////////////////////////////////////////////
	});

});