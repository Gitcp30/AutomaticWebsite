<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/static/font-awesome/4.5.0/css/font-awesome.min.css"/>

    <!-- text fonts -->
    <link rel="stylesheet" href="${ctx}/static/css/fonts.googleapis.com.css"/>
    <!-- ace styles -->
    <link rel="stylesheet" href="${ctx}/static/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>
    <link rel="stylesheet" href="${ctx}/static/css/jquery-ui.min.css"/>
    <!-- 多选样式-->
    <link rel="stylesheet" href="${ctx}/static/css/gridstack.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/newsbox.css"/>
    <link rel="stylesheet" href="${ctx}/assets/css/user/usersite.css"/>
    <link rel="shortcut icon" href="${ctx}/assets/image/favicon.ico">
    <link rel="icon" href="${ctx}/assets/image/favicon.ico">
    <style>

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



        #webContainer {
            margin: 0 auto;
            overflow: hidden;
            width: 80%;
            position: relative;
        }



        #webFooter {
            margin: 0 auto;
            position: relative;
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
            position: relative;
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
            position: relative;
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

        #navbar-container .navbar-header .nav-user-photo{
            width: 100%;
            height: 100%;
            max-height:40px;
        }

    </style>
</head>

<body>


<div id="navbar" class="navbar navbar-default">
    <!--头部 start-->
    <div class="navbar-container" id="navbar-container">
        <!-- #section:basics/sidebar.mobile.toggle -->
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
        </button>
        <!-- #section:basics/navbar.dropdown -->
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <!-- #section:basics/navbar.user_menu -->
                <li class="light-blue islogin ">
                    <c:if test="${! empty sessionScope.currentUser}">
                        <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                            <c:if test="${ empty sessionScope.currentUser.picSrc}">
                                <img class="nav-user-photo" src="${ctx}/pic/logo.jpg" alt="Jason's Photo" />
                            </c:if>
                            <c:if test="${!empty sessionScope.currentUser.picSrc}">
                                <img class="nav-user-photo" src="${ctx}${sessionScope.currentUser.picSrc}" alt="Jason's Photo" />
                            </c:if>
                            <span class="user-info">
                        <small>Welcome,</small>
                        <c:if test="${ empty sessionScope.currentUser.userName}">${sessionScope.currentUser.sysAccount}</c:if>
                        <c:if test="${ !empty sessionScope.currentUser.userName}">${sessionScope.currentUser.userName}</c:if>
                    </span>
                            <i class="ace-icon fa fa-caret-down"></i>
                        </a>
                        <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                            <li>
                                <a href="${ctx}/admin" target="_blank"> <i class="ace-icon fa fa-user"></i>个人信息
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#" class="loginout"> <i class="ace-icon fa fa-power-off"></i>退出
                                </a>
                            </li>
                        </ul>
                    </c:if>
                    <c:if test="${empty sessionScope.currentUser}">
                        <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                            <img class="nav-user-photo" src="${ctx}/pic/logo.png" alt="Jason's Photo" />
                            <span class="user-info"><small>用户未登录,</small>前往登录</span>
                            <span class="user-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        </a>
                    </c:if>
                </li>
                <!-- /section:basics/navbar.user_menu -->

            </ul>
        </div>
        <!-- /section:basics/navbar.dropdown -->
    </div>
    <!-- /.navbar-container -->

</div>

<div class="content">
    <!--头部 -->
    <div id="webHeader" style="overflow: hidden">
        <div class="inner_header">
            <!-- logo-->
            <div id="webLogo" class="ui-widget-content">
                <div class="weblogo-content">
                   <img src="#" />
                </div>
            </div>
            <!-- 标题-->
            <div id="webTitle" class="ui-widget-content">
                   <span></span>
            </div>
        </div>
    </div>
    <!-- 菜单栏-->
    <div id="webMenu">
        <div class="inner_menu">
               <ul class="nav nav-pills nav-justified">
                   <c:forEach items="${requestScope.sysMenuColumns}" var="menuCol">
                       <%--<li style="background-color: #cc0010;"><a href="#">首页</a></li>--%>
                       <c:if test="${menuCol.isMenu== true}">
                           <li><a hidefocus="true" href="${menuCol.url}">${menuCol.columnName}</a></li>
                       </c:if>
                   </c:forEach>
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
                <c:forEach items="${requestScope.sysMenuColumns}" var="linkCol">
                    <c:if test="${linkCol.isFooterLink== true}">
                        <span><a hidefocus="true" href="${linkCol.url}">${linkCol.columnName}</a></span>
                    </c:if>
                </c:forEach>
            </div>
            <div class="footCpy">
                ${webFooter.copyrightText}
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/js/sea/sea3.js"></script>
<script src="${ctx}/static/js/sea/config.js"></script>
<script type="text/javascript">
    var ctx = "${ctx}";
</script>
<script src="${ctx}/assets/js/web/public/index.js"></script>
</body>

</html>