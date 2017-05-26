<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${ctx}/static/css/gridstack.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/newsbox.css"/>
    <link rel="stylesheet" href="${ctx}/assets/css/user/usersite.css"/>
    <link rel="shortcut icon" href="${ctx}/assets/image/favicon.ico">
    <link rel="icon" href="${ctx}/assets/image/favicon.ico">
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
            height: 350px;
            position: relative;
        }

        #webBanner:hover .editLayer {
            display: block;
        }

        #webContainer {
            margin: 0 auto;
            overflow: hidden;
            width: 80%;
            position: relative;
        }

        #webContainer:hover >.editLayer {
            display: block;
        }

        #webFooter {
            margin: 0 auto;
             height: 80px;
            /* border: 1px solid red;*/
            background-color: #222222;
            position: relative;
            height: 80px;
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
            text-decoration: none;
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
            /*display: none;*/
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
            height: 350px;
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
            /*height: 80px;
            width: 280px;*/
            position: relative;
            /*opacity: 1;
            left: 235px;
            top:12px;*/
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
/*
            top:-70px;
            left: 648px;*/
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
            background-color: #e60012;
        }

        #webMenu:hover .editLayer {
            display: block;
        }

        .inner_menu{
            width: 70%;
            height:50px;
            margin: 0 auto;
            overflow: hidden;
        }
        #webMenu .inner_menu  .nav>li>a {
            color: #ffffff;
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
                   <img src="#" />
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
                   <span></span>
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
                   <c:forEach items="${requestScope.webColumn_menu}" var="menuCol">
                       <%--<li style="background-color: #cc0010;"><a href="#">首页</a></li>--%>
                           <li><a hidefocus="true" href="${ctx}/web/edit/editPage/${menuCol.url}">${menuCol.columnName}</a></li>
                   </c:forEach>


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
                    <c:forEach items="${requestScope.webBannerImgList}" var="bannerImg" varStatus="idx">
                        <li>${idx.index+1}</li>
                    </c:forEach>
                </ul>
            </div>
            <div class="bd">
                <ul style="margin: 0;">
                    <c:forEach items="${requestScope.webBannerImgList}" var="bannerImg">
                        <li>
                            <a href="${bannerImg.picUrl}" target="_blank">
                                <img  src="${ctx}${bannerImg.bannerPic}"/></a>
                        </li>
                    </c:forEach>
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
        <!--悬浮编辑栏-->
        <div class="editLayer addModel">
            <ul>
                <li><a href="#">添加</a></li>
            </ul>
        </div>
    </div>
    <!--底部 -->
    <div id="webFooter">
        <div class="inner_footer">
            <div class="footLinks">
                <c:forEach items="${requestScope.webColumn_link}" var="linkCol">
                        <span><a hidefocus="true" href="${linkCol.url}">${linkCol.columnName}</a></span>
                </c:forEach>
            </div>
            <div class="footCpy">
                ${webFooter.copyrightText}
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



<!-- 组件编辑模态框（Modal） -->
<div class="modal fade" id="componentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 600px;">
        <div class="modal-content">
            <div class="table-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    <span class="white" style="font-size: 30px;">&times;</span>
                </button>
                <div class="nav"><i class="ace-icon glyphicon glyphicon-th-list white"></i> 组件列表</div>
            </div>
            <div>
                <ul class="nav nav-tabs padding-20 tab-color-blue background-blue" style="border: 0;">
                    <li class="active">
                        <a data-toggle="tab" href="#componentModal_login">登录</a>
                    </li>

                    <li>
                        <a data-toggle="tab" href="#componentModal_bulletinBoard">公告栏</a>
                    </li>


                    <li>
                        <a data-toggle="tab" href="#componentModal_messageBoard">留言板</a>
                    </li>

                </ul>
            </div>
            <div class="tab-content" style="border: 0;">
                <!--登录-->
                <div id="componentModal_login" class="tab-pane in active">
                    <div class="row">
                        <div class="col-xs-3 col-sm-3">
                            <label>
                                <input name="componentModal_component" type="radio" class="ace" value="component_login"/>
                                <span class="lbl">登录</span>
                            </label>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                            <label>
                                <input name="componentModal_component" type="radio" class="ace" value="component_bulletinBoard"/>
                                <span class="lbl">公告</span>
                            </label>
                        </div>
                        <div class="col-xs-3 col-sm-3">
                            <label>
                                <input name="componentModal_component" type="radio" class="ace" value="component_messageBoard"/>
                                <span class="lbl">留言板</span>
                            </label>
                        </div>

                        <div class="col-xs-3 col-sm-3">
                            <label>
                                <input name="componentModal_component" type="radio" class="ace" value="component_register"/>
                                <span class="lbl">用户注册</span>
                            </label>
                        </div>

                        <div class="col-xs-3 col-sm-3">
                            <label>
                                <input name="componentModal_component" type="radio" class="ace" value="component_product"/>
                                <span class="lbl">产品</span>
                            </label>
                        </div>
                    </div>
                </div>
                <!-- 公告栏-->
                <div id="componentModal_bulletinBoard" class="tab-pane">
                    2
                </div>

                <!-- 留言板-->
                <div id="componentModal_messageBoard" class="tab-pane">
                    3
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="componentModal_footer_commitbtn" type="button" class="btn btn-primary" data-dismiss="modal">
                    保存
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<script src="${ctx}/assets/js/web/edit/index.js"></script>
</body>

</html>