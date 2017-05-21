/**
 * Created by zzr on 2017/5/15.
 */
define(function(require, exports) {


    var Constants = require('constants');
    var phoenixUtils = require('phoenix.util');
    var componentUtils = require('componentutils');

    var $companyTables = $('#companyTable');
    var $companyQueryDialog = $('#companyQueryDialog');

    var $companyUserTable = $('#companyUserTable');
    var $companyUserDialog = $('#companyUserDialog');
    var $companyEditDialog = $('#companyEditDialog');



    var isSeniorQuery = false;
    var currentCompanyId;

    //规模（0:，1:10-50人，2:50人以上）
    exports.companySizeFormatter = function (value,row,index) {
        switch (value){
            case 0:return '<span class="label label-sm label-success">1-10人</span>';break;
            case 1:return '<span class="label label-sm label-warning">10-50人</span>';break;
            case 2:return '<span class="label label-sm label-danger">50人以上</span>';break;
            default:return'未说明';break;
        }
    }

    // 注册主体（0：公司，1：机构，2:个人）
    exports.companyTypeFormatter = function (value,row,index) {
        switch (value){
            case 0:return '公司';break;
            case 1:return '机构';break;
            case 2:return '个人';break;
            default:return'未说明';break;
        }
    }

    // 单位状态转化
    exports.companyStateFormatter = function (value,row,index) {
        switch (value){
            case Constants.STATE_NORMAL:
            case Constants.AUDITING_SUCCESS:
                return '<span class="label label-sm label-info">正常</span>';break;
            case Constants.STATE_LOCK:return '<span class="label label-sm label-danger">锁定</span>';break;
            default:return'未说明';break;
        }
    }

    //初始化子表格
    exports.initSubTable = function (index, row, $detail) {
        var count = 0;
        function callback(res) {
            if(res.code == Constants.CODE_SUCCESS){
                count = res.count;
            }
        }
        phoenixUtils.ajaxRequest(
            ctx+ "/admin/sys/getUserCount",
            {companyId: row.companyId},
            callback,
            {async: false}
        );
        debugger
        $.extend( row, {"count":count} );
        $detail.html(componentUtils.companyDetail(row));

    };

    // 单位启用
    exports.enableHandler = function () {
        updateState(Constants.ENABLE);

    }

    // 单位停用
    exports.disableHandler =function () {
        updateState(Constants.DISABLE);
    }

    // 启用/停用更新方法
    function  updateState(state) {
        var selectedRows = $companyTables.bootstrapTable('getSelections');
        // 存在记录
        if(phoenixUtils.hasOne(selectedRows)){
            var ids = $.map(selectedRows, function(row) {
                if(row.companyState != state ){
                    if(row.companyState == Constants.AUDITING_SUCCESS && state == Constants.ENABLE){

                    }else {
                        return row.companyId;
                    }

                }
            });
            // 是否有可以启用/停用的单位
            if(ids.length == 0){
                layer.msg(Constants.NO_DATA_OPERATE);
                return;
            } else {
                phoenixUtils.ajaxRequest(
                    ctx+ "/admin/sys/updateCompanyState",
                    {'companyState':state,'companyIds':ids},
                    function (res) {
                        if(res.code == Constants.CODE_SUCCESS){
                            $companyTables.bootstrapTable('refresh');
                        }else {
                            layer.msg(res.message);
                        }
                    }
                );
            }
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
        if (!row.companyId) {
            return;
        }
        deleteCompany([row]);
    },
    'click .edit' : function(e, value, row) {
        $companyEditDialog.reset();
        $companyEditDialog.toForm(row);
        $('#companyEditForm .date-picker').datepicker("setDate", dateFormatter(row.establishmentDate));
        $companyEditDialog.modal('show');
    }
    };


     exports.editDialogCommitHandler = function () {
         var row = $companyEditDialog.toObject();
         phoenixUtils.jsonAjaxRequest(ctx+'/admin/sys/updateCompany',row,function (res) {
             debugger
             if(res.code == Constants.CODE_SUCCESS){
                 $companyEditDialog.modal('hide');
                 $companyTables.bootstrapTable('refresh');
             }else {
                 layer.msg(res.message);
             }
         });

     }

    //查询参数
    exports.queryParams = function (tableParams) {
        debugger
        var params;
        if (isSeniorQuery) {
           params = $companyQueryDialog.toObject();
        } else {
            params = {companyName: tableParams.search }// 搜索框
        }

        var temp = {
            pageSize: tableParams.limit,   //页面大小
            pageOffset: tableParams.offset,  //页码
        };

        temp = $.extend({}, params, temp);
        debugger
        return temp;
    };

    //员工查询参数
    exports.queryUserParams = function (tableParams) {
        var temp = {
            pageSize: tableParams.limit,   //页面大小
            pageOffset: tableParams.offset  //页码
        };
        // 只选中一条数据
        if(currentCompanyId != undefined){
            temp = $.extend({}, temp, {'companyId':currentCompanyId});
        }
        return temp;
    };

    exports.getUserHandler = function () {
        debugger
        currentCompanyId = $(this).attr('data-company');
        $companyUserTable.bootstrapTable('refresh');
        $companyUserDialog.modal('show');
    }


    // 删除记录
    exports.deleteCompanyHandler = function () {
        var selectedRows = $companyTables.bootstrapTable('getSelections');
        deleteCompany(selectedRows);
    }


    // 删除单位方法
    function deleteCompany(selectedRows) {
        if(phoenixUtils.hasOne(selectedRows)){
            layer.confirm('确定要删除？', {
                btn: ['确定','取消'] //按钮
            }, function(index, layero){
                var ids = $.map(selectedRows, function(row) {
                    return row.companyId;
                });
                phoenixUtils.ajaxRequest(
                    ctx+ "/admin/sys/deleteCompany",
                    {companyIds: ids},
                    function (res) {
                        if(res.code == Constants.CODE_SUCCESS){
                            $companyTables.bootstrapTable('refresh');
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
    exports.queryDialogHandler = function () {
        isSeniorQuery = true;
        $companyQueryDialog.modal('show');
    }

    // 高级查询重置
    exports.queryDialogResetHandler = function () {
        $companyQueryDialog.reset();
    }
    // 高级查询查询事件
    exports.queryDialogCommitHandler = function () {
        $companyTables.bootstrapTable('refresh');
        isSeniorQuery = false;
        $companyQueryDialog.modal('hide');
    }



});
