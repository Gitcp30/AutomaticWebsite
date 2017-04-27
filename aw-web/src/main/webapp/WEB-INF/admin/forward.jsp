<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>主板</title>
    <meta name="keywords" content=" ">
    <link href="libs/css/bootstrap.css" rel="stylesheet">
    <link href="libs/css/font-awesome.css" rel="stylesheet">
    <link href="libs/css/ace.css" rel="stylesheet">
    <link href="libs/css/common.css" rel="stylesheet">
    <!--[if lte IE 8]>
    <link href="libs/css/hackie8.css" rel="stylesheet" />
    <script type="text/javascript" src="libs/js/plus/html5shiv.js"></script>
    <script type="text/javascript" src="libs/js/plus/respond.js"></script>
    <![endif]-->
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
    <script src="libs/js/sea/sea3.js"></script>
    <script src="libs/js/sea/config.js"></script>
    
    <script type="text/javascript">
	    seajs.use(['common','./bdmweb/common/js/util'],function(common,util){
	    	phoenix.utils.load(util.getUrlParam('forward')+'?params='+util.getUrlParam('params'));
	    });
    </script>
</body>

</html>
