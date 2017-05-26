<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/static/font-awesome/4.5.0/css/font-awesome.min.css"/>

    <link rel="stylesheet" href="${ctx}/static/css/colorbox.min.css"/>
    <!-- text fonts -->
    <link rel="stylesheet" href="${ctx}/static/css/fonts.googleapis.com.css"/>
    <!-- ace styles -->
    <link rel="stylesheet" href="${ctx}/static/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>
    <!-- 多选样式-->
</head>
<body>
<div class="row">
    <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->

        <div class="error-container">
            <div class="well">
                <h1 class="grey lighter smaller">
					<span class="blue bigger-125"><i class="ace-icon fa fa-sitemap"></i>页面无法访问</span>
                </h1>
                <hr>
                <h3 class="lighter smaller">We looked everywhere but we couldn't find it!</h3>
                <div>
                    <form class="form-search">
						<span class="input-icon align-middle">
							<i class="ace-icon fa fa-search"></i>
                            <input type="text" class="search-query" placeholder="Give it a search...">
						</span>
                        <button class="btn btn-sm" type="button">Go!</button>
                    </form>

                    <div class="space"></div>
                    <h4 class="smaller">Try one of the following:</h4>

                    <ul class="list-unstyled spaced inline bigger-110 margin-15">
                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i> Re-check the url for typos
                        </li>

                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                            Read the faq
                        </li>

                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                            Tell us about it
                        </li>
                    </ul>
                </div>

                <hr>
                <div class="space"></div>

                <div class="center">
                    <a href="javascript:history.back()" class="btn btn-grey">
                        <i class="ace-icon fa fa-arrow-left"></i>
                        Go Back
                    </a>

                    <a href="#" class="btn btn-primary">
                        <i class="ace-icon fa fa-tachometer"></i>
                        Dashboard
                    </a>
                </div>
            </div>
        </div>

        <!-- PAGE CONTENT ENDS -->
    </div><!-- /.col -->
</div>
</body>
</html>
