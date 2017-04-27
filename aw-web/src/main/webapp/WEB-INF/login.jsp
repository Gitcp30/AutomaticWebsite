<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户登录</title>

		<link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${ctx}/static/font-awesome/4.5.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx}/static/css/fonts.googleapis.com.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="${ctx}/static/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<link rel="shortcut icon" href="${ctx}/assets/image/favicon.ico">
		<link rel="icon" href="favicon.ico">

		<style>
			body {
				background-color: #f0f6fe;
			}
			
			.webHeader {
				width: 100%;
				background-color: #fff;
				font-size: 12px;
			}
			
			.webHeader .middle_panel {
				width: 960px;
				margin: auto;
				height: 92px;
			}
			
			.webHeader .middle_panel .left {
				float: left;
				width: 310px;
				height: 100%;
				padding-left: 15px;
				background: url(${ctx}/assets/image/logo3.jpg) 0 40% no-repeat;
			}
			
			.webHeader .middle_panel .left a {
				display: inline-block;
				width: 100%;
				height: 100%;
			}
			
			.webHeader .middle_panel .right_link {
				float: right;
				margin-right: 40px;
			}
			
			.webHeader .middle_panel .right_link .sep {
				width: 5px;
				height: 15px;
				background: url(${ctx}/assets/image/dian.jpg) no-repeat center;
			}
			
			.webHeader .middle_panel .right_link a {
				color: #676767;
				font-size: 12px;
				height: 90px;
				line-height: 90px;
				text-decoration: none;
			}
			
			.webHeader .middle_panel .right_link a:hover {
				color: #2f82ff;
			}
			/**
			 * 内容部分
			 */
			
			.webContent {
				width: 1058px;
				margin: auto;
			}
			
			.webContent .left {
				width: 550px;
				height: 534px;
				float: left;
				margin: 10px 100px 0 0;
				background: url(${ctx}/assets/image/regVersion2016.png) -344px 0 no-repeat;
			}
			
			.webContent .right {
				width: 340px;
				height: auto;
				padding: 30px 32px;
				float: left;
				background: #fff;
				margin-top: 80px;
				box-shadow: 0 0 6px rgba(0, 0, 0, .08);
				-moz-box-shadow: 0 0 6px rgba(0, 0, 0, .08);
				-webkit-box-shadow: 0 0 6px rgba(0, 0, 0, .08);
			}
			
			.webContent .righttop {
				height: 44px;
				line-height: 44px;
				font-size: 18px;
				color: #2f82ff;
			}
			
			.webContent .righttop a {
				color: #acacac;
				font-size: 16px;
				cursor: pointer;
			}
			
			.webfooter {
				float: right;
				margin: 30px 45px 0 0;
				line-height: 23px;
				font-size: 13px;
				padding-right: 40px;
			}
			.webContent .right .commit-form .form-control{
				height: 44px;
			}
			
			.webContent .right .commit-form i{
				line-height: 42px;
			}
			.webContent .right .commit-form .clearfix{
				margin-bottom: 10px;
			}
			
			.webContent .right .commit-form .verificationCode{
				height:42px;
				width: 48%;
				float:right;
				cursor: pointer;
			}
			
			.webContent .right .commit-form .forgetPwd{
				font-size:12px ;
				float: right;
				padding-top: 10px;
				margin-bottom: 26px
			}
			.webContent .right .commit-form .form-msg{
				display: inline-block;
				width: 60%;
			}

			.webContent .right .commit-form .form-msg div{
				padding: 0 15px;
				margin-bottom: 0;
			}

		</style>
	</head>

	<body>
		<div class="webHeader">
			<div class="middle_panel">
				<div class="left">
					<a class="logo" href="#" target="_blank"></a>
				</div>
				<div class="right_link">
					<a href="#" target="_blank">免费注册</a>
					<span class="sep">&nbsp;</span>
					<a href="#" target="_blank">代理加盟</a>
					<span class="sep">&nbsp;</span>
					<a href="#" target="_blank" rel="nofollow">投诉建议</a>
				</div>
			</div>
		</div>
		</div>
		<div class="webContent">
			<div class="left"></div>
			<div class="right">
				<div class="righttop">登录&nbsp;
					<a href="${ctx}/register">/注册</a>
				</div>
				<div class="commit-form">
						<label class="block clearfix">
							<span class="block input-icon input-icon-left">
								<input type="text" name="userName" class="form-control" placeholder="邮箱/账号"  />
									<i class="ace-icon fa fa-user"></i>
							</span>
						</label>

						<label class="block clearfix">
							<span class="block input-icon input-icon-left">
								<input type="password" name="password" class="form-control" placeholder="密码"/>
									<i class="ace-icon fa fa-lock"></i>
							</span>
						</label>
						
						<label class="block">
							<span class="input-icon input-icon-left" style="width: 40%;">
								<input type="text" name="verificationCode" class="form-control" placeholder="验证码"/>
									<i class="ace-icon fa fa-key"></i>
							</span>
							<img class="verificationCode" src="${ctx}/validatecode/get"/>
						</label>

					<label class="block">
						<div class="form-msg">

						</div>

						<div class="forgetPwd">
							<a href="#">忘记密码？</a>
						</div>
					</label>

					<button class="btn btn-lg btn-round btn-primary btn-block">登录</button>
				</div>
			</div>

			<div class="webfooter">
				Copyright© 2010-2017 福建省厦门市集美大学
			</div>
		</div>

		<script src="static/js/sea/sea3.js"></script>
		<script src="static/js/sea/config.js"></script>
		<script type="text/javascript">
            var ctx = "${ctx}";
		</script>
		<script src="${ctx}/assets/js/login.js"></script>
	</body>

</html>