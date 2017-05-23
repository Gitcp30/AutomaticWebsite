/**
 * Created by zzr on 2017/5/15.
 */
define(function(require, exports) {


    var Constants = require('constants');
    var phoenixUtils = require('phoenix.util');
    var componentUtils = require('componentutils');

    var $messageBoardTable = $('#messageBoardTable');
    var $messageBoardQueryDialog = $('#messageBoardQueryDialog');

    var isSeniorQuery = false;


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
        'click .delete' : function(e, value, row) {
            if (!row.messageBoardId) {
                return;
            }
            deleteMessageBoard([row]);
        }
    };

    //查询参数
    exports.queryParams = function (tableParams) {
        debugger
        var params;
        if (isSeniorQuery) {
            params = $messageBoardQueryDialog.toObject();
        } else {
            params = {userName: tableParams.search }// 搜索框
        }

        var temp = {
            pageSize: tableParams.limit,   //页面大小
            pageOffset: tableParams.offset,  //页码
        };

        temp = $.extend({}, params, temp);
        debugger
        return temp;
    };


    // 删除记录
    exports.deleteMessageBoardHandler = function () {
        var selectedRows = $messageBoardTable.bootstrapTable('getSelections');
        deleteMessageBoard(selectedRows);
    }

    // 删除留言板方法
    function deleteMessageBoard(selectedRows) {
        if(phoenixUtils.hasOne(selectedRows)){
            layer.confirm('确定要删除？', {
                btn: ['确定','取消'] //按钮
            }, function(index, layero){
                var ids = $.map(selectedRows, function(row) {
                    return row.messageBoardId;
                });
                phoenixUtils.ajaxRequest(
                    ctx+ "/admin/web/deleteMessageBoard",
                    {messageBoardIds: ids},
                    function (res) {
                        if(res.code == Constants.CODE_SUCCESS){
                            $messageBoardTable.bootstrapTable('refresh');
                            layer.close(index);
                        }else {
                            layer.msg(res.message);
                        }
                    }
                );

            });
        }
    }


    // 高级查询弹框
    exports.seniorQueryHandler = function () {
        isSeniorQuery = true;
        $messageBoardQueryDialog.modal('show');
    }

    // 高级查询查询事件
    exports.messageBoardQueryCommitHandler = function () {
        $messageBoardTable.bootstrapTable('refresh');
        isSeniorQuery = false;
        $messageBoardQueryDialog.modal('hide');
    }

    // 高级查询重置
    exports.messageBoardQueryResetHandler = function () {
        $messageBoardQueryDialog.reset();
    }


});
