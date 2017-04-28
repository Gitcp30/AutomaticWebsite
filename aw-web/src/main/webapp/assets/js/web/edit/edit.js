seajs.use(['componentutils','jquery','editutils','bootstrap','jquery-ui.custom','spinbox','colorbox','ace-elements','ace'],function(componentUtils,$,editUtils){

	$(function() {
		// 格式设置面板
		var $panes = $(".panes");
		//格式设置面板上的按钮
		var $showPanelBtn = $(".showPanelBtn i");

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
		/**
		 * 初始化  滑动条(背景->宽度)
		 */
		var $widthSlider = $("#leftSidebar_background .setting_width .ui-slider-blue");
		$widthSlider.css({ width: '90%', 'float': 'left', margin: '15px' }).each(function() {
			// read initial values from markup and remove that
			var value = parseInt($(this).text(), 10);
			$(this).empty().slider({
				value: value,
				range: "min",
				min: 0,
				max: 1440,
				animate: true,
				slide: function(event, ui) {
					$widthSpinner.val(ui.value);
					editUtils.changeWidth($("#webBanner"), ui.value / 1440 * 100 + "%")
				}
			});
		});
		/**
		 * 初始化数字改变框(背景->宽度)
		 */
		var $widthSpinner = $("#leftSidebar_background .setting_width .spiner input");
		$widthSpinner.ace_spinner({ value: 1000, min: 0, max: 1440, step: 10, btn_up_class: 'btn-info', btn_down_class: 'btn-info' })
			.closest('.ace-spinner')
			.on('changed.fu.spinbox', function() {
				$widthSlider.slider("value", $widthSpinner.val());
				editUtils.changeWidth($("#webBanner"), $widthSpinner.val() / 1440 * 100 + "%")
			});

		/**
		 * 初始化背景颜色改变框(背景->背景)
		 */
		$('#simple-colorpicker-1').ace_colorpicker();

		$('#simple-colorpicker-1').change(function() {
			editUtils.changeBackground($("#webHeader"), $(this).val());
		});

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
			
				$("#slideBox .bd").empty();
				$("#slideBox .bd").append('<ul style="margin: 0;"></ul>');
				
				
				$("#slideBox .hd ul").empty();
			
			$("#bannerModal_common_selectedIMG li img").each(function(index){
				var img = $(this).attr("src");
				$("#slideBox .bd ul").append(
				'<li><a href="http://www.SuperSlide2.com" target="_blank"><img src="'+img+'" /></a></li>');
				
				$("#slideBox .hd ul").append('<li>'+(index+1)+'</li>');
			});
			
			$(".slideBox").slide({ mainCell: ".bd ul", effect: "fold"});
		});

		///////////////////////////////////////////////////////////////////////////////////////
		// 编辑页面 中所有单选按钮的初始化
		/**
		 * 背景->宽度
		 */
		$(":radio[name='background_width_radio']").click(function() {
			switch($(this).val()) {
				case "default":
					$("#leftSidebar_background .setting_width .content").hide();
					break;
				case "custom":
					$("#leftSidebar_background .setting_width .content").show();
					break;
				default:
					alert("出错啦！");
					break;
			}
		});
		/**
		 * 背景->背景
		 */
		$(":radio[name='background_background_radio']").click(function() {
			switch($(this).val()) {
				case "default":
					$("#leftSidebar_background .setting_background .content").hide();
					break;
				case "hide":
					$("#leftSidebar_background .setting_background .content").hide();
					break;
				case "custom":
					$("#leftSidebar_background .setting_background .content").show();
					break;
				default:
					alert("出错啦！");
					break;
			}
		});

		////////////////////////////////////////////////////////////////////////////////////////////////////////

	});

});