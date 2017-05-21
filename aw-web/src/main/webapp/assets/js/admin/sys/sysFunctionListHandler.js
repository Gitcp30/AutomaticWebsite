/**
 * Created by zzr on 2017/5/15.
 */
define(function(require, exports) {


    var Constants = require('constants');
    var phoenixUtils = require('phoenix.util');
    var componentUtils = require('componentutils');

    var $functionAddDialog = $('#functionAddDialog');



    //规模（0:，1:10-50人，2:50人以上）
    exports.companySizeFormatter = function (value,row,index) {
        switch (value){
            case 0:return '<span class="label label-sm label-success">1-10人</span>';break;
            case 1:return '<span class="label label-sm label-warning">10-50人</span>';break;
            case 2:return '<span class="label label-sm label-danger">50人以上</span>';break;
            default:return'未说明';break;
        }
    }

    // 操作
    exports.operateFormatter = function() {
        return [ '<div>',
            '<a class="delete" href="javascript:;" title="删除">',
            '<span class="fa-stack">','<i class="glyphicon glyphicon-remove"></i>',
            '</span>','</a>',
            '</div>' ].join('');
    };
    // 操作事件
     exports.operateEvents = {
    'click .delete' : function(e) {
        var $tr = $(this).parent().parent().parent();
        layer.confirm('确定要删除？', {
            btn: ['确定','取消'] //按钮
        }, function(index, layero){
            var functionId = $tr.find('td:eq(1)').text();
            phoenixUtils.ajaxRequest(ctx+'/admin/sys/deleteFunction',{"functionId":functionId},function (res) {
                debugger
                if(res.code == Constants.CODE_SUCCESS){
                    layer.close(index);
                }else {
                    layer.msg(res.message);
                }
            });


        });





    },
    'click .edit' : function(e) {
        var $this = $(this).parent().parent().parent();

    }
    };

     exports.addDialogHandler = function () {
         $functionAddDialog.reset();
         $functionAddDialog.modal('show');
     }


     exports.addDialogCommitHandler = function () {
         var row = $functionAddDialog.toObject();
         phoenixUtils.ajaxRequest(ctx+'/admin/sys/addFunction',row,function (res) {
             debugger
             if(res.code == Constants.CODE_SUCCESS){
                 $functionAddDialog.modal('hide');
             }else {
                 layer.msg(res.message);
             }
         });
     }


});
