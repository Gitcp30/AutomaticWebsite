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
	
	
	
	
	// 渲染视图
	function render(data){
		var template_nav2 = '{{> "begin"}}';
		var compiledTemplate_nav2 = Template7.compile(template_nav2);
		var html = compiledTemplate_nav2(data);
		return html;
	}
	

});