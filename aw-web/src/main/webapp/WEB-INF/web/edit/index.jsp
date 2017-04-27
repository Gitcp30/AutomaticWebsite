<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title></title>
	<style>
		body {
			/*background-color: white;*/
		}

		* {
			margin: 0;
			padding: 0;
			list-style: none;
		}

		.base_width {
			border: 1px solid red;
			height: 500px;
			margin: 0 auto;
			width: 1000px;
			overflow: hidden;
		}

		#webHeader {
			height: 100px;
			width: 100%;
		}

		#webBanner {
			width: 100%;
			height: 500px;
		}

		#webFooter {
			width: 100%;
			height: 150px;
		}

		/* css 重置 */

		* {
			margin: 0;
			padding: 0;
			list-style: none;
		}

		a {
			text-decoration: none;
			color: #333;
		}
		/* 本例子css */

		.slideBox {
			width: 100%;
			height: 100%;
			overflow: hidden;
			position: relative;
			border: 1px solid #ddd;
		}

		.slideBox .hd {
			height: 15px;
			overflow: hidden;
			position: absolute;
			right: 5px;
			bottom: 5px;
			z-index: 1;
		}

		.slideBox .hd ul {
			overflow: hidden;
			zoom: 1;
			float: left;
		}

		.slideBox .hd ul li {
			float: left;
			margin-right: 2px;
			width: 15px;
			height: 15px;
			line-height: 14px;
			text-align: center;
			background: #fff;
			cursor: pointer;
		}

		.slideBox .hd ul li.on {
			background: #f00;
			color: #fff;
		}

		.slideBox .bd {
			position: relative;
			height: 100%;
			z-index: 0;
		}

		.slideBox .bd li {
			zoom: 1;
			width: 100%;
			height: 500px;
			vertical-align: middle;
		}

		.slideBox .bd img {
			width: 100%;
			height: 100%;
			/*display: block;*/
		}
		/* 下面是前/后按钮代码，如果不需要删除即可 */

		.slideBox .prev,
		.slideBox .next {
			position: absolute;
			left: 3%;
			top: 50%;
			margin-top: -25px;
			display: block;
			width: 32px;
			height: 40px;
			background: url(${ctx}/assets/image/slider-arrow.png) -110px 5px no-repeat;
			filter: alpha(opacity=50);
			opacity: 0.5;
		}

		.slideBox .next {
			left: auto;
			right: 3%;
			background-position: 8px 5px;
		}

		.slideBox .prev:hover,
		.slideBox .next:hover {
			filter: alpha(opacity=100);
			opacity: 1;
		}

		.slideBox .prevStop {
			display: none;
		}

		.slideBox .nextStop {
			display: none;
		}
	</style>
	</head>

	<body>
	<div class="content">
	<!--头部 -->
	<div id="webHeader" class="base_width">webHeaderTable</div>
	<!--横幅-->
		<div id="webBanner" class="base_width">
	<div id="slideBox" class="slideBox">
	<div class="hd">
	<ul>
	 <li>1</li>
			<li>2</li>
				   <li>3</li>
						  </ul>
							</div>
							  <div class="bd">
	<ul style="margin: 0;">
	<li>
	 <a href="http://www.SuperSlide2.com" target="_blank"><img src="${ctx}/assets/image/pic1.jpg" /></a>
	 </li>
	<li>
		<a href="http://www.SuperSlide2.com" target="_blank"><img src="${ctx}/assets/image/pic2.jpg" /></a>
	</li>
	<li>
		<a href="http://www.SuperSlide2.com" target="_blank"><img src="${ctx}/assets/image/pic3.jpg" /></a>
	</li>
	</ul>
</div>

	<!-- 下面是前/后按钮代码，如果不需要删除即可 -->
	<a class="prev" href="javascript:void(0)"></a>
												<a class="next" href="javascript:void(0)"></a>

																							</div>
																							  </div>
	<!--内容区域 -->
	<div id="webContainer">
	<div class="inner_c base_width">
	<button id="tesBtn" data-toggle="modal" data-target="#bannerModal">111</button>
																			</div>
																			  </div>
	<!--底部 -->
	<div id="webFooter" class="base_width">webFooterTable
			</div>
														 </div>

	<script src="${ctx}/assets/js/web/edit/index.js"></script>

	  </body>

		</html>