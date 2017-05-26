/**
 * Created by zzr on 2017/5/15.
 */
define(function(require, exports) {


    var Constants = require('constants');
    var phoenixUtils = require('phoenix.util');
    var componentUtils = require('componentutils');


    var $productTable = $('#productTable');




    var $bullentinBoardTable = $('#bullentinBoardTable');
    var $bullentinBoardAddDialog = $('#bullentinBoardAddDialog');
    var $bullentinBoardEditor = $('#bullentinBoard-editor');
    var $bullentinBoardQueryDialog = $('#bullentinBoardQueryDialog');

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

    // 标题转化
    exports.titleFormatter = function (value,row,index) {
        return '<span>《'+value+'》</span>';
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
            if (!row.bullentinBoardId) {
                return;
            }
            deleteBullentinBoard([row]);
        },
        'click .edit' : function(e, value, row) {
            $bullentinBoardAddDialog.reset();
            $bullentinBoardAddDialog.toForm(row);
            $bullentinBoardEditor.html(row.bullentinBoardContent);
            $bullentinBoardAddDialog.modal('show');
            currentRow = row;
        }
    };

    //查询参数
    exports.queryParams = function (tableParams) {
        var params;
        if (isSeniorQuery) {
            params = $bullentinBoardQueryDialog.toObject();
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
    exports.addbullentinBoardHandler = function () {
        $bullentinBoardAddDialog.reset();
        $bullentinBoardEditor.empty();
        $bullentinBoardAddDialog.modal('show');
    }


    // 重置新增框
    exports.bbAddDialogResetHandler = function () {
        $bullentinBoardAddDialog.reset();
        $bullentinBoardEditor.empty();
    }

    // 新增 提交数据
    exports.bbAddDialogCommitHandler = function () {
        // 获取数据
        var row = $bullentinBoardAddDialog.toObject();
        row['bullentinBoardContent'] = $bullentinBoardEditor.html();
        // 新增
        if(currentRow == null || currentRow == undefined){
            // 提交
            phoenixUtils.jsonAjaxRequest(ctx+'/admin/web/saveBullentinBoard',row,function (res) {
                if(res.code == Constants.CODE_SUCCESS){
                    $bullentinBoardAddDialog.modal('hide');
                    $bullentinBoardTable.bootstrapTable('refresh');
                    $bullentinBoardAddDialog.reset();
                    $bullentinBoardEditor.empty();
                }else {
                    layer.msg(res.message);
                }
            });
            // 修改
        }else {
            var data = $.extend({}, currentRow, row);
            debugger
            phoenixUtils.jsonAjaxRequest(ctx+'/admin/web/updateBullentinBoard',data,function (res) {
                debugger
                if(res.code == Constants.CODE_SUCCESS){
                    $bullentinBoardAddDialog.modal('hide');
                    $bullentinBoardTable.bootstrapTable('refresh');
                    $bullentinBoardAddDialog.reset();
                    $bullentinBoardEditor.empty();
                    currentRow = null;
                }else {
                    layer.msg(res.message);
                }
            });
        }

    }


    // 删除记录
    exports.deleteBullentinBoardHandler = function () {
        var selectedRows = $bullentinBoardTable.bootstrapTable('getSelections');
        deleteBullentinBoard(selectedRows);
    }

    // 删除记录方法
    function deleteBullentinBoard(selectedRows) {
        if(phoenixUtils.hasOne(selectedRows)){
            layer.confirm('确定要删除？', {
                btn: ['确定','取消'] //按钮
            }, function(index, layero){
                var ids = $.map(selectedRows, function(row) {
                    return row.bullentinBoardId;
                });
                phoenixUtils.ajaxRequest(
                    ctx+ "/admin/web/deleteBullentinBoard",
                    {bullentinBoardIds: ids},
                    function (res) {
                        if(res.code == Constants.CODE_SUCCESS){
                            $bullentinBoardTable.bootstrapTable('refresh');
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
        var selectedRows = $bullentinBoardTable.bootstrapTable('getSelections');
        // 存在记录
        if(phoenixUtils.hasOne(selectedRows)){
            var ids = $.map(selectedRows, function(row) {
                if(row.status != state ){
                    return row.bullentinBoardId;
                }
            });
            // 是否有可以启用/停用的单位
            if(ids.length == 0){
                layer.msg(Constants.NO_DATA_OPERATE);
                return;
            } else {
                phoenixUtils.ajaxRequest(
                    ctx+ "/admin/web/updateBullentinBoardState",
                    {'Status':state,'bullentinBoardIds':ids},
                    function (res) {
                        if(res.code == Constants.CODE_SUCCESS){
                            $bullentinBoardTable.bootstrapTable('refresh');
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
        $bullentinBoardQueryDialog.modal('show');
    }

    // 高级查询查询事件
    exports.queryDialogCommitHandler = function () {
        $bullentinBoardTable.bootstrapTable('refresh');
        isSeniorQuery = false;
        $bullentinBoardQueryDialog.modal('hide');
    }

    // 高级查询重置
    exports.bullentinBoardQueryResetHandler = function () {
        $bullentinBoardQueryDialog.reset();
    }

});
