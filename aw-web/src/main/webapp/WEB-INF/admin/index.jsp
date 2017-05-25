<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>自动建站系统</title>
    <meta name="keywords" content=" ">
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${ctx}/static/font-awesome/4.5.0/css/font-awesome.min.css" />

    <link rel="stylesheet" href="${ctx}/static/css/fonts.googleapis.com.css" />
    <!-- ace styles -->
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap-table.css" />

    <link rel="stylesheet" href="${ctx}/static/css/ace-index.css"  />
    <link rel="stylesheet" href="${ctx}/static/css/common.css"  />

    <link rel="shortcut icon" href="${ctx}/assets/image/favicon.ico">
    <link rel="icon" href="${ctx}/assets/image/favicon.ico">
</head>

<body class="no-skin">
    <div id="navbar" class="navbar navbar-default"></div>
    <!--中间主体部分-->
    <div class="main-container" id="main-container">
        <div id="sidebar" class="sidebar responsive"></div>
        <!--表格 start -->
        <!-- /section:basics/sidebar -->
        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">管理页面</a></li>
                    <%--<li><a href="#">系统控制参数</a></li>--%>
                </ul>
                <!-- /.breadcrumb -->
            </div>
            <div class="main-content-inner" id="page-content">
            </div>
        </div>
        <!-- /.main-content -->
        <!--表格 end -->
        <!--底部-->
        <div class="footer" id="footer"></div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse" title="回到顶部">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>
    <!-- /.main-container -->
    <script src="${ctx}/static/js/sea/sea3.js"></script>
    <script src="${ctx}/static/js/sea/config.js"></script>
    <script type="text/javascript">
        var ctx = "${ctx}";
        seajs.use('admin-index');
    </script>
</body>

</html>
