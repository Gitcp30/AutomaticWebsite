/**
 *  页面组件生成工具
 */
define(function(require, exports) {
	require('template7');
	
	// 横幅编辑框->常规->选中图片
	exports.bannerCommonSelectGallery = function(imageName){
		return '<li>'+
					'<div class="selectImg">'+
						'<img src="'+imageName+'" />'+
						'<div class="text">'+
							'<div class="inner">'+
								'<a href="#">'+
									'<i class="ace-icon fa fa-link"></i>'+
								'</a>'+
								'<a href="#" data-target="todelete">'+
									'<i class="ace-icon fa fa-trash-o"></i>'+
								'</a>'+
							'</div>'+
						'</div>'+
					'</div>'+
				'</li>';
	}
    /**
	 * 登录页面返回提示
     * @param msg
     * @returns {string}
     */
	exports.loginMessage = function(msg){
		return '<div class="alert alert-danger">'+
            	'<button type="button" class="close" data-dismiss="alert">'+
            	'<i class="ace-icon fa fa-times"></i></button>'+
            	'<i class="ace-icon fa fa-times">'+msg+'</i>'+
				'</div>';
	}
	
	
	
	// 会员栏
	exports.memberBar = function(data) {
		Template7.registerPartial(
			'begin',
			'<h1>nihao1</h1>'
		);
		return render(data);
	};


	// admin主页的左侧菜单栏
	exports.adminMenu = function(data){
        Template7.registerPartial(
            'begin',
            '<ul class="nav nav-list">' +
            '{{#each this}}' +
            '{{#with mainmenu}}' +
            '<li class="{{style}}">' +
            '<a href="#" class="dropdown-toggle">' +
            '<i class="{{functionClass}}"></i><span class="menu-text">{{text}}</span>' +
            '<b class="arrow fa fa-angle-down"></b>' +
            '</a>' +
            '{{/with}}' +
            '<ul class="submenu nav-show" >' +
            '{{#each submenu}}' +
            '<li><a href="{{url}}" class="active" ><i class="menu-icon fa fa-caret-right"></i>{{text}}</a><b class="arrow"></b></li>' +
            '{{/each}}' +
            '</ul>' +
            '</li>' +
            '{{/each}}' +
            '</ul>'
        );

       return render(data);
	}

    // admin主页的底部链接
    exports.footerLink = function(data){
	    debugger
            Template7.registerPartial(
                'begin',
                '{{#each aaa}}' +
                '<span>' +
                '<a hidefocus="true" href="#">{{name}}</a>'+
                '</span>' +
       			 '{{/each}}'
            );
            return render(data);
        }


    /**
	 * 会员登录
     * @returns {string}
     */
        exports.memberLogin = function(){
     	return '<form class="loginForm">'
            +'<div class="row user_login" componentId="component_login">'
               +'<div class="col-sm-12" style="border-right:1px solid #ddd;">'
              + '<div class="well col-sm-12">'
			  + '<h3>用户登录</h3>'
              +  '<div class="input-group input-group-md">'
             +   '<span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>'
             +   '<input type="text" class="form-control" name="loginName" placeholder="用户名" aria-describedby="sizing-addon1">'
             +   '</div>'
             +   '<div class="input-group input-group-md">'
             +   '<span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-lock"></i></span>'
             +   '<input type="password" class="form-control" name="password" placeholder="密码" aria-describedby="sizing-addon1">'
             +   '</div>'
             +   '<button class="btn btn-success btn-block">登录</button>'
             +   '</div>'
             +   '</div>'
              +  '</div>'
            + '</form>';

		}

    /**
	 * 公司公告
     * @param data
     */
	exports.bulletinBoard = function(data){
            Template7.registerPartial(
                'begin',
                '<div class="row bulletinBoard" componentId="component_bulletinBoard">'+
                '<div class="col-xs-12">'+
                '<div class="panel panel-default">'+
                '<div class="panel-heading"> <span class="glyphicon glyphicon-list-alt"></span><b>公告板</b></div>'+
                '<div class="panel-body">'+
                '<div class="row">'+
                '<div class="col-xs-12">'+
                '<ul class="bulletinBoard-content">'+
                '{{#each news}}' +
					'<li class="news-item"><span>{{createTime}}</span>'+
					'<a href="#" data-bbId = "{{bullentinBoardId}}">《{{bullentinBoardTitle}}》</a>'+
					'</li>'+
                '{{/each}}' +
            	'</ul>'+
            	'</div>'+
			    '</div>'+
            	'</div>'+
            	'<div class="panel-footer"></div>'+
                '</div>'+
                '</div>'+
                '</div>'
            );

            return render(data);
		}

    // 公告细节
	exports.bulletinBoardDetail = function (data) {
        Template7.registerPartial(
            'begin',
            '<div class="row bulletinBoardDetail">'+
            '<div class="col-sm-12" style="border-right:1px solid #ddd;">'+
            '<div class="well col-sm-12">'+
            '<h3><i class="fa fa-file-text" aria-hidden="true"></i> 公告栏信息</h3>'+
            '<h2 align="center">{{bullentinBoardTitle}}</h2>'+
            '<h6 align="center">{{createTime}}</h6>'+
            '<p style="text-indent:2em;">{{bullentinBoardContent}}</p>'+
            '</div>'+
            '</div>' +
            '</div>'
        );
        return render(data);
    }



    // 留言板
	exports.messageBoard = function () {
		return '<form class="messageBoardForm">'+
            '<div class="row messageBoard" componentId="component_messageBoard">'+
            '<div class="col-sm-12" style="border-right:1px solid #ddd;">'+
            '<div class="well col-sm-12">'+
            '<h3><i class="fa fa-file-text" aria-hidden="true"></i> 留言板</h3>'+
            '<div class="input-group input-group-md">'+
            '<span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>'+
            '<input type="text" class="form-control" name="userName" placeholder="用户名" aria-describedby="sizing-addon1">'+
            '<span class="input-group-addon" id="sizing-addon1"><i class="ace-icon fa fa-envelope"></i></span>'+
            '<input type="text" class="form-control" name="mailbox" placeholder="邮箱" aria-describedby="sizing-addon1">'+
            '</div>'+
            '<div class="input-group input-group-md">'+
            '<span class="input-group-addon" id="sizing-addon1"><i class="ace-icon fa fa-pencil-square-o"></i></span>'+
            '<textarea class="form-control" name="content" rows="3" placeholder="请输入留言" aria-describedby="sizing-addon1"></textarea>'+
            '</div>'+
            '<button class="btn btn-info btn-block">提交</button>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</form>';
    }

    // 单位详情信息
    exports.companyDetail =function (data) {
        debugger
        Template7.registerPartial(
            'begin',
            '<div class="table-detail">'+
            '<div class="row">'+
            '<div class="col-xs-10 col-sm-2">'+
            '<div class="text-center">'+
            '{{#if logoSrc}}'+
            '<img height="150" class="thumbnail inline no-margin-bottom" alt="Domain Owners Avatar" src="'+ctx+'{{logoSrc}}" />'+
            '{{else}}'+
            '<img height="150" class="thumbnail inline no-margin-bottom" alt="Domain Owners Avatar" src="'+ctx+'/static/images/avatars/profile-pic.jpg" />'+
            '{{/if}}'+
            '<br />'+
            '<div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">'+
            '<div class="inline position-relative">'+
            '<a class="user-title-label" href="#">'+
            '<i class="ace-icon fa fa-circle light-green"></i>'+
            '&nbsp;'+
            '<span class="white">'+
            '{{#if companyName}}'+
            '{{companyName}}'+
            '{{/if}}'+
            '</span>'+
            '</a>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+


            '<div class="col-xs-12 col-sm-7">'+
            '<div class="space visible-xs"></div>'+

            '<div class="profile-user-info profile-user-info-striped">'+
            '<div class="profile-info-row">'+
            '<div class="profile-info-name">负责人</div>'+

            '<div class="profile-info-value">'+
            '<span>'+
            '{{#if representative}}'+
            '{{representative}}'+
            '{{/if}}'+
            '</span>'+
            '</div>'+
            '</div>'+

            '<div class="profile-info-row">'+
            '<div class="profile-info-name"> 手机号码</div>'+

            '<div class="profile-info-value">'+
            '<span>'+
            '{{#if mobile}}'+
            '{{mobile}}'+
            '{{/if}}'+
            '</span>'+
            '</div>'+
            '</div>'+

            '<div class="profile-info-row">'+
            '<div class="profile-info-name">固定电话</div>'+

            '<div class="profile-info-value">'+
            '<span>'+
            '{{#if telPhone}}'+
            '{{telPhone}}'+
            '{{/if}}'+
            '</span>'+
            '</div>'+
            '</div>'+

            '<div class="profile-info-row">'+
            '<div class="profile-info-name">邮政编码</div>'+

            '<div class="profile-info-value">'+
            '<span>'+
            '{{#if zipCode}}'+
            '{{zipCode}}'+
            '{{/if}}'+
            '</span>'+
            '</div>'+
            '</div>'+


            '<div class="profile-info-row">'+
            '<div class="profile-info-name">员工</div>'+

            '<div class="profile-info-value">'+
            '<span>'+data.count+'名员工<a herf="#" class="getList" style="cursor: pointer;" data-company="{{companyId}}">[查看]</a></span>'+
            '</div>'+
            '</div>'+

            '<div class="profile-info-row">'+
            '<div class="profile-info-name">联系地址</div>'+

            '<div class="profile-info-value">'+

            '<span>'+
            '{{#if address}}'+
            '<i class="fa fa-map-marker light-orange bigger-110"></i> '+
            '{{address}}'+
            '{{/if}}'+
            '</span>'+
            '</div>'+
            '</div>'+


            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'
        );
        return render(data);
    }
	// 渲染视图
	function render(data){
		var template_nav2 = '{{> "begin"}}';
		var compiledTemplate_nav2 = Template7.compile(template_nav2);
		var html = compiledTemplate_nav2(data);
		return html;
	}
	

});