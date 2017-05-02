/**
 * Created by zzr on 2017/4/28.
 */
seajs.use(['jquery', 'lodash','componentutils', 'gridstack', 'jquery.SuperSlide'], function ($, _,componentUtils) {

    var options = {
        auto: false,
        float: true,
        vertical_margin: 0,
        cell_height: 10,
        always_show_resize_handle: false

    };


    $(function () {
        /**
         * 初始化横幅
         */
        $(".slideBox").slide({mainCell: ".bd ul", effect: "top", autoPlay: true, delayTime: 500, interTime: 2500});
        /**
         * 底部编辑栏点击确定
         */
        $("a[data-target=#footerModal]").on("click", function () {
            var copyrightHtml = $("#webFooter div.footCpy").html();
            $("#copyright-editor").html(copyrightHtml);
        });


        /**
         * logo设置
         */
        $("#webLogo").draggable({
            containment: ".inner_header", scroll: false,
            opacity: 0.35,
            stop: function (event, ui) {
                //   debugger
            }
        });
        $("#webLogo").resizable();

        /*
         * title设置
         */
        $("#webTitle").draggable({
            containment: ".inner_header", scroll: false,
            stop: function (event, ui) {
                //   debugger
            }
        });

        // 第一种布局
        var serialized_data = [
            {x: 0, y: 0, width: 3, height: 20},
            {x: 4, y: 0, width: 9, height: 20},
        ];


/*
        var serialized_data = [
            {x: 0, y: 0, width: 12, height: 20},
        ];*/

        var html = '<div class="editLayer"><ul> <li><a>删除</a></li></ul> </div>';


        $('.grid-stack').gridstack(options);
        var demoGrid = $('.grid-stack').data('gridstack');

        var gridMethod = {
            load_grid: function (data) {
                demoGrid.remove_all();
                var items = GridStackUI.Utils.sort(data);
                _.each(items, function (node) {
                    demoGrid.add_widget($('<div><div class="grid-stack-item-content"><div class="addNewModule"></div></div>'+html),
                        node.x, node.y, node.width, node.height);

                });
            },
            save_grid: function () {
                var data = _.map($('.grid-stack > .grid-stack-item:visible'), function (el) {
                    el = $(el);
                    var node = el.data('_gridstack_node');
                    return {
                        x: node.x,
                        y: node.y,
                        width: node.width,
                        height: node.height
                    };
                });
                return JSON.stringify(data, null, ' ');
            },
            add_widget:function(){
                demoGrid.add_widget($('<div><div class="grid-stack-item-content">1adddada</div>'+html),
                   8, 8, 2, 2);
            },
            delete_widget:function () {
                demoGrid.remove_widget();
            }

        };


        gridMethod.load_grid(serialized_data);

        $("#getData").on("click",function () {
            var aa = gridMethod.save_grid();
            gridMethod.add_widget();
            var aa = gridMethod.save_grid();
        });

        $("#webContainer .grid-stack .editLayer").on("click",function () {
            var self = this;
            var parent = $(this).parent();
            demoGrid.remove_widget(parent);
            return ;
        });


        /**
         * 点击添加图片
         */
        $("#webContainer .grid-stack-item-content .addNewModule").on("click",function () {
            var content = $(this).parent();
            $(content).empty().html(componentUtils.memberLogin());
            debugger
        });

    });


});
