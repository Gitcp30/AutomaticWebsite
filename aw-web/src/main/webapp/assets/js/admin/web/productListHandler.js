/**
 * Created by zzr on 2017/5/15.
 */
define(function(require, exports) {


    var Constants = require('constants');
    var phoenixUtils = require('phoenix.util');
    var componentUtils = require('componentutils');


    var $productTable = $('#productTable');
    var $productAddDialog = $("#productAddDialog");
    var $productAddForm = $("#productAddForm");
    var $product_picSrc = $("#product_picSrc");
    var $productQueryDialog = $("#productQueryDialog");

    var isSeniorQuery = false;
    var currentRow = null;

    // 状态转化
    exports.stateFormatter = function (value,row,index) {
        switch (value){
            case Constants.STATE_NORMAL:return '<span class="label label-sm label-info">正常</span>';break;
            case Constants.STATE_LOCK:return '<span class="label label-sm label-danger">停用</span>';break;
            case Constants.STATE_STICK:return '<span class="label label-sm label-success">置顶</span>';break;
            default:return'未说明';break;
        }
    }



    // 操作
    exports.operateFormatter = function() {
        return [ '<div>',
            '<a class="edit" href="javascript:;" title="编辑">',
            '<span class="fa-stack">', '<i class="glyphicon glyphicon-edit"></i>',
            ,'</span>',
            '</a>',
            '<a class="delete" href="javascript:;" title="删除">',
            '<span class="fa-stack">','<i class="glyphicon glyphicon-remove"></i>',
            '</span>','</a>',
            '</div>' ].join('');
    };
    // 操作事件
    exports.operateEvents = {
        'click .delete' : function(e, value, row) {
            if (!row.productId) {
                return;
            }
            deleteProduct([row]);
        },
        'click .edit' : function(e, value, row) {
            debugger
            $productAddDialog.reset();
            $productAddDialog.toForm(row);
            if(row.productImg !=null && row.productImg !=""){
                $product_picSrc.attr("src",ctx+row.productImg);
            }
            $productAddDialog.modal('show');
            currentRow = row;
        }
    };

    //查询参数
    exports.queryParams = function (tableParams) {
        var params;
        if (isSeniorQuery) {
            params = $productQueryDialog.toObject();
        } else {
            params = {productName: tableParams.search }// 搜索框
        }

        var temp = {
            pageSize: tableParams.limit,   //页面大小
            pageOffset: tableParams.offset,  //页码
        };

        temp = $.extend({}, params, temp);
        return temp;
    };


    // 新增记录
    exports.addproductHandler = function () {
        $productAddDialog.reset();
        $product_picSrc.attr("src","");
        $productAddDialog.modal('show');
    }


    // 重置新增框
    exports.productAddDialogResetHandler = function () {
        debugger
        $product_picSrc.attr("src","");
        $productAddDialog.reset();
    }

    // 新增 提交数据
    exports.productAddDialogCommitHandler = function () {
        var row = $productAddForm.serializeObject();
        var formData = new FormData();
        // 新增
        if(currentRow == null || currentRow == undefined){

            $.each(row, function(key, val) {
                formData.append(key,val);
            });
            // 是否更换图片
            if($('#product_up')[0].files[0] != undefined){
                formData.append('photo', $('#product_up')[0].files[0]);
            }
            // 提交
            phoenixUtils.ajaxRequest(ctx+'/admin/web/saveProduct',formData,function (res) {
                if(res.code == Constants.CODE_SUCCESS){
                    $productAddDialog.modal('hide');
                    $productTable.bootstrapTable('refresh');
                    $product_picSrc.attr("src","");
                    $productAddDialog.reset();
                }else {
                    layer.msg(res.message);
                }
            },{processData: false,contentType: false});
            // 修改
        }else {
            var data = $.extend({}, currentRow, row);
            $.each(data, function(key, val) {
                formData.append(key,val);
            });
            // 是否更换图片
            if($('#product_up')[0].files[0] != undefined){
                formData.append('photo', $('#product_up')[0].files[0]);
            }
            phoenixUtils.ajaxRequest(ctx+'/admin/web/updateProduct',formData,function (res) {
                debugger
                if(res.code == Constants.CODE_SUCCESS){
                    $productAddDialog.modal('hide');
                    $productTable.bootstrapTable('refresh');
                    $productAddDialog.reset();
                    currentRow = null;
                }else {
                    layer.msg(res.message);
                }
            },{processData: false,contentType: false});
        }
    }


    // 删除记录
    exports.deleteProductHandler = function () {
        var selectedRows = $productTable.bootstrapTable('getSelections');
        deleteProduct(selectedRows);
    }

    // 删除记录方法
    function deleteProduct(selectedRows) {
        if(phoenixUtils.hasOne(selectedRows)){
            layer.confirm('确定要删除？', {
                btn: ['确定','取消'] //按钮
            }, function(index, layero){
                var ids = $.map(selectedRows, function(row) {
                    return row.productId;
                });
                phoenixUtils.ajaxRequest(
                    ctx+ "/admin/web/deleteProduct",
                    {productIds: ids},
                    function (res) {
                        if(res.code == Constants.CODE_SUCCESS){
                            $productTable.bootstrapTable('refresh');
                            layer.close(index);
                        }else {
                            layer.msg(res.message);
                        }
                    }
                );

            });
        }
    }


    // 单位启用
    exports.enableHandler = function () {
        updateState(Constants.ENABLE);

    }

    // 单位停用
    exports.disableHandler =function () {
        updateState(Constants.DISABLE);
    }

    // 单位置顶
    exports.stickHandler =function () {
        updateState(Constants.STATE_STICK);
    }



    // 启用/停用/置顶  更新方法
    function  updateState(state) {
        debugger
        var selectedRows = $productTable.bootstrapTable('getSelections');
        // 存在记录
        if(phoenixUtils.hasOne(selectedRows)){
            var ids = $.map(selectedRows, function(row) {
                if(row.status != state ){
                    return row.productId;
                }
            });
            // 是否有可以启用/停用的单位
            if(ids.length == 0){
                layer.msg(Constants.NO_DATA_OPERATE);
                return;
            } else {
                phoenixUtils.ajaxRequest(
                    ctx+ "/admin/web/updateProductState",
                    {'state':state,'productIds':ids},
                    function (res) {
                        if(res.code == Constants.CODE_SUCCESS){
                            $productTable.bootstrapTable('refresh');
                        }else {
                            layer.msg(res.message);
                        }
                    }
                );
            }
        }
    }




    // 高级查询弹框
    exports.queryDialogHandler = function () {
        isSeniorQuery = true;
        $productQueryDialog.modal('show');
    }

    // 高级查询查询事件
    exports.queryDialogCommitHandler = function () {
        $productTable.bootstrapTable('refresh');
        isSeniorQuery = false;
        $productQueryDialog.modal('hide');
    }

    // 高级查询重置
    exports.productQueryResetHandler = function () {
        $productQueryDialog.reset();
    }

});
