<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${ctx}/static/css/gridstack.css"/>
    <link rel="stylesheet" href="${ctx}/assets/css/user/userlogin.css"/>
    <link rel="shortcut icon" href="${ctx}/assets/image/favicon.ico">
    <link rel="icon" href="favicon.ico">
    <style>
        body {
            /*background-color: white;*/
        }

        * {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        #webHeader {
            height: 100px;
        }

        #webHeader .inner_header {
            width: 100%;
            height: 100%;
            margin: 0 auto;
            overflow: hidden;

        }

        #webBanner {
            margin: 0 auto;
            height: 500px;
            position: relative;
        }

        #webBanner:hover .editLayer {
            display: block;
        }

        #webContainer {
            margin: 0 auto;
            border: 1px solid red;
            overflow: hidden;
            width: 80%;
        }

        #webFooter {
            margin: 0 auto;
            /* height: 100px;*/
            /* border: 1px solid red;*/
            background-color: #222222;
            position: relative;
        }

        #webFooter:hover .editLayer {
            display: block;
        }

        #webFooter .inner_footer {
            margin: 0 auto;
            overflow: hidden;

        }

        .inner_footer .footLinks {
            line-height: 50px;
            height: 50px;
            text-align: center;
            overflow: hidden;
        }

        .inner_footer .footLinks span {
            margin: 0 10px;
            font-size: 14px;
        }

        .inner_footer .footLinks a {
            color: #8b939d;
            text-decoration: none;
        }

        .inner_footer .footLinks a:hover {
            color: #ffffff /*!important*/;
        }

        .inner_footer .footCpy {
            text-align: center;
            /* line-height: 25px;
             color: #8b939d;
             height: 25px;*/
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

        /**logo**/
        #webLogo{
            height: 80px;
            width: 80px;
            position: relative;
        }

        #webLogo:hover .editLayer {
            display: block;
        }

        #webLogo:hover {
            border: 1px dashed blue;
        }

        .editLayer{
            height: 24px;
            display: none;
            position: absolute;
            top:0;
        }

        .editLayer ul{
            margin: 0;
            list-style: none;
        }
        .editLayer ul li{
            float: left;
            width: 60px;
            height: 24px;
            text-align: center;
            line-height: 24px;
        }
        .editLayer ul li a{
            display: block;
            width: 100%;
            height: 100%;
            text-decoration: none;
            background-color: #4f97df;
            color:#fff;
            font-size: 12px;
        }
        .editLayer ul li a:hover{
            text-decoration:underline;
        }


        #webLogo  .weblogo-content{
            height: 100%;
            width: 100%;
        }

        #webLogo  .weblogo-content img{
            height: 100%;
            width: 100%;
        }
        /**标题**/
        #webTitle {
            display: inline;
            top:-50px;
            left: 750px;
        }
        #webTitle:hover .editLayer {
            display: block;
        }

        #webTitle:hover {
           /* border: 1px dashed blue;*/
        }

        /**菜单栏**/
        #webMenu{
            height: 50px;
            position: relative;
            overflow: hidden;
        }

        #webMenu:hover .editLayer {
            display: block;
        }

        .inner_menu{
            width: 100%;
            height:50px;
            margin: 0 auto;
            overflow: hidden;
        }
        #webMenu .inner_menu  .nav>li>a {
            padding: 15px 15px;
        }
        #webMenu .inner_menu ul{
            margin: 0;
        }

        .grid-stack-item:hover .editLayer{
            display: block;
            left:10px;
        }
        .grid-stack-item  .editLayer{
            cursor: pointer;
        }


        #webContainer .grid-stack-item-content{
            border: 1px dashed #3298fe;
        }

        #webContainer .grid-stack-item-content .addNewModule{
            background: url(${ctx}/assets/image/mbg01.png) -611px -189px no-repeat;
            height: 54px;
            width: 206px;
            margin: 0 auto;
            cursor: pointer;

        }

        
    </style>
</head>

<body id="indexBody">

<div class="content">
    <!--头部 -->
    <div id="webHeader" style="overflow: hidden">
        <div class="inner_header">
            <!-- logo-->
            <div id="webLogo" class="ui-widget-content">
                <div class="weblogo-content">
                   <img src="${ctx}/assets/image/pic7.jpg" />
                </div>
                <!--悬浮编辑栏-->
                <div class="editLayer">
                    <ul>
                        <li><a href="#" data-toggle="modal" data-target="#logoModal" >编辑</a></li>
                    </ul>
                </div>
            </div>
            <!-- 标题-->
            <div id="webTitle" class="ui-widget-content">
                   <span>qqqq</span>
                <!--悬浮编辑栏-->
                <div class="editLayer">
                    <ul>
                        <li><a href="#" data-toggle="modal" data-target="#titleModal" >编辑</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- 菜单栏-->
    <div id="webMenu">
        <div class="inner_menu">
               <ul class="nav nav-pills nav-justified">
                   <li class="active"><a href="#">Home</a></li>
                   <li><a href="#">SVN</a></li>
                   <li><a href="#">iOS</a></li>
                   <li><a href="#">VB.Net</a></li>
                   <li><a href="#">Java</a></li>
                   <li><a href="#">PHP</a></li>
               </ul>
        </div>
        <!--悬浮编辑栏-->
        <div class="editLayer">
            <ul>
                <li><a href="#" data-toggle="modal" data-target="#menuModal" >编辑</a></li>
            </ul>
        </div>
    </div>
    <!--横幅-->
    <div id="webBanner">
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
                        <a href="http://www.SuperSlide2.com" target="_blank"><img
                                src="${ctx}/assets/image/pic1.jpg"/></a>
                    </li>
                    <li>
                        <a href="http://www.SuperSlide2.com" target="_blank"><img
                                src="${ctx}/assets/image/pic2.jpg"/></a>
                    </li>
                    <li>
                        <a href="http://www.SuperSlide2.com" target="_blank"><img
                                src="${ctx}/assets/image/pic3.jpg"/></a>
                    </li>
                </ul>
            </div>

            <!-- 下面是前/后按钮代码，如果不需要删除即可 -->
            <a class="prev" href="javascript:void(0)"></a>
            <a class="next" href="javascript:void(0)"></a>

        </div>
        <!--悬浮编辑栏-->
        <div class="editLayer">
            <ul>
                <li><a href="#" data-toggle="modal" data-target="#bannerModal" >编辑</a></li>
            </ul>
        </div>
    </div>

    <!--内容区域 -->
    <div id="webContainer">
        <div class="grid-stack">
        </div>
    </div>
    <!--底部 -->
    <div id="webFooter">
        <div class="inner_footer">
            <div class="footLinks">
                <span><a hidefocus="true" href="#">关于我们</a></span>
                <span><a hidefocus="true" href="#" title="网站建设帮助">帮助中心</a></span>
                <span><a hidefocus="true" href="#" title="本站支持哪些支付方式">支付方式</a></span>
                <span><a hidefocus="true" href="#" target="_blank" rel="nofollow">服务条款</a></span>
                <span><a hidefocus="true" href="#" rel="nofollow">法律声明</a></span>
                <span><a hidefocus="true" href="#" title="本站支持哪些支付方式">支付方式</a></span>
                <span><a hidefocus="true" href="#" target="_blank" rel="nofollow">服务条款</a></span>
                <span><a hidefocus="true" href="#" rel="nofollow">法律声明</a></span>
            </div>
            <div class="footCpy">
                <font color="#cabdbf" size="3">
                    Copyright © 2010-2017 福建省厦门集美大学
                </font>
            </div>
        </div>
        <!--悬浮编辑栏-->
        <div class="editLayer">
            <ul>
                <li><a href="#" data-toggle="modal" data-target="#footerModal" >编辑</a></li>
            </ul>
        </div>
    </div>
</div>

<script src="${ctx}/assets/js/web/edit/index.js"></script>
</body>

</html>