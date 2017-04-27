/**
 * Created by zzr on 2017/4/23.
 * 扩展系统两个ajax方法
 */
define(function(require, exports, module) {
    var $ = require('jquery');

    (function ($) {
        // 两种ajax请求方式：流的形式，form表单提交的形式
        $.ajaxbody = function(options) {
            $.extend(options, {
                type : "POST",
                contentType : "application/json",
                data : $.util.isString(options.data) ? options.data : JSON.stringify(options.data),
                dataType : "json",
                processData : false
            });
            return $.ajax(options);
        };
        $.ajaxform = function(options) {
            $.extend(options, {
                type : "POST",
                dataType : "json"
            });
            return $.ajax(options);
        };
    })(jQuery);

});
