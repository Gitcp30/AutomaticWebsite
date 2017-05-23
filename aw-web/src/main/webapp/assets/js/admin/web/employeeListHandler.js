/**
 * Created by zzr on 2017/5/15.
 */
define(function(require, exports) {


    var Constants = require('constants');
    var phoenixUtils = require('phoenix.util');
    var componentUtils = require('componentutils');
    require('jquery-validate');
    require('phoenix.validate');

    var $employeeTable = $('#employeeTable');
    var $employeeQueryDialog = $('#employeeQueryDialog');
    var $employeeAddDialog = $('#employeeAddDialog');
    var $employeeAddForm = $('#employeeAddForm');

    var isSeniorQuery = false;
    var currentRow = null;


    // 性别转化
    exports.userSexFormatter = function (value,row,index) {
        switch (value){
            case 0:return '男';break;
            case 1:return '女';break;
            default:return'未说明';break;
        }
    }

    // 用户状态转化
    exports.userStateFormatter = function (value,row,index) {
        switch (value){
            case Constants.STATE_NORMAL:
                return '<span class="label label-sm label-info">正常</span>';break;
            case Constants.STATE_LOCK:return '<span class="label label-sm label-danger">锁定</span>';break;
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
            if (!row.userId) {
                return;
            }
            deleteEmployee([row]);
        },
        'click .edit' : function(e, value, row) {
            $employeeAddDialog.reset();
            $employeeAddDialog.toForm(row);
            $('#employeeAddDialog .date-picker').datepicker("setDate", dateFormatter(row.birthday));
            $employeeAddDialog.modal('show');
            currentRow = row;
            initValidMessage();
            $('#mailbox').attr("disabled","disabled");
        }
    };

    //查询参数
    exports.queryParams = function (tableParams) {
        debugger
        var params;
        if (isSeniorQuery) {
            params = $employeeQueryDialog.toObject();
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


    // 新增记录
    exports.addEmployeeHandler = function () {
        $employeeAddDialog.reset();
        $('#mailbox').removeAttr("disabled");
        initValidMessage();
        $employeeAddDialog.modal('show');
    }



    // 新增 提交数据
    exports.addDialogCommitHandler = function () {
        // 获取数据
        var row = $employeeAddDialog.toObject();
        // 新增
        if(currentRow == null || currentRow == undefined){
            // 验证表单
            if(!$employeeAddForm.valid()){
                return;
            }
            // 提交
            phoenixUtils.jsonAjaxRequest(ctx+'/admin/web/saveEmployee',row,function (res) {
                debugger
                if(res.code == Constants.CODE_SUCCESS){
                    $employeeAddDialog.modal('hide');
                    $employeeTable.bootstrapTable('refresh');
                    $employeeAddDialog.reset();
                }else {
                    layer.msg(res.message);
                }
            });
            // 修改
        }else {
            var data = $.extend({}, currentRow, row);
            phoenixUtils.jsonAjaxRequest(ctx+'/admin/web/updateEmployee',data,function (res) {
                debugger
                if(res.code == Constants.CODE_SUCCESS){
                    $employeeAddDialog.modal('hide');
                    $employeeTable.bootstrapTable('refresh');
                    $employeeAddDialog.reset();
                    currentRow = null;
                }else {
                    layer.msg(res.message);
                }
            });
        }

    }


    // 重置新增框
    exports.addDialogResetHandler = function () {
        $employeeAddDialog.reset();
}


    // 删除记录
    exports.deleteEmployeeHandler = function () {
        var selectedRows = $employeeTable.bootstrapTable('getSelections');
        deleteEmployee(selectedRows);
    }

    // 删除单位方法
    function deleteEmployee(selectedRows) {
        if(phoenixUtils.hasOne(selectedRows)){
            layer.confirm('确定要删除？', {
                btn: ['确定','取消'] //按钮
            }, function(index, layero){
                var ids = $.map(selectedRows, function(row) {
                    return row.userId;
                });
                phoenixUtils.ajaxRequest(
                    ctx+ "/admin/web/deleteEmployee",
                    {userIds: ids},
                    function (res) {
                        if(res.code == Constants.CODE_SUCCESS){
                            $employeeTable.bootstrapTable('refresh');
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

    // 启用/停用更新方法
    function  updateState(state) {
        var selectedRows = $employeeTable.bootstrapTable('getSelections');
        // 存在记录
        if(phoenixUtils.hasOne(selectedRows)){
            var ids = $.map(selectedRows, function(row) {
                if(row.userState != state ){
                    return row.userId;
                }
            });
            // 是否有可以启用/停用的单位
            if(ids.length == 0){
                layer.msg(Constants.NO_DATA_OPERATE);
                return;
            } else {
                phoenixUtils.ajaxRequest(
                    ctx+ "/admin/web/updateUserState",
                    {'userState':state,'userIds':ids},
                    function (res) {
                        if(res.code == Constants.CODE_SUCCESS){
                            $employeeTable.bootstrapTable('refresh');
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
        $employeeQueryDialog.modal('show');
    }

    // 高级查询查询事件
    exports.queryDialogCommitHandler = function () {
        $employeeTable.bootstrapTable('refresh');
        isSeniorQuery = false;
        $employeeQueryDialog.modal('hide');
    }

    // 高级查询重置
    exports.employeeQueryResetHandler = function () {
        $employeeQueryDialog.reset();
    }


    /**
     * 单位信息form验证
     */
    $employeeAddForm.validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        ignore: "",
        rules: {
            userName:{
                required: true,
                maxlength:32
            },
            mailbox: {
                required: true,
                email: true,
                remote: {
                    type: "post",
                    //请求方式
                    url: ctx+"/register/checkMailbox",     //发送请求的url地址
                    data: {
                        mailbox: function(){
                            return $("#mailbox").val();
                        }
                    },
                    dataType: "json",        //发送的数据类型
                    dataFilter: function(res) { //返回结果
                        res = $.parseJSON(res);
                        if (res.code == "0") {
                            return true;
                        }else {
                            return false;
                        }
                    }
                }
            }
        },

        messages: {
            userName:{
                required: "名称不能为空！",
                maxlength:"名称不能超过32个字符！"
            },
            mailbox: {
                required: "请输入联系邮箱！",
                email: "请输入合法的邮箱地址！",
                remote:"输入邮箱已存在！"
            }
        },
        highlight: function (e) {
            $(e).closest('div').removeClass('has-success').addClass('has-error');
        },

        success: function (e) {
            $(e).parent().removeClass('has-error').addClass('has-success');
            $(e).remove();
        },

        errorPlacement: function (error, element) {
            if(element.is('input[type=file]') || element.is('.date-picker')){
                error.insertAfter(element);
            } else {
                error.insertAfter(element);
            }
        },

        submitHandler: function (form) {
        },
        invalidHandler: function (form) {
        }
    });



    var initValidMessage = function () {
        $employeeAddDialog.find('div .has-error').removeClass('has-error');
        $employeeAddDialog.find('div .help-block').empty();
    }



});
