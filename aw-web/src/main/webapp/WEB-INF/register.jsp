<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>注册界面</title>

		<link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${ctx}/static/font-awesome/4.5.0/css/font-awesome.min.css" />

		<link rel="stylesheet" href="${ctx}/static/css/fonts.googleapis.com.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="${ctx}/static/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="${ctx}/static/css/select2.min.css" />

		<link rel="shortcut icon" href="${ctx}/static/image/favicon.ico">
		<link rel="icon" href="${ctx}/static/image/favicon.ico">

		<style>
			body {
				background-color: white;
			}
			
			.middle_panel {
				width: 1037px;
				height: 100%;
				margin: 0 auto;
				font-size: 12px;
			}
			/**
			 * 头部样式
			 */
			
			.webHeader {
				width: 100%;
				height: 80px;
				background: #fff;
			}
			
			.webHeader .headLogo {
				float: left;
				width: 215px;
				height: 100%;
			}
			
			.webHeader .webNav {
				float: left;
				height: 100%;
				position: relative;
				font-size: 14px;
				padding: 0 20px 0 105px;
			}
			
			.webHeader .webNav .nav {
				float: left;
				height: 80px;
				line-height: 80px;
				margin: 0 11px;
				_margin: 0 11px;
				position: relative;
			}
			
			.webHeader .webNav .nav a {
				display: inline-block;
				height: 80px;
				line-height: 80px;
				text-decoration: none;
				font-size: 16px;
				font-family: "微软雅黑";
				color: #333;
			}
			
			.webHeader .webNav .nav a:hover {
				color: #0058ae;
			}
			
			.webHeader .headRight {
				float: right;
				width: 280px;
				height: 80px;
			}
			
			.webHeader .headRight button:first-child {
				margin: 20px 0 0 70px;
			}
			
			.webHeader .headRight button:last-child {
				margin: 19px 0 0 10px;
			}
			.webHeader .headRight button:last-child a{
				text-decoration: none;
			}
			/**
			 * 计数栏样式
			 */
			
			.webRegCount {
				width: 100%;
				height: 56px;
				background: #f8f8f8;
				position: relative;
				z-index: 100;
				box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2) inset;
			}
			
			.webRegCount .regCountLeft {
				float: left;
				height: 100%;
				font-size: 20px;
				font-family: "微软雅黑", "黑体";
				color: #333;
				padding-top: 7px;
				margin-left: 20px;
			}
			
			.banner_reg {
				height: 171px;
				background: url(${ctx}/assets/image/bannerReg2.jpg) center no-repeat;
			}
			
			.regContent {
				padding-top: 20px;
				width: 70%;
				margin: auto;
			}
			
			.webFooter {
				width: 100%;
				background-color: #ddd;
				color: #777;
			}
			
			.webFooter .footLinks {
				text-align: center;
				line-height: 50px;
			}
			
			.webFooter .footLinks span {
				margin: 0 3px;
			}
			
			.webFooter .footLinks a,
			.webFooter .footCpy a {
				color: #777;
				text-decoration: none;
			}
			
			.webFooter .footLinks a:hover {
				color: #0058ae;
			}
			
			.webFooter .footCpy {
				text-align: center;
				line-height: 25px;
			}
		</style>
	</head>

	<body>
		<!-- 头部-->
		<div class="webHeader">
			<div class="middle_panel">
				<a hidefocus="true" class="headLogo" style="background:none;" href="#" title="网站建设专家">
					<img src="${ctx}/assets/image/logo.png" style="width:131px;height:67px;margin-top:8px;" alt="网站建设专家">
				</a>
				<div class="webNav">
					<div class="nav ">
						<a hidefocus="true" href="#" title="自动建站">首页</a>
					</div>
					<div class="nav ">
						<a hidefocus="true" href="#">案例</a>
					</div>
					<div class="nav ">
						<a hidefocus="true" href="#" title="岂止于网站模板">模板</a>
					</div>
					<div class="nav ">
						<a hidefocus="true" href="#">产品</a>
					</div>
					<div class="nav ">
						<a hidefocus="true" href="#">价格</a>
					</div>
					<div class="nav ">
						<a hidefocus="true" href="#">加盟</a>
					</div>
					<div class="nav ">
						<a hidefocus="true" href="http://jz.faisco.com/blog.html" title="网站建设帮助">帮助</a>
					</div>
				</div>

				<div class="headRight">
					<button type="button" class="btn btn-primary btn-round btn-lg">免费注册</button>
					<button type="button" class="btn btn-white btn-round btn-lg"><a href="${ctx}/login">登录</a></button>
				</div>
			</div>
		</div>
		<!-- 注册统计-->
		<div class="webRegCount">
			<div class="middle_panel">
				<div class="regCountLeft">
					<span style="font-size:20px;">我们已累计为&nbsp;</span><span style="font-size:28px; color:#ff6600; font-weight:bold;">13,004,505</span><span style="font-size:28px;">个网站</span><span style="font-size:20px;">&nbsp;提供服务</span>
				</div>
			</div>
		</div>

		<div class="banner_reg"></div>
		<!-- 注册内容-->
		<div class="regContent">
			<div class="widget-box" style="border: 0">
				<div class="widget-body">
					<div class="widget-main">
						<div id="steps-container">
							<div>
								<ul class="steps">
									<li data-step="1" class="active">
										<span class="step">1</span>
										<span class="title">账号注册</span>
									</li>

									<li data-step="2">
										<span class="step">2</span>
										<span class="title">公司信息</span>
									</li>

									<li data-step="3">
										<span class="step">3</span>
										<span class="title">注册结果</span>
									</li>
								</ul>
							</div>

							<hr />

							<div class="step-content pos-rel">
								<div class="step-pane active" data-step="1">
									<form class="form-horizontal" id="user-form">
										<div class="form-group">
											<label class="control-label col-xs-12 col-sm-4	 no-padding-right" for="mailbox">邮箱:</label>
											<div class="col-xs-12 col-sm-3">
												<input type="email" name="mailbox" id="mailbox" class="col-xs-12 col-sm-12" />
											</div>
										</div>

										<div class="space-2"></div>

										<div class="form-group">
											<label class="control-label col-xs-12 col-sm-4 no-padding-right" for="verificationCode">验证码:</label>

											<div class="col-xs-12 col-sm-3">
												<input type="text" name="verificationCode" id="verificationCode" class="col-xs-12 col-sm-4" />
												<div class="col-xs-12 col-sm-2"></div>
												<button type="button" id="getVerificationCode" class="btn btn-sm col-xs-12 col-sm-6">获取验证码</button>
											</div>
										</div>

										<div class="space-2"></div>

										<div class="form-group">
											<label class="control-label col-xs-12 col-sm-4 no-padding-right" for="password">密码:</label>

											<div class="col-xs-12 col-sm-3">
													<input type="password" name="password" id="password" class="col-xs-12 col-sm-12" />
											</div>
										</div>

										<div class="space-2"></div>

										<div class="form-group">
											<label class="control-label col-xs-12 col-sm-4 no-padding-right" for="password2">确认密码:</label>

											<div class="col-xs-12 col-sm-3">
														<input type="password" name="password2" id="password2" class="col-xs-12 col-sm-12" />
											</div>
										</div>
									</form>

								</div>

								<div class="step-pane" data-step="2">
									<form class="form-horizontal" id="company-form">
										<div class="form-group">
											<label class="control-label col-xs-12 col-sm-4	 no-padding-right" for="visitUrl">公司路径(不可修改):</label>
											<div class="col-xs-12 col-sm-3">
												<input type="text" name="visitUrl" id="visitUrl" class="col-xs-12 col-sm-12" />
											</div>
										</div>

										<div class="space-2"></div>

										<div class="form-group">
											<label class="control-label col-xs-12 col-sm-4 no-padding-right">注册主体:</label>

											<div class="col-xs-12 col-sm-3 ">
												<div class="col-xs-12 col-sm-4 no-padding-right no-padding-left">
													<label class="control-label line-height-1 blue">
														<input name="subjectType" value="0" type="radio" class="ace" checked/>
														<span class="lbl">公司</span>
													</label>
												</div>

												<div class="col-xs-12 col-sm-4 no-padding-right no-padding-left">
													<label class="control-label  line-height-1 blue">
														<input name="subjectType" value="1" type="radio" class="ace" />
														<span class="lbl">机构</span>
													</label>
												</div>

												<div class="col-xs-12 col-sm-4 no-padding-right no-padding-left">
													<label class="control-label  line-height-1 blue">
														<input name="subjectType" value="2" type="radio" class="ace" />
														<span class="lbl">个人</span>
													</label>
												</div>
											</div>
										</div>

										<div class="space-2"></div>

										<div class="form-group">
											<label class="control-label col-xs-12 col-sm-4 no-padding-right" for="companyName">名称:</label>

											<div class="col-xs-12 col-sm-3">
												<input type="text" name="companyName" id="companyName" class="col-xs-12 col-sm-12" />
											</div>
										</div>
										<div class="space-2"></div>
										<%--<div class="form-group logoSrc">
											<label class="control-label col-xs-12 col-sm-4 no-padding-right" for="logoSrc">公司logo:</label>

											<div class="col-xs-12 col-sm-3">
												<input id="logoSrc" name=";" type="file"/>
											</div>
										</div>--%>

										<div class="space-2"></div>

										<div class="form-group industryType">
											<label class="control-label col-xs-12 col-sm-4 no-padding-right" for="industryType">所在行业:</label>

											<div class="col-xs-12 col-sm-3">
												<select id="industryType" name="industryType" class="col-xs-12 col-sm-12">
													<option value="">&nbsp;</option>
													<option value="商品贸易">商品贸易</option>
													<option value="生活服务">生活服务</option>
													<option value="商务服务">商务服务</option>
													<option value="科技服务">科技服务</option>
													<option value="工农业">工农业</option>
												</select>
											</div>
										</div>

										<div class="form-group establishmentDate">
											<label class="control-label col-xs-12 col-sm-4 no-padding-right" for="establishmentDate">工商注册时间</label>

											<div class="col-xs-12 col-sm-3">
												<div class="input-group">
													<input class="form-control date-picker" id="establishmentDate" name="establishmentDate" type="text" data-date-format="yyyy-mm-dd" />
													<span class="input-group-addon">
														<i class="fa fa-calendar bigger-110"></i>
													</span>
												</div>
											</div>
										</div>

										<div class="space-2"></div>

										<div class="form-group companySize">
											<label class="control-label col-xs-12 col-sm-4 no-padding-right">公司规模:</label>

											<div class="col-xs-12 col-sm-3 ">
												<div class="col-xs-12 col-sm-4  no-padding-right no-padding-left">
													<label class="control-label line-height-1 blue">
														<input name="companySize" value="0" type="radio" class="ace" checked/>
														<span class="lbl">1-10人</span>
													</label>
												</div>

												<div class="col-xs-12 col-sm-4 no-padding-right no-padding-left">
													<label class="control-label  line-height-1 blue">
														<input name="companySize" value="1" type="radio" class="ace" />
														<span class="lbl">10-50人</span>
													</label>
												</div>

												<div class="col-xs-12 col-sm-4 no-padding-right no-padding-left">
													<label class="control-label  line-height-1 blue">
														<input name="companySize" value="2" type="radio" class="ace" />
														<span class="lbl">50以上</span>
													</label>
												</div>
											</div>
										</div>


									</form>

								</div>

								<div class="step-pane" data-step="3">
									<div class="center">
										<h3 class="green">注册成功!公司信息审核中！</h3>
									</div>
								</div>

							</div>
						</div>

						<hr />
						<div class="wizard-actions">
							<button class="btn btn-prev">
								<i class="ace-icon fa fa-arrow-left" data-la></i>上一步
							</button>
							<button class="btn btn-primary btn-next" data-last="首页">
								<i class="ace-icon fa fa-arrow-right icon-on-right"></i>下一步
							</button>
						</div>
					</div>
					<!-- /.widget-main -->
				</div>
				<!-- /.widget-body -->
			</div>
		</div>

		<!-- 底部-->
		<div class="webFooter">
			<div class="middle_panel">
				<div class="footLinks">
					<!--<span><a hidefocus="true" href="http://jz.faisco.com" title="凡科建站">首页</a></span>-->
					<span><a hidefocus="true" href="#">关于我们</a></span>
					<span><a hidefocus="true" href="#" title="网站建设帮助">帮助中心</a></span>
					<span><a hidefocus="true" href="#" title="本站支持哪些支付方式">支付方式</a></span>
					<span><a hidefocus="true" href="#" target="_blank" rel="nofollow">服务条款</a></span>
					<span><a hidefocus="true" href="#" rel="nofollow">法律声明</a></span>
					<span><a hidefocus="true" href="#" target="_blank">推广客户</a></span>
					<span><a hidefocus="true" href="#" title="自助建站">自助建站</a></span>
					<span><a hidefocus="true" href="#" title="网站建设">网站建设</a></span>
					<span><a hidefocus="true" href="#" title="网站">网站</a></span>
				</div>
				<div class="footCpy">
					<a target="_blank" hidefocus="true" href="#">
						<img src="${ctx}/assets/image/beianIcon.png" width="20" height="20" style="vertical-align:middle;">
						<span style="color:#777;">粤公网安备 4401050XXXXXXX号</span>
					</a>
					<span style="display:inline-block; margin:0 10px;">|</span> Copyright
					<font style="font-family:'微软雅黑';">©</font> 2010-2017 福建省厦门集美大学
				</div>
			</div>
		</div>

		<script src="${ctx}/static/js/sea/sea3.js"></script>
		<script src="${ctx}/static/js/sea/config.js"></script>
		<script type="text/javascript">
            var ctx = "${ctx}";
		</script>
		<script src="${ctx}/assets/js/register.js"></script>
	</body>

</html>