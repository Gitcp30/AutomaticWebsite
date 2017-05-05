/**
 * Created by zzr on 2017/4/23.
 * 扩展系统两个ajax方法
 */
define(function(require, exports, module) {
    var $ = require('jquery');

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

        $.fn.myColorpicker = function(){
            var data = getColorData();
            var html = "";
           $.each(data,function(index,value){
               html+="<option value='"+value+"'>"+value+"</option>";
            });

           $(this).append(html);
        };


        /**
         * 图片类型
         * @returns {[string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string,string]}
         */
        var getColorData = function () {
            return ['#ac725e','#d06b64','#f83a22',"#fa573c","#ff7537","#ffad46",
                    "#42d692","#16a765","#7bd148","#b3dc6c","#fbe983","#fad165",
                     "#92e1c0","#9fe1e7","#9fc6e7","#4986e7","#9a9cff","#b99aff",
                     "#c2c2c2","#cabdbf","#cca6ac","#0c89cf","#f691b2","#cd74e6","#a47ae2",
                     "#555","#8b939d","#ffffff","#E4E6E9","#222222"," #cc0010;"
            ];
        }


    })(jQuery);

});
