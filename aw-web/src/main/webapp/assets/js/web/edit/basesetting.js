/**
 * Created by zzr on 2017/5/4.
 */
define(function(require, exports, module) {

    var $ = require('jquery');

    exports.baseSettingMap = '';

    exports.updateBsMap = {};

    exports.getBaseSettings = function () {
        var basesettingMap = '';
            $.ajax({
                type: "GET",
                url: ctx + "/web/edit/getBaseSettings",
                dataType: 'json',
                cache: false,
                async: false,
                success: function (res) {
                    if(res == null){
                        alert("获取系统配置出错了");
                    } else {
                        basesettingMap = res;
                    }
                }, error: function () {
                    alert("获取系统配置出错了");
                }
            });
        return basesettingMap;
    };




});

