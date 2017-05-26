<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #navbar-container .navbar-header .nav-user-photo{
        width: 100%;
        height: 100%;
        max-height:40px;
    }
</style>
<!--头部 start-->
<div class="navbar-container" id="navbar-container">
    <!-- #section:basics/sidebar.mobile.toggle -->
    <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
        <span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
    </button>
    <!-- /section:basics/sidebar.mobile.toggle -->
    <div class="navbar-header pull-left">
        <!-- #section:basics/navbar.layout.brand -->
        <a href="#" class="navbar-brand"> <small><i class="fa fa-leaf"></i>自动建站系统</small>
        </a>
        <!-- /section:basics/navbar.layout.brand -->
    </div>
    <!-- #section:basics/navbar.dropdown -->
    <div class="navbar-buttons navbar-header pull-right" role="navigation">
        <ul class="nav ace-nav">
            <!-- #section:basics/navbar.user_menu -->
            <li class="light-blue">
                <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                    <c:if test="${ empty sessionScope.currentUser.picSrc}">
                        <img class="nav-user-photo" src="${ctx}/static/images/avatars/avatar2.png" alt="Jason's Photo" />
                    </c:if>
                    <c:if test="${!empty sessionScope.currentUser.picSrc}">
                        <img class="nav-user-photo" src="${ctx}/${sessionScope.currentUser.picSrc}" alt="Jason's Photo" />
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
                        <a href="#" class="mySelfMsg"> <i class="ace-icon fa fa-user"></i>个人信息
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="${ctx}/loginout"> <i class="ace-icon fa fa-power-off"></i>退出
                        </a>
                    </li>
                </ul>
            </li>
            <!-- /section:basics/navbar.user_menu -->
        </ul>
    </div>
    <!-- /section:basics/navbar.dropdown -->
</div>
<!-- /.navbar-container -->

<script>
    $(function () {
        $("#navbar-container a.mySelfMsg").on("click",function () {
            $("#page-content").load(ctx+"/admin/web/userPage");
        });
    });
</script>
