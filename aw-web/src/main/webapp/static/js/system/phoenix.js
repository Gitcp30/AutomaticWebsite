/**
 * Created by zzr on 2017/4/23.
 * 扩展系统两个ajax方法
 */
define(function(require, exports, module) {
    var $ = require('jquery');
    require('bootstrap');
    require('ace-elements');
    require('ace');

    (function ($) {

        $.fn.serializeObject = function() {
            var o = {};
            var a = this.serializeArray();
            $.each(a, function() {
                if (o[this.name] !== undefined) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        };







    })(jQuery);

});
