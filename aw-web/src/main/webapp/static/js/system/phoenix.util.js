/**
 * Created by zzr on 2017/4/23.
 *
 */
define(function(require, exports, module) {

    var Constants = require('constants');

    var defaults = {
        dataType : 'json',
        method : 'post',
        error:function(){
            layer.msg(Constants.SYSTEM_ERROR,{icon:1});
        }
    };

    exports.ajaxRequest = function(url, data,callback,opts) {
        var options = $.extend({}, defaults, opts,{url:url,data:data,success:callback});
        return $.ajax(options);
    };

    exports.jsonAjaxRequest = function(url, data,func) {
        return $.ajax({
            url : url,
            data : JSON.stringify(data),
            type : 'json',
            method : 'post',
            contentType : 'application/json;charset=utf-8',
            success:func,
            error:function(){
                layer.msg(Constants.SYSTEM_ERROR,{icon:1});
            }
        });
    };

    exports.hasOne = function(selectedRows) {
        if (selectedRows.length === 0) {
            layer.msg(Constants.NO_SELECT_RECORD_TIP);
            return false;
        }

        return true;
    };

    exports.hasOnlyOne = function(selectedRows) {
        if (selectedRows.length === 0) {
            layer.msg(Constants.NO_SELECT_RECORD_TIP);
            return false;
        }

        if (selectedRows.length > 1) {
            layer.msg(Constants.SELECT_RECORD_ONLY_ONE);
            return false;
        }

        return true;
    };


});
