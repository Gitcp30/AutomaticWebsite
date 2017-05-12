/**
 * Created by zzr on 2017/4/27.
 */

    define(function(require, exports, module) {
        var $  = require('jquery');
        var componentUtils = require('componentutils');
        require('bootstrap');
        require('bootstrap-table');
        require('ace-elements');
        require('ace');


    $(function() {

        var affixwidth = $("#toolbar").outerWidth();
        $("#toolbar .form-inline").width(affixwidth);
        $(".footaffix").width(affixwidth);

        $(document).on("show.bs.modal", ".modal[data-move!=false]", function(){
            // 默认可拖动（不设置，或者true时，可拖动）  false时，不可拖。  // 依赖jquery-ui.js
            $(this).draggable({
                handle: ".modal-header"   // 只能点击头部拖动
            });
        });

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

});
