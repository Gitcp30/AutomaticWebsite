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
        debugger
        return $.ajax(options);
    };


    var defaults2 = {
        dataType : 'json',
        method : 'post',
        contentType : 'application/json;charset=utf-8',
        error:function(){
            layer.msg(Constants.SYSTEM_ERROR,{icon:1});
        }
    };

    exports.jsonAjaxRequest = function(url, data,callback,opts) {
        var options = $.extend({}, defaults2, opts,{url:url,data:JSON.stringify(data),success:callback});
        return $.ajax(options);
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
