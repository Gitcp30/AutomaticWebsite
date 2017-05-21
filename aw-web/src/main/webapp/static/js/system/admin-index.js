/**
 * Created by zzr on 2017/4/27.
 */

    define(function(require, exports, module) {

        var $ = require('jquery');
        require('bootstrap');
        require('bootstrap-table');
        require('bootstrap-table-zh-CN');
        require('ace-elements');
        require('ace');
        require('layer');
        require('layer-css');
        // 自定义方法
        require('phoenix.table');
        require('phoenix.date');
        require('phoenix.form');
        var componentUtils = require('componentutils');

        $(function() {

        var affixwidth = $("#toolbar").outerWidth();
        $("#toolbar .form-inline").width(affixwidth);
        $(".footaffix").width(affixwidth);

        $("#navbar").load(ctx+"/admin/head");
        $("#footer").load(ctx+"/admin/footer");
        $("#page-content").load(ctx+"/admin/welcome");

        var renderSideBar = function(data) {
            var data = data || ctx+"/static/menu.json";
            $.ajax({
                type: "get",
                url: data,
                dataType: "json",
                success: function(data) {
                    $("#sidebar").html(componentUtils.adminMenu(data));
                }
            })
        };

        var load = function(path, command, data) {
            $.ajaxSetup({cache:true});
            $("#page-content").load(ctx+path, function(module, html) {
                module.command = command;
                module.data = data;
                return {
                    module: module
                };
            });

        };

        // 渲染左侧菜单
        renderSideBar(ctx+"/static/menu.json");
        $('#sidebar').delegate('.submenu a', 'click', function() {
            var curhash = $(this).attr('href');
            load(curhash);
            return false;
        });
    })

        loadPagePermission = function(buttonConfigs, callback) {
            var factButton = {};
            for (var b in buttonConfigs) {
                // factButton[b] = buttonConfigs[b];
                //根据按钮查找html中是否已做disabled，如果没有设置值取消控制
                var dom = $(b);
                if (dom) {
                    var btns = dom.hasClass("disabled");
                    if (!btns || btns.length <= 0) {
                        factButton[b] = buttonConfigs[b];
                        continue;
                    }
                }
                if (true) {
                    factButton[b] = buttonConfigs[b]; // b --selecter
                    dom.remove();
                }

            }
            callback = callback || function() {};
            callback(factButton);
        }

        bindEvent = function(data) {
            data = data || {};
            for (var d in data) {
                var dom = $(d);
                if (dom) {
                    dom.removeClass('disabled');
                    e = data[d];

                    var type = e.eventType || 'click';
                    var event = e.event || function() {
                            if (console) {
                                console.log('the button: ' + d + ' eventType :' + type + ' event is empty..')
                            }
                        };
                    var proxy = e.proxy || false;
                    if (proxy) {
                        $('body').off(type, d); // type:click   d:class
                        $('body').on(type, d, event);
                    } else {
                        dom.on(type, event);
                    }
                }
            }
        }

        dateTimeFormatter = function(value,row,index){
            return (new Date(value)).phoenixDateFormat("yyyy-MM-dd hh:mm:ss");
        }

        dateFormatter = function(value,row,index){
            return (new Date(value)).phoenixDateFormat("yyyy-MM-dd");
        }

        date2Formatter = function(value,row,index){
            return (new Date(value)).phoenixDateFormat("yyyy/MM/dd");
        }


});
