/**
 * Created by zzr on 2017/4/28.
 */
seajs.use(['jquery','jquery.SuperSlide'],function($) {

    $(function(){
        $(".slideBox").slide({ mainCell: ".bd ul", effect: "top"});
        $("#editFooterBtn").on("click",function(){
            var copyrightHtml = $("#webFooter div.footCpy").html();
            $("#copyright-editor").html(copyrightHtml);
        });

    });



});