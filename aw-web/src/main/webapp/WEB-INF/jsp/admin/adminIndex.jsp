<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>自动建站系统</title>
    <meta name="keywords" content=" ">
    <link rel="stylesheet" href="${ctx}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${ctx}/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

    <link rel="stylesheet" href="${ctx}/assets/css/fonts.googleapis.com.css" />
    <!-- ace styles -->
    <link rel="stylesheet" href="${ctx}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

    <link rel="shortcut icon" href="${ctx}/img/favicon.ico">
    <link rel="icon" href="${ctx}/img/favicon.ico">
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
                    <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">系統管理</a></li>
                    <li><a href="#">系统控制参数</a></li>
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
    <script src="${ctx}/assets/js/sea/sea3.js"></script>
    <script src="${ctx}/assets/js/sea/config.js"></script>
    <script type="text/javascript">
        var ctx = "${ctx}";
        seajs.use("adminIndex");
    </script>
</body>

</html>
