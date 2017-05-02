/**
 * Created by zzr on 2017/4/28.
 */
seajs.use(['jquery','lodash','gridstack','jquery.SuperSlide'],function($) {

    $(function(){
        /**
         * 初始化横幅
         */
        $(".slideBox").slide({ mainCell: ".bd ul", effect: "top",autoPlay:true, delayTime:500,interTime:2500});
        /**
         * 底部编辑栏点击确定
         */
        $("a[data-target=#footerModal]").on("click",function(){
            var copyrightHtml = $("#webFooter div.footCpy").html();
            $("#copyright-editor").html(copyrightHtml);
        });


        /**
         * logo设置
         */
        $( "#webLogo" ).draggable({
            containment: ".inner_header", scroll: false,
            opacity: 0.35,
            stop: function(event, ui){
             //   debugger
            }
        });
        $( "#webLogo" ).resizable();

        /*
         * title设置
         */
        $( "#webTitle" ).draggable({
            containment: ".inner_header", scroll: false,
            stop: function(event, ui){
             //   debugger
            }
        });


        var options = {
         float: true,
         vertical_margin:0,
         cell_height:10,
         width:12,
         always_show_resize_handle:false

         };
         $('.grid-stack').gridstack(options);

         new function () {
         this.items = [
         {x: 0, y: 0, width: 12, height: 12},
         {x: 3, y: 1, width: 6, height: 12},
         {x: 4, y: 1, width: 1, height: 1},
         {x: 2, y: 3, width: 3, height: 1},
         //                    {x: 1, y: 4, width: 1, height: 1},
         //                    {x: 1, y: 3, width: 1, height: 1},
         //                    {x: 2, y: 4, width: 1, height: 1},
         {x: 2, y: 5, width: 1, height: 1}
         ];

         this.grid = $('.grid-stack').data('gridstack');

         this.add_new_widget = function () {
         var node = this.items.pop() || {
         x: 12 * Math.random(),
         y: 5 * Math.random(),
         width: 1 + 3 * Math.random(),
         height: 1 + 3 * Math.random()
         };
         this.grid.add_widget($('<div><div class="grid-stack-item-content"><font size="20px">1111</font><div/>'),
         node.x, node.y, 12, 1);
         }.bind(this);

         $('#add-new-widget').click(this.add_new_widget);
         };




    });


});
