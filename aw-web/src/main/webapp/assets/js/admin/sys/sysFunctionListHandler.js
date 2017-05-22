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
                    initTreeGrid();
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
         initSelect();
         $functionAddDialog.modal('show');
     }


     exports.addDialogCommitHandler = function () {
         var row = $functionAddDialog.toObject();
         phoenixUtils.ajaxRequest(ctx+'/admin/sys/addFunction',row,function (res) {
             debugger
             if(res.code == Constants.CODE_SUCCESS){
                 $functionAddDialog.modal('hide');
                 debugger
                 initTreeGrid();
             }else {
                 layer.msg(res.message);
             }
         });
     }


    var initSelect = function () {
        phoenixUtils.ajaxRequest(ctx+'/admin/sys/getMainMenu',{},function (data) {
            // 初始化新增中父节点

            var html = ' <option value=""></option>';
            $.each(data,function (index,menu) {
                html += ' <option value="'+menu.functionId+'">'+menu.text+'</option>';
            });
            $('#funcParentId').html(html);

        });
    }
     var initTreeGrid = function () {
         $('#sysFunctionTable').empty();
         $('#sysFunctionTable').treegridData({
             id: 'functionId',
             parentColumn: 'parentId',
             type: "GET", //请求数据的ajax类型
             url: ctx+'/admin/sys/getAllFunction',   //请求数据的ajax的url
             ajaxParams: {}, //请求数据的ajax的data属性
             expandColumn: null,//在哪一列上面显示展开按钮
             striped: true,   //是否各行渐变色
             bordered: true,  //是否显示边框
             expandAll: true,  //是否全部展开,
             columns: [
                 {
                     title: '菜单名称',
                     field: 'text'
                 },
                 {
                     title: '菜单ID',
                     field: 'functionId'
                 },
                 {
                     title: '类型',
                     field: 'functionType'
                 },
                 {
                     title: '排序序号',
                     field: 'orderNo'
                 },{
                     title: '访问路径',
                     field: 'url'
                 },{
                     title: '图标',
                     field: 'functionClass'
                 },{
                     title: '默认开关',
                     field: 'style'
                 },
                 {
                     title: '描述',
                     field: 'functionDesc'
                 }, {
                     field : 'options',
                     title : '操作',
                     formatter : exports.operateFormatter,
                     events : exports.operateEvents
                 }
             ]
         });
     }
});
