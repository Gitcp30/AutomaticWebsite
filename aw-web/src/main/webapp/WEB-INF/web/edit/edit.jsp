<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>编辑页面</title>
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${ctx}/static/font-awesome/4.5.0/css/font-awesome.min.css" />

		<link rel="stylesheet" href="${ctx}/static/css/colorbox.min.css" />
		<!-- text fonts -->
		<link rel="stylesheet" href="${ctx}/static/css/fonts.googleapis.com.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="${ctx}/static/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		<link rel="stylesheet" href="${ctx}/static/css/jquery-ui.min.css" />
		<link rel="stylesheet" href="${ctx}/static/css/bootstrap-colorpicker.min.css" />
		<!-- 多选样式-->
		<link rel="stylesheet" href="${ctx}/static/css/bootstrap-duallistbox.min.css" />
		<!--<link rel="stylesheet" href="static/css/ace-skins.min.css" />-->
		<!--<link rel="stylesheet" href="static/css/ace-rtl.min.css" />-->
		<!-- page specific plugin styles -->
		<!--<link rel="stylesheet" href="assets/css/prettify.min.css" />-->
		<link rel="shortcut icon" href="${ctx}/assets/image/favicon.ico">
		<link rel="icon" href="favicon.ico">
		<style>
			body {
				background-color: white;
			}
			
			.styleDesign {
				display: block;
				background: #EFF3F8;
			}
			
			.styleDesign .tabsWrap {
				width: 100%;
				height: 42px;
			}
			
			.styleDesign .tabsWrap .content {
				width: 900px;
				margin: 0 auto;
			}
			
			.styleDesign .tabsWrap .content .nav {
				float: left;
				border: 0px;
				width: 400px;
			}
			
			.styleDesign .tabsWrap .content .styleDesignBtnContainer {
				float: right;
				padding-top: 5px;
			}
			
			.styleDesign .panes {
				width: 1100px;
				height: 198px;
				background-color: white;
				margin: 0 auto;
				padding-top: 10px;
				border: 0px;
			}
			
			#bannerModal_common_selectedIMG {
				list-style-type: none;
			}
			
			#bannerModal_common_selectedIMG li {
				float: left;
				width: 120px;
				height: 50px;
			}
			
			#bannerModal_common_selectedIMG li .selectImg {
				width: 120px;
				height: 50px;
			}
			
			#bannerModal_common_selectedIMG li .selectImg img {
				width: 100%;
				height: 100%;
			}
			
			#bannerModal_common_selectedIMG .ui-state-highlight {
				border: 2px dashed black;
			}
			
			#bannerModal_common .availableBannerNum {
				color: #999;
				font-size: 14px;
			}
			
			/**
			 * <网站设置>样式
			 */
			#webSettings #webSettings_base label{
				font-size:1px;
			}
			#webSettings #webSettings_base .form-group label:nth-child(2){
			    margin-left: 0px;
			    padding-right: 0px;
			    padding-left: 32px;
			}
			
			#webSettings #webSettings_base .form-group label:nth-child(3){
   				padding-right: 0px;
   				padding-left: 30px;
   				margin-left: 0px;
			}
			#webSettings #webSettings_base .form-group:last-child .musicSetting{
				padding-left: 12px;
			}
			
			#webSettings #webSettings_base .form-group label a{
				color:#1b7ad1 ;
			}
			#webSettings #webSettings_base .form-group label a:hover{
				color:#f30;
				text-decoration: none;
			}
			
			#webSettings #webSettings_base label.control-label{
					padding: 7px 0 0 0;
				}
			#webSettings #webSettings_base .form-group{
				margin-bottom: 	0;
			}
			#webSettings #webSettings_base .form-control{
				height: 30px;
			}
			.spiner div:first-child{
				width: 145px;
			}
		</style>
	</head>

	<body>
		<div id="styleDesign" class="styleDesign">
			<div class="tabsWrap">
				<div class="content">
					<ul class="nav nav-tabs padding-12 tab-color-blue background-blue">
						<li class="active">
							<a data-toggle="tab" href="#webTheme">网站主题</a>
						</li>

						<li>
							<a data-toggle="tab" href="#pageLayout">页面版式</a>
						</li>

						<li>
							<a data-toggle="tab" href="#webSettings">网站设置</a>
						</li>

						<li>
							<a data-toggle="tab" href="#baiduSEO">百度优化</a>
						</li>
					</ul>
					<div class="styleDesignBtnContainer">
						<button class="btn btn-white btn-info btn-round">
							<i class="ace-icon fa fa-floppy-o bigger-120 blue"></i>保存
						</button>
						<button class="btn btn-white btn-default btn-round">
							<i class="ace-icon fa fa-times red2"></i>取消
						</button>
						<button class="btn btn-white btn-default btn-round showPanelBtn">
							<i class="glyphicon glyphicon-chevron-down"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="panes tab-content">
				<div id="webTheme" class="tab-pane in active">
					<div class="tabbable tabs-left">
						<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="tab" href="#webTheme_theme">
									<i class="pink ace-icon fa fa-tachometer bigger-110"></i> 网站主题
								</a>
							</li>
						</ul>
						<div class="tab-content">
							<div id="webTheme_theme" class="tab-pane in active">
								<p>1</p>
								<p>1</p>
								<p>1</p>
								<p>1</p>
								<p>1</p>
							</div>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<div id="pageLayout" class="tab-pane">
					<div class="tabbable tabs-left">
						<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="tab" href="#pageLayout_standard">
									<i class="pink ace-icon fa fa-tachometer bigger-110"></i> 标准版式
								</a>
							</li>

							<li>
								<a data-toggle="tab" href="#pageLayout_free">
									<i class="blue ace-icon fa fa-user bigger-110"></i> 自由版式
								</a>
							</li>
						</ul>
						<div class="tab-content">
							<div id="pageLayout_standard" class="tab-pane in active">
								<p>pageLayout_standard</p>
								<p>1</p>
								<p>1</p>
								<p>1</p>
								<p>1</p>
							</div>

							<div id="pageLayout_free" class="tab-pane">
								<p>pageLayout_free</p>
								<p>1</p>
								<p>1</p>
								<p>1</p>
								<p>1</p>
							</div>
						</div>
					</div>
				</div>
				<div id="webSettings" class="tab-pane">   
					<div class="tabbable tabs-left">
						<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="tab" href="#webSettings_base">
									<i class="pink ace-icon fa fa-tachometer bigger-110"></i> 基础设置
								</a>
							</li>

							<li>
								<a data-toggle="tab" href="#webSettings_senior">
									<i class="blue ace-icon fa fa-user bigger-110"></i> 高级设置
								</a>
							</li>
						</ul>
						<div class="tab-content">
							<div id="webSettings_base" class="tab-pane in active">
								<div class="row" style="padding-left: 10px;">
									<form class="form-horizontal" role="form">
									<div class="col-sm-6">
										<div class="row" style="position: relative;bottom: 5px;">
											<div class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
												<b>网站设置</b>
											</div>
										</div >
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
                       							   <label class="col-sm-2 control-label" for="ds_host">浏览器标题:</label>
                        						  	<div class="col-sm-6">
                        					     		<input id="ds_host" name="ds_host" class="form-control" type="text" placeholder="name"/>
                         							</div>
                     							</div>
											</div>
										</div>
										<div class="row"> 
											<div class="col-sm-6 ">
												<div class="form-group">
													<label class="col-sm-4 control-label" >网站标题:</label>
													<label class="radio-inline col-sm-3"> 
												      <input type="radio"  value="option2" name="sex">隐藏
												    </label> 
												    <label class="radio-inline col-sm-5"> 
												      <input type="radio"  value="option1" name="sex">显示
												    </label> 
												</div>
													
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="col-sm-4 control-label" >网站横幅:</label>
													<label class="radio-inline col-sm-3"> 
												      <input type="radio"  value="option2" name="sex">隐藏
												    </label> 
												    <label class="radio-inline col-sm-5"> 
												      <input type="radio"  value="option1" name="sex">显示
												    </label> 
												</div>
											</div>
										</div>
										<div class="row"> 
											<div class="col-sm-6 ">
												<div class="form-group">
													<label class="col-sm-4 control-label" >网站导航:</label>
													<label class="radio-inline col-sm-3"> 
												      <input type="radio"  value="option2" name="sex">隐藏
												    </label> 
												    <label class="radio-inline col-sm-5"> 
												      <input type="radio"  value="option1" name="sex">显示<a>[设置]</a>
												    </label> 
												</div>
													
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="col-sm-4 control-label" >会员登录:</label>
													<label class="radio-inline col-sm-3"> 
												      <input type="radio"  value="option2" name="sex">隐藏
												    </label> 
												    <label class="radio-inline col-sm-5"> 
												      <input type="radio"  value="option1" name="sex">显示<a>[设置]</a>
												    </label> 
												</div>
											</div>
										</div>
										<div class="row"> 
											<div class="col-sm-6 ">
												<div class="form-group">
													<label class="col-sm-4 control-label" >网站侧栏:</label>
													<label class="radio-inline col-sm-3"> 
												      <input type="radio"  value="option2" name="sex">隐藏
												    </label> 
												    <label class="radio-inline col-sm-5"> 
												      <input type="radio"  value="option1" name="sex">显示<a>[设置]</a>
												    </label> 
												</div>
													
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label class="col-sm-4 control-label" >背景音乐:</label>
													<label class="radio-inline col-sm-4 musicSetting"> 
												      	<a>[设置]</a>
												    </label> 
												</div>
											</div>
										</div>
									</div>
									<!-- /.col -->

									<div class="col-sm-6">
										<div class="row" style="position: relative;bottom: 5px;">
											<div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
												<b>页面设置</b>
											</div>
										</div>
										<div class="row">
											<div class="control-group">
												<label class="control-label">当前栏目页面:<span style="background-color: red;">首页</span>[以下设置仅影响此栏目页面]</label>
												<div class="checkbox">
													<label>
														<input name="form-field-checkbox" type="checkbox" class="ace" />
														<span class="lbl">本页面浏览器标题</span>
														<input name="ds_host"  type="text" placeholder="name" style=" height: 30px;"/>
													</label>
												</div>

												<div class="checkbox">
													<label>
														<input name="form-field-checkbox" type="checkbox" class="ace" />
														<span class="lbl">本页面横幅</span>
														<label> 
												      		<input type="radio"  value="option2" name="sex">隐藏
												    	</label> 
												    	<label
												    		
												    		> 
												     		 <input type="radio"  value="option1" name="sex">显示
												    	</label> 
													</label>
												</div>

												<div class="checkbox">
													<label>
														<input name="form-field-checkbox" type="checkbox" class="ace" />
														<span class="lbl">本页面隐藏导航</span>
													</label>
												</div>
											</div>
										</div>
									</div>
									<!-- /.col -->
									</form>	
								</div>
								<!-- /.row -->
							</div>

							<div id="webSettings_senior" class="tab-pane">
								<p>webSettings_senior</p>
								<p>sernior</p>
								<p>1</p>
								<p>1</p>
								<p>1</p>
							</div>
						</div>
					</div>
				</div>
				<div id="baiduSEO" class="tab-pane">
					<div class="tabbable tabs-left">
						<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="tab" href="#baiduSEO_base">
									<i class="pink ace-icon fa fa-tachometer bigger-110"></i> 基础设置
								</a>
							</li>

							<li>
								<a data-toggle="tab" href="#baiduSEO_keyword">
									<i class="blue ace-icon fa fa-user bigger-110"></i> 关键词
								</a>
							</li>
						</ul>
						<div class="tab-content">
							<div id="baiduSEO_base" class="tab-pane in active">
								<p>baiduSEO_base</p>
								<p>1</p>
								<p>1</p>
								<p>1</p>
								<p>1</p>
							</div>

							<div id="baiduSEO_keyword" class="tab-pane">
								<p>baiduSEO_keyword</p>
								<p>1</p>
								<p>1</p>
								<p>1</p>
								<p>1</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 网站主体部分-->
		<div id="mainContent"></div>
		<!-- 右部侧边栏-->
		<div id="leftSidebar" class="modal aside" data-body-scroll="false" data-offset="true" data-placement="left" data-fixed="true" data-backdrop="false" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content" style="width: 400px; ">
					<div class="modal-header no-padding">
						<div class="table-header">
							<button type="button" id="close-left-menu-btn" class="close" data-dismiss="modal" aria-hidden="true">
								<span class="white">&times;</span>
							</button>
							<div class="nav"><i class="ace-icon fa fa-desktop white"></i> 布局</div>
						</div>
					</div>
					<!--<div class="modal-body">-->
					<div>
						<ul class="nav nav-tabs padding-20 tab-color-blue background-blue" style="border: 0;">
							<li class="active">
								<a data-toggle="tab" href="#leftSidebar_background">背景</a>
							</li>

							<li>
								<a data-toggle="tab" href="#leftSidebar_header">顶部</a>
							</li>

							<li>
								<a data-toggle="tab" href="#leftSidebar_banner">横幅</a>
							</li>

							<li>
								<a data-toggle="tab" href="#leftSidebar_content">内容</a>
							</li>

							<li>
								<a data-toggle="tab" href="#leftSidebar_footer">底部</a>
							</li>
						</ul>
						<div class="tab-content" style="border: 0;">
							<!--背景 -->
							<div id="leftSidebar_background" class="tab-pane in active">
								<!--背景 -->
								<div class="widget-box setting_background">
									<div class="widget-header" style="min-height: 20px;">
										<h6 class="smaller">背景</h6>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<div class="row">
												<div class="col-xs-4 col-sm-4">
													<label>
														<input name="bg_bg" type="radio" class="ace" value="default" />
														<span class="lbl">默认</span>
													</label>
												</div>
												<div class="col-xs-4 col-sm-4">
													<label>
														<input name="bg_bg" type="radio" class="ace" value="hide"/>
														<span class="lbl">隐藏</span>
													</label>
												</div>
												<div class="col-xs-4 col-sm-4">
													<label>
														<input name="bg_bg" type="radio" class="ace" value="custom" checked="true" />
														<span class="lbl">自定义</span>
													</label>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4">
													<label for="background_background-colorpicker">颜色： </label>
												</div>
												<div class="col-xs-6 col-md-6">
													<select id="background_background-colorpicker" class="hide">
														<option value="#ac725e">#ac725e</option>
														<option value="#d06b64">#d06b64</option>
														<option value="#f83a22">#f83a22</option>
														<option value="#fa573c">#fa573c</option>
														<option value="#ff7537">#ff7537</option>
														<option value="#ffad46" selected="">#ffad46</option>
														<option value="#42d692">#42d692</option>
														<option value="#16a765">#16a765</option>
														<option value="#7bd148">#7bd148</option>
														<option value="#b3dc6c">#b3dc6c</option>
														<option value="#fbe983">#fbe983</option>
														<option value="#fad165">#fad165</option>
														<option value="#92e1c0">#92e1c0</option>
														<option value="#9fe1e7">#9fe1e7</option>
														<option value="#9fc6e7">#9fc6e7</option>
														<option value="#4986e7">#4986e7</option>
														<option value="#9a9cff">#9a9cff</option>
														<option value="#b99aff">#b99aff</option>
														<option value="#c2c2c2">#c2c2c2</option>
														<option value="#cabdbf">#cabdbf</option>
														<option value="#cca6ac">#cca6ac</option>
														<option value="#f691b2">#f691b2</option>
														<option value="#cd74e6">#cd74e6</option>
														<option value="#a47ae2">#a47ae2</option>
														<option value="#555">#555</option>
													</select>
												</div>

											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4">
													<label>图片：</label>
												</div>
												<div class="col-xs-4 col-md-4">
													<button class="btn btn-minier btn-primary" data-toggle="modal" data-target="#picModal"> 添加图片</button>
												</div>

											</div>
											<div class="row content" id="bg_bg_img" style="display:none;">
												<div class="col-xs-4 col-md-4"></div>
												<div class="col-xs-8 col-md-8">
													<img style="max-height: 100px;max-width: 100px;padding-bottom: 5px"/>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4"><label>显示方式：</label></div>
												<div class="col-xs-6 col-md-6">
													<select class="form-control" name="bg_bg_showStyle">
														<option value=""></option>
														<option value="no">不使用背景图片</option>
														<option value="no-repeat">不平铺</option>
														<option value="repeat-x">按X轴平铺</option>
														<option value="repeat-y">按Y轴平铺</option>
														<option value="100%  100%">自适应</option>
														<option value="contain">按比例(较大者)</option>
														<option value="cover">按比例(较小者)</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--宽度 -->
								<div class="widget-box setting_width">
									<div class="widget-header" style="min-height: 20px;">
										<h6 class="smaller">宽度</h6>
									</div>
									<div class="widget-body">
										<div class="widget-main">
											<div class="row">
												<div class="col-xs-6 col-sm-4">
													<label>
														<input name="bg_width" type="radio" class="ace" value="default"/>
														<span class="lbl">默认</span>
													</label>
												</div>
												<div class="col-xs-6 col-sm-4">
													<label>
														<input name="bg_width" type="radio" class="ace" value="custom" checked="true" />
														<span class="lbl">自定义</span>
													</label>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-6 col-md-6">
													<span class="ui-slider-blue ui-slider-small">1440</span>
												</div>
												<div class="col-xs-6 col-sm-6 spiner">
													<input type="text" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--顶部 -->
							<div id="leftSidebar_header" class="tab-pane">
								<!--背景 -->
								<div class="widget-box setting_bg">
									<div class="widget-header" style="min-height: 20px;">
										<h6 class="smaller">背景</h6>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<div class="row">
												<div class="col-xs-4 col-sm-4">
													<label>
														<input name="header_bg" type="radio" class="ace" value="default" />
														<span class="lbl">默认</span>
													</label>
												</div>
												<div class="col-xs-4 col-sm-4">
													<label>
														<input name="header_bg" type="radio" class="ace" value="hide"/>
														<span class="lbl">隐藏</span>
													</label>
												</div>
												<div class="col-xs-4 col-sm-4">
													<label>
														<input name="header_bg" type="radio" class="ace" value="custom" checked="true" />
														<span class="lbl">自定义</span>
													</label>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4">
													<label for="header_bg_colorpicker">颜色： </label>
												</div>
												<div class="col-xs-6 col-md-6">
													<select id="header_bg_colorpicker" class="hide">
														<option value="#ac725e">#ac725e</option>
														<option value="#d06b64">#d06b64</option>
														<option value="#f83a22">#f83a22</option>
														<option value="#fa573c">#fa573c</option>
														<option value="#ff7537">#ff7537</option>
														<option value="#ffad46" selected="">#ffad46</option>
														<option value="#42d692">#42d692</option>
														<option value="#16a765">#16a765</option>
														<option value="#7bd148">#7bd148</option>
														<option value="#b3dc6c">#b3dc6c</option>
														<option value="#fbe983">#fbe983</option>
														<option value="#fad165">#fad165</option>
														<option value="#92e1c0">#92e1c0</option>
														<option value="#9fe1e7">#9fe1e7</option>
														<option value="#9fc6e7">#9fc6e7</option>
														<option value="#4986e7">#4986e7</option>
														<option value="#9a9cff">#9a9cff</option>
														<option value="#b99aff">#b99aff</option>
														<option value="#c2c2c2">#c2c2c2</option>
														<option value="#cabdbf">#cabdbf</option>
														<option value="#cca6ac">#cca6ac</option>
														<option value="#f691b2">#f691b2</option>
														<option value="#cd74e6">#cd74e6</option>
														<option value="#a47ae2">#a47ae2</option>
														<option value="#555">#555</option>
													</select>
												</div>

											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4">
													<label>图片：</label>
												</div>
												<div class="col-xs-4 col-md-4">
													<button class="btn btn-minier btn-primary" data-toggle="modal" data-target="#picModal"> 添加图片</button>
												</div>

											</div>
											<div class="row content" id="header_bg_img" style="display:none;">
												<div class="col-xs-4 col-md-4"></div>
												<div class="col-xs-8 col-md-8">
													<img style="max-height: 100px;max-width: 100px;padding-bottom: 5px"/>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4"><label>显示方式：</label></div>
												<div class="col-xs-6 col-md-6">
													<select class="form-control" name="header_bg_showStyle">
														<option value=""></option>
														<option value="no">不使用背景图片</option>
														<option value="no-repeat">不平铺</option>
														<option value="repeat-x">按X轴平铺</option>
														<option value="repeat-y">按Y轴平铺</option>
														<option value="100%  100%">自适应</option>
														<option value="contain">按比例(较大者)</option>
														<option value="cover">按比例(较小者)</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--底部边框 -->
								<div class="widget-box setting_border">
									<div class="widget-header" style="min-height: 20px;">
										<h6 class="smaller">底部边框</h6>
									</div>
									<div class="widget-body">
										<div class="widget-main">
											<div class="row">
												<div class="col-xs-4 col-sm-4">
													<label>
														<input name="header_border" type="radio" class="ace" value="hide"/>
														<span class="lbl">隐藏</span>
													</label>
												</div>
												<div class="col-xs-4 col-sm-4">
													<label>
														<input name="header_border" type="radio" class="ace" value="custom" checked="true" />
														<span class="lbl">自定义</span>
													</label>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4">
													<label for="header_border_colorpicker">颜色： </label>
												</div>
												<div class="col-xs-6 col-md-6">
													<select id="header_border_colorpicker" class="hide">
														<option value="#ac725e">#ac725e</option>
														<option value="#d06b64">#d06b64</option>
														<option value="#f83a22">#f83a22</option>
														<option value="#fa573c">#fa573c</option>
														<option value="#ff7537">#ff7537</option>
														<option value="#ffad46" selected="">#ffad46</option>
														<option value="#42d692">#42d692</option>
														<option value="#16a765">#16a765</option>
														<option value="#7bd148">#7bd148</option>
														<option value="#b3dc6c">#b3dc6c</option>
														<option value="#fbe983">#fbe983</option>
														<option value="#fad165">#fad165</option>
														<option value="#92e1c0">#92e1c0</option>
														<option value="#9fe1e7">#9fe1e7</option>
														<option value="#9fc6e7">#9fc6e7</option>
														<option value="#4986e7">#4986e7</option>
														<option value="#9a9cff">#9a9cff</option>
														<option value="#b99aff">#b99aff</option>
														<option value="#c2c2c2">#c2c2c2</option>
														<option value="#cabdbf">#cabdbf</option>
														<option value="#cca6ac">#cca6ac</option>
														<option value="#f691b2">#f691b2</option>
														<option value="#cd74e6">#cd74e6</option>
														<option value="#a47ae2">#a47ae2</option>
														<option value="#555">#555</option>
													</select>
												</div>

											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4">
													<label for="header_border_colorpicker">宽度：</label>
												</div>
												<div class="col-xs-8 col-md-8">
													<span class="ui-slider-blue ui-slider-small">0</span>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4"><label>样式：</label></div>
												<div class="col-xs-6 col-md-6">
													<select class="form-control" name="header_border_showStyle">
														<option value="solid">实线</option>
														<option value="dashed">虚线</option>
														<option value="dotted">点线</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--高度 -->
								<div class="widget-box setting_height">
									<div class="widget-header" style="min-height: 20px;">
										<h6 class="smaller">高度</h6>
									</div>
									<div class="widget-body">
										<div class="widget-main">
											<div class="row">
												<div class="col-xs-6 col-sm-4">
													<label>
														<input name="header_height" type="radio" class="ace" value="default"/>
														<span class="lbl">默认</span>
													</label>
												</div>
												<div class="col-xs-6 col-sm-4">
													<label>
														<input name="header_height" type="radio" class="ace" value="custom" checked="true" />
														<span class="lbl">自定义</span>
													</label>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-6 col-md-6">
													<span class="ui-slider-blue ui-slider-small">100</span>
												</div>
												<div class="col-xs-6 col-sm-6 spiner">
													<input type="text" />
												</div>
											</div>
										</div>
									</div>
								</div>
								</div>
							<!--横幅-->
							<div id="leftSidebar_banner" class="tab-pane">
								<!--宽度 -->
								<div class="widget-box setting_width">
									<div class="widget-header" style="min-height: 20px;">
										<h6 class="smaller">宽度</h6>
									</div>
									<div class="widget-body">
										<div class="widget-main">
											<div class="row">
												<div class="col-xs-6 col-sm-4">
													<label>
														<input name="banner_width" type="radio" class="ace" value="default"/>
														<span class="lbl">默认</span>
													</label>
												</div>
												<div class="col-xs-6 col-sm-4">
													<label>
														<input name="banner_width" type="radio" class="ace" value="custom" checked="true" />
														<span class="lbl">自定义</span>
													</label>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-6 col-md-6">
													<span class="ui-slider-blue ui-slider-small">1440</span>
												</div>
												<div class="col-xs-6 col-sm-6 spiner" >
													<input type="text" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--高度 -->
								<div class="widget-box setting_height">
									<div class="widget-header" style="min-height: 20px;">
										<h6 class="smaller">高度</h6>
									</div>
									<div class="widget-body">
										<div class="widget-main">
											<div class="row">
												<div class="col-xs-6 col-sm-4">
													<label>
														<input name="banner_height" type="radio" class="ace" value="default"/>
														<span class="lbl">默认</span>
													</label>
												</div>
												<div class="col-xs-6 col-sm-4">
													<label>
														<input name="banner_height" type="radio" class="ace" value="custom" checked="true" />
														<span class="lbl">自定义</span>
													</label>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-6 col-md-6">
													<span class="ui-slider-blue ui-slider-small">500</span>
												</div>
												<div class="col-xs-6 col-sm-6 spiner">
													<input type="text" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="leftSidebar_content" class="tab-pane">
								<p>leftSidebar_content</p>
							</div>
							<!--底部 -->
							<div id="leftSidebar_footer" class="tab-pane">
								<!--高度 -->
								<div class="widget-box setting_height">
									<div class="widget-header" style="min-height: 20px;">
										<h6 class="smaller">高度</h6>
									</div>
									<div class="widget-body">
										<div class="widget-main">
											<div class="row">
												<div class="col-xs-6 col-sm-6">
													<label>
														<input name="footer_height" type="radio" class="ace" value="default"/>
														<span class="lbl">默认</span>
													</label>
												</div>
												<div class="col-xs-6 col-sm-6">
													<label>
														<input name="footer_height" type="radio" class="ace" value="custom" checked="true" />
														<span class="lbl">自定义</span>
													</label>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-6 col-md-6">
													<span class="ui-slider-blue ui-slider-small">100</span>
												</div>
												<div class="col-xs-6 col-sm-6 spiner">
													<input type="text" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--背景 -->
								<div class="widget-box setting_bg">
									<div class="widget-header" style="min-height: 20px;">
										<h6 class="smaller">背景</h6>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<div class="row">
												<div class="col-xs-4 col-sm-4">
													<label>
														<input name="footer_bg" type="radio" class="ace" value="default" />
														<span class="lbl">默认</span>
													</label>
												</div>
												<div class="col-xs-4 col-sm-4">
													<label>
														<input name="footer_bg" type="radio" class="ace" value="hide"/>
														<span class="lbl">隐藏</span>
													</label>
												</div>
												<div class="col-xs-4 col-sm-4">
													<label>
														<input name="footer_bg" type="radio" class="ace" value="custom" checked="true" />
														<span class="lbl">自定义</span>
													</label>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4">
													<label for="footer_bg_colorpicker">颜色：</label>
												</div>
												<div class="col-xs-6 col-md-6">
													<select id="footer_bg_colorpicker" class="hide">
														<option value="#ac725e">#ac725e</option>
														<option value="#d06b64">#d06b64</option>
														<option value="#f83a22">#f83a22</option>
														<option value="#fa573c">#fa573c</option>
														<option value="#ff7537">#ff7537</option>
														<option value="#ffad46" selected="">#ffad46</option>
														<option value="#42d692">#42d692</option>
														<option value="#16a765">#16a765</option>
														<option value="#7bd148">#7bd148</option>
														<option value="#b3dc6c">#b3dc6c</option>
														<option value="#fbe983">#fbe983</option>
														<option value="#fad165">#fad165</option>
														<option value="#92e1c0">#92e1c0</option>
														<option value="#9fe1e7">#9fe1e7</option>
														<option value="#9fc6e7">#9fc6e7</option>
														<option value="#4986e7">#4986e7</option>
														<option value="#9a9cff">#9a9cff</option>
														<option value="#b99aff">#b99aff</option>
														<option value="#c2c2c2">#c2c2c2</option>
														<option value="#cabdbf">#cabdbf</option>
														<option value="#cca6ac">#cca6ac</option>
														<option value="#f691b2">#f691b2</option>
														<option value="#cd74e6">#cd74e6</option>
														<option value="#a47ae2">#a47ae2</option>
														<option value="#555">#555</option>
													</select>
												</div>

											</div>
										</div>
									</div>
								</div>

								<!--栏目文字 -->
								<div class="widget-box setting_linktext">
									<div class="widget-header" style="min-height: 20px;">
										<h6 class="smaller">栏目文字</h6>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<div class="row">
												<div class="col-xs-6 col-sm-6">
													<label>
														<input name="footer_linktext" type="radio" class="ace" value="default" />
														<span class="lbl">默认</span>
													</label>
												</div>
												<div class="col-xs-6 col-sm-6">
													<label>
														<input name="footer_linktext" type="radio" class="ace" value="custom" checked="true" />
														<span class="lbl">自定义</span>
													</label>
												</div>
											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4">
													<label for="footer_linktext_colorpicker">颜色：</label>
												</div>
												<div class="col-xs-6 col-md-6">
													<select id="footer_linktext_colorpicker" class="hide">
														<option value="#ac725e">#ac725e</option>
														<option value="#d06b64">#d06b64</option>
														<option value="#f83a22">#f83a22</option>
														<option value="#fa573c">#fa573c</option>
														<option value="#ff7537">#ff7537</option>
														<option value="#ffad46" selected="">#ffad46</option>
														<option value="#42d692">#42d692</option>
														<option value="#16a765">#16a765</option>
														<option value="#7bd148">#7bd148</option>
														<option value="#b3dc6c">#b3dc6c</option>
														<option value="#fbe983">#fbe983</option>
														<option value="#fad165">#fad165</option>
														<option value="#92e1c0">#92e1c0</option>
														<option value="#9fe1e7">#9fe1e7</option>
														<option value="#9fc6e7">#9fc6e7</option>
														<option value="#4986e7">#4986e7</option>
														<option value="#9a9cff">#9a9cff</option>
														<option value="#b99aff">#b99aff</option>
														<option value="#c2c2c2">#c2c2c2</option>
														<option value="#cabdbf">#cabdbf</option>
														<option value="#cca6ac">#cca6ac</option>
														<option value="#f691b2">#f691b2</option>
														<option value="#cd74e6">#cd74e6</option>
														<option value="#a47ae2">#a47ae2</option>
														<option value="#555">#555</option>
													</select>
												</div>

											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4">
													<label for="footer_linkhover_colorpicker">悬浮颜色：</label>
												</div>
												<div class="col-xs-6 col-md-6">
													<select id="footer_linkhover_colorpicker" class="hide">
														<option value="#ac725e">#ac725e</option>
														<option value="#d06b64">#d06b64</option>
														<option value="#f83a22">#f83a22</option>
														<option value="#fa573c">#fa573c</option>
														<option value="#ff7537">#ff7537</option>
														<option value="#ffad46" selected="">#ffad46</option>
														<option value="#42d692">#42d692</option>
														<option value="#16a765">#16a765</option>
														<option value="#7bd148">#7bd148</option>
														<option value="#b3dc6c">#b3dc6c</option>
														<option value="#fbe983">#fbe983</option>
														<option value="#fad165">#fad165</option>
														<option value="#92e1c0">#92e1c0</option>
														<option value="#9fe1e7">#9fe1e7</option>
														<option value="#9fc6e7">#9fc6e7</option>
														<option value="#4986e7">#4986e7</option>
														<option value="#9a9cff">#9a9cff</option>
														<option value="#b99aff">#b99aff</option>
														<option value="#c2c2c2">#c2c2c2</option>
														<option value="#cabdbf">#cabdbf</option>
														<option value="#cca6ac">#cca6ac</option>
														<option value="#f691b2">#f691b2</option>
														<option value="#cd74e6">#cd74e6</option>
														<option value="#a47ae2">#a47ae2</option>
														<option value="#555">#555</option>
														<option value="#ffffff">#ffffff</option>
													</select>
												</div>

											</div>
											<div class="row content">
												<div class="col-xs-4 col-md-4">
													<label>大小：</label>
												</div>
												<div class="col-xs-6 col-md-6">
													<span class="ui-slider-blue ui-slider-small">14</span>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
				<button class="aside-trigger btn btn-info btn-app btn-sm ace-settings-btn" data-target="#leftSidebar" data-toggle="modal" type="button">
					<i data-icon1="fa-cog" data-icon2="fa-minus" class="ace-icon fa fa-cog bigger-110 icon-only"></i>
				</button>
			</div>
			<!-- /.modal-dialog -->
		</div>

		<!-- 图片编辑模态框（Modal） -->
		<div class="modal fade" id="picModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 2000;">
			<div class="modal-dialog" style="width: 850px;">
				<div class="modal-content">
					<div class="table-header">
						<button type="button"  class="close" data-dismiss="modal" aria-hidden="true">
							<span class="white" style="font-size: 30px;">&times;</span>
						</button>
						<div class="nav"><i class="ace-icon glyphicon glyphicon-picture white"></i> 添加图片</div>
					</div>
					<div>
						<ul class="nav nav-tabs padding-20 tab-color-blue background-blue" style="border: 0;">
							<li class="active">
								<a data-toggle="tab" href="#picModal_sys">素材库</a>
							</li>

							<li>
								<a data-toggle="tab" href="#picModal_myFile">我的文件</a>
							</li>

						</ul>
						<div class="tab-content" style="border: 0;">
							<!--常规 -->
							<div id="picModal_sys" class="tab-pane in active">
								<!--常规 -->
									<!--待选图片画廊 -->
									<div class="row" style="height:200px;overflow-y:scroll;padding:10px;border: 1px solid #ededed;margin: 10px;">
										<div class="col-sm-12">
											<!-- PAGE CONTENT BEGINS -->
											<div class="toSelectGallery">
												<ul class="ace-thumbnails clearfix">
													<li>
														<div>
															<img width="140" height="80" alt="150x150" src="${ctx}/static/images/gallery/image-1.jpg" />
															<!--右下角使用标签 -->
															<div class="tags">
															<span class="label-holder">
																<span class="label label-success arrowed">使用</span>
															</span>
															</div>
															<!-- 鼠标悬浮操作-->
															<div class="text">
																<div class="inner">
																	<!--<span>Some Title!</span>-->
																	<br />
																	<a href="${ctx}/static/images/gallery/image-1.jpg" data-rel="picModal_colorbox">
																		<i class="ace-icon fa fa-search-plus"></i>
																	</a>
																	<a href="#" data-target="tocancel">
																		<i class="ace-icon fa fa-trash-o"></i>
																	</a>
																</div>
															</div>
														</div>
													</li>
													<li>
														<div>
															<img width="140" height="80" alt="150x150" src="${ctx}/static/images/gallery/image-2.jpg" />
															<!--右下角使用标签 -->
															<div class="tags"></div>
															<!-- 鼠标悬浮操作-->
															<div class="text">
																<div class="inner">
																	<!--<span>Some Title!</span>-->
																	<br />
																	<a href="${ctx}/static/images/gallery/image-2.jpg" data-rel="picModal_colorbox">
																		<i class="ace-icon fa fa-search-plus"></i>
																	</a>
																	<a href="#" data-target="toadd">
																		<i class="ace-icon fa  fa-check-square-o"></i>
																	</a>
																</div>
															</div>
														</div>
													</li>
													<li>
														<div>
															<img width="140" height="80" alt="150x150" src="${ctx}/static/images/gallery/image-3.jpg" />
															<!--右下角使用标签 -->
															<div class="tags"></div>
															<!-- 鼠标悬浮操作-->
															<div class="text">
																<div class="inner">
																	<!--<span>Some Title!</span>-->
																	<br />
																	<a href="${ctx}/static/images/gallery/image-3.jpg" data-rel="picModal_colorbox">
																		<i class="ace-icon fa fa-search-plus"></i>
																	</a>
																	<a href="#" data-target="toadd">
																		<i class="ace-icon fa  fa-check-square-o"></i>
																	</a>
																</div>
															</div>
														</div>
													</li>
													<li>
														<div>
															<img width="140" height="80" alt="150x150" src="${ctx}/static/images/gallery/image-4.jpg" />
															<!--右下角使用标签 -->
															<div class="tags"></div>
															<!-- 鼠标悬浮操作-->
															<div class="text">
																<div class="inner">
																	<!--<span>Some Title!</span>-->
																	<br />
																	<a href="${ctx}/static/images/gallery/image-4.jpg" data-rel="picModal_colorbox">
																		<i class="ace-icon fa fa-search-plus"></i>
																	</a>
																	<a href="#" data-target="toadd">
																		<i class="ace-icon fa  fa-check-square-o"></i>
																	</a>
																</div>
															</div>
														</div>
													</li>
													<li>
														<div>
															<img width="140" height="80" alt="150x150" src="${ctx}/static/images/gallery/image-5.jpg" />
															<!--右下角使用标签 -->
															<div class="tags"></div>
															<!-- 鼠标悬浮操作-->
															<div class="text">
																<div class="inner">
																	<!--<span>Some Title!</span>-->
																	<br />
																	<a href="${ctx}/static/images/gallery/image-5.jpg" data-rel="picModal_colorbox">
																		<i class="ace-icon fa fa-search-plus"></i>
																	</a>
																	<a href="#" data-target="toadd">
																		<i class="ace-icon fa  fa-check-square-o"></i>
																	</a>
																</div>
															</div>
														</div>
													</li>

												</ul>
											</div>
											<!-- PAGE CONTENT ENDS -->
										</div>
										<!-- /.col -->
									</div>
									<!-- /.row -->
								</div>
							<div id="picModal_myFile" class="tab-pane">2</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button id="picModal_footer_commitbtn" type="button" class="btn btn-primary">保存</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->




		<!-- 横幅编辑模态框（Modal） -->
		<div class="modal fade" id="bannerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 850px;">
				<div class="modal-content">
					<div class="table-header">
						<button type="button"  class="close" data-dismiss="modal" aria-hidden="true">
							<span class="white" style="font-size: 30px;">&times;</span>
						</button>
						<div class="nav"><i class="ace-icon glyphicon glyphicon-picture white"></i> 横幅设置</div>
					</div>
					<div>
						<ul class="nav nav-tabs padding-20 tab-color-blue background-blue" style="border: 0;">
							<li class="active">
								<a data-toggle="tab" href="#bannerModal_common">常规</a>
							</li>

							<li>
								<a data-toggle="tab" href="#bannerModal_pattern">切换样式</a>
							</li>

							<li>
								<a data-toggle="tab" href="#bannerModal_animation">切换动画</a>
							</li>

							<li>
								<a data-toggle="tab" href="#bannerModal_senior">高级</a>
							</li>
						</ul>
						<div class="tab-content" style="border: 0;">
							<!--常规 -->
							<div id="bannerModal_common" class="tab-pane in active">
								<div class="row">
									<div class="col-xs-1 col-md-1"><label for="form-field-select-1" style="line-height: 30px;">行业：</label></div>
									<div class="col-xs-5 col-md-5">
										<select class="form-control" id="form-field-select-1">
											<option value=""></option>
											<option value="AL">Alabama</option>
											<option value="AK">Alaska</option>
											<option value="AZ">Arizona</option>
											<option value="AR">Arkansas</option>
											<option value="CA">California</option>
											<option value="CO">Colorado</option>
											<option value="CT">Connecticut</option>
											<option value="DE">Delaware</option>
											<option value="FL">Florida</option>
											<option value="GA">Georgia</option>
											<option value="HI">Hawaii</option>
										</select>
									</div>
								</div>
								<!--待选图片画廊 -->
								<div class="row" style="height:200px;overflow-y:scroll;padding:10px;border: 1px solid #ededed;margin: 10px;">
									<div class="col-sm-12">
										<!-- PAGE CONTENT BEGINS -->
										<div class="toSelectGallery">
											<ul class="ace-thumbnails clearfix">
												<!-- 第一种表现形式（暂时不用）-->
												<!--<li>
													<a href="assets/images/gallery/thumb-1.jpg" title="Photo Title" data-rel="colorbox">
														<img width="120" height="80" alt="150x150" src="assets/images/gallery/thumb-1.jpg" />
														<div class="tags">
															<span class="label-holder">
																<span class="label label-success arrowed">使用</span>
															</span>
														</div>
													</a>
													<div class="tools tools-top">
														<a href="#">
															<i class="ace-icon fa fa-link"></i>
														</a>

														<a href="#">
															<i class="ace-icon fa fa-paperclip"></i>
														</a>

														<a href="#">
															<i class="ace-icon fa fa-pencil"></i>
														</a>

														<a href="#">
															<i class="ace-icon fa fa-times red"></i>
														</a>
													</div>

												</li>-->
												<li>
													<div>
														<img width="140" height="80" alt="150x150" src="${ctx}/static/images/gallery/image-1.jpg" />
														<!--右下角使用标签 -->
														<div class="tags">
															<span class="label-holder">
																<span class="label label-success arrowed">使用</span>
															</span>
														</div>
														<!-- 鼠标悬浮操作-->
														<div class="text">
															<div class="inner">
																<!--<span>Some Title!</span>-->
																<br />
																<a href="${ctx}/static/images/gallery/image-1.jpg" data-rel="colorbox">
																	<i class="ace-icon fa fa-search-plus"></i>
																</a>
																<a href="#" data-target="todelete">
																	<i class="ace-icon fa fa-trash-o"></i>
																</a>
															</div>
														</div>
													</div>
												</li>
												<li>
													<div>
														<img width="140" height="80" alt="150x150" src="${ctx}/static/images/gallery/image-2.jpg" />
														<!--右下角使用标签 -->
														<div class="tags"></div>
														<!-- 鼠标悬浮操作-->
														<div class="text">
															<div class="inner">
																<!--<span>Some Title!</span>-->
																<br />
																<a href="${ctx}/static/images/gallery/image-2.jpg" data-rel="colorbox">
																	<i class="ace-icon fa fa-search-plus"></i>
																</a>
																<a href="#" data-target="toadd">
																	<i class="ace-icon fa  fa-check-square-o"></i>
																</a>
															</div>
														</div>
													</div>
												</li>
												<li>
													<div>
														<img width="140" height="80" alt="150x150" src="${ctx}/static/images/gallery/image-3.jpg" />
														<!--右下角使用标签 -->
														<div class="tags"></div>
														<!-- 鼠标悬浮操作-->
														<div class="text">
															<div class="inner">
																<!--<span>Some Title!</span>-->
																<br />
																<a href="${ctx}/static/images/gallery/image-3.jpg" data-rel="colorbox">
																	<i class="ace-icon fa fa-search-plus"></i>
																</a>
																<a href="#" data-target="toadd">
																	<i class="ace-icon fa  fa-check-square-o"></i>
																</a>
															</div>
														</div>
													</div>
												</li>
												<li>
													<div>
														<img width="140" height="80" alt="150x150" src="${ctx}/static/images/gallery/image-4.jpg" />
														<!--右下角使用标签 -->
														<div class="tags"></div>
														<!-- 鼠标悬浮操作-->
														<div class="text">
															<div class="inner">
																<!--<span>Some Title!</span>-->
																<br />
																<a href="${ctx}/static/images/gallery/image-4.jpg" data-rel="colorbox">
																	<i class="ace-icon fa fa-search-plus"></i>
																</a>
																<a href="#" data-target="toadd">
																	<i class="ace-icon fa  fa-check-square-o"></i>
																</a>
															</div>
														</div>
													</div>
												</li>
												<li>
													<div>
														<img width="140" height="80" alt="150x150" src="${ctx}/static/images/gallery/image-5.jpg" />
														<!--右下角使用标签 -->
														<div class="tags"></div>
														<!-- 鼠标悬浮操作-->
														<div class="text">
															<div class="inner">
																<!--<span>Some Title!</span>-->
																<br />
																<a href="assets/images/gallery/image-5.jpg" data-rel="colorbox">
																	<i class="ace-icon fa fa-search-plus"></i>
																</a>
																<a href="#" data-target="toadd">
																	<i class="ace-icon fa  fa-check-square-o"></i>
																</a>
															</div>
														</div>
													</div>
												</li>

											</ul>
										</div>
										<!-- PAGE CONTENT ENDS -->
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
								<!--已选图片画廊 -->
								<div class="row" style="height: 90px;border: 1px solid #ededed;margin: 10px;">
									<div class="availableBannerNum">可使用剩余<span>6</span>张横幅</div>
									<div class="col-sm-12">
										<ul id="bannerModal_common_selectedIMG" class="ace-thumbnails">
											<!--<li class="ui-state-disabled" style="border: 1px dashed black;">+</li>-->
										</ul>
									</div>
								</div>
								<!--设置链接 上传图片按钮 -->
								<div class="row">
									<div class="col-xs-8 col-md-8"></div>
									<div class="col-xs-4 col-md-4">
										<button class="btn btn-white btn-info btn-bold">
											<i class="ace-icon fa fa-link bigger-120 blue"></i>设置链接
										</button>
										<button class="btn btn-white btn-info btn-bold">
											<i class="ace-icon fa fa-cloud-upload bigger-120 blue"></i>上传图片
										</button>
									</div>
								</div>
							</div>
							<div id="bannerModal_pattern" class="tab-pane">2</div>
							<div id="bannerModal_animation" class="tab-pane">

							</div>
							<div id="bannerModal_senior" class="tab-pane">
								<p>bannerModal_senior</p>
								<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button id="bannerModal_footer_commitbtn" type="button" class="btn btn-primary" data-dismiss="modal">提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->


		<!-- 底部栏目编辑模态框（Modal） -->
		<div class="modal fade" id="footerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 850px;">
				<div class="modal-content">
					<div class="table-header">
						<button type="button"  class="close" data-dismiss="modal" aria-hidden="true">
							<span class="white" style="font-size: 30px;">&times;</span>
						</button>
						<div class="nav"><i class="ace-icon glyphicon glyphicon-th-list white"></i> 设置栏目</div>
					</div>
					<div>
						<ul class="nav nav-tabs padding-20 tab-color-blue background-blue" style="border: 0;">
							<li class="active">
								<a data-toggle="tab" href="#footerModal_column">栏目内容</a>
							</li>

							<li>
								<a data-toggle="tab" href="#footerModal_copyright">版权信息</a>
							</li>

						</ul>
						<div class="tab-content" style="border: 0;">
							<!--栏目内容-->
							<div id="footerModal_column" class="tab-pane in active">
								<div class="row">
									<div class="col-sm-12">
										<select multiple="multiple" size="10" name="footer_column" style="height: 220px;">
											<option value="首页">首页</option>
											<option value="关于我们">关于我们</option>
											<option value="联系我们" selected="selected">联系我们</option>
											<option value="留言板">留言板</option>
											<option value="会员登录">会员登录</option>
											<option value="会员注册" selected="selected">会员注册</option>
											<option value="新闻动态">新闻动态</option>
											<option value="产品展示">产品展示</option>
											<option value="法律声明">法律声明</option>
										</select>
									</div>
								</div>
							</div>
							<!-- 版权信息-->
							<div id="footerModal_copyright" class="tab-pane">
								<div class="wysiwyg-editor" id="copyright-editor"></div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button id="footerModal_footer_commitbtn" type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<script src="${ctx}/static/js/sea/sea3.js"></script>
		<script src="${ctx}/static/js/sea/config.js"></script>
		<script type="text/javascript">
            var ctx = "${ctx}";
		</script>
		<script src="${ctx}/assets/js/web/edit/edit.js"></script>
	</body>

</html>