/**
 * Created by zzr on 2017/5/15.
 */
define(function(require, exports) {


    var Constants = require('constants');
    var phoenixUtils = require('phoenix.util');


    var $companyAuditTable = $('#companyAuditTable');
    var $companyAuditQueryDialog = $('#companyAuditQueryDialog');
    var $companyAuditDialog = $('#companyAuditDialog');
    var $auditingStateRadio = $(":radio[name='auditingState']");
    var $failReason =  $('#auditingForm .failReason');

    var isSeniorQuery = false;

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

    // 审核结果
    exports.companyStateFormatter = function (value,row,index) {
        switch (value){
            case Constants.AUDITING_ING:return '<span class="label label-sm label-info">未审核</span>';break;
            case Constants.AUDITING_FAIL:return '<span class="label label-sm label-danger">审核失败</span>';break;
            default:return'未说明';break;
        }
    }

    //初始化子表格
    exports.initSubTable = function (index, row, $detail) {
        var data;
        function callback(res) {
            if(res.code == Constants.CODE_SUCCESS){
                data = res.data[0];
            }
        }
        phoenixUtils.ajaxRequest(
            ctx+ "/admin/sys/getUserAndAuditing",
            {companyId: row.companyId},
            callback,
            {async: false}
        );

        var html = '<h5 class="blue lighter less-margin">没查到结果！</h5>';
        if(data != null){
            html = initDetail(data);
        }
        $detail.html(html);

    };

    //查询参数
    exports.queryParams = function (tableParams) {
        var params;
        if (isSeniorQuery) {
           params = $companyAuditQueryDialog.toObject();
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


    // 审核操作
    exports.auditingHandler = function () {
        var selectedRows = $companyAuditTable.bootstrapTable('getSelections');
        // 只选中一条数据
        if(phoenixUtils.hasOnlyOne(selectedRows)){
            if(selectedRows[0].companyState != Constants.AUDITING_ING){
                layer.msg(Constants.NOT_AUDITING_ING);
            } else {
                $failReason.hide();
                $failReason.val('');
                $auditingStateRadio.eq(0).prop("checked",true)
                $companyAuditDialog.toForm(selectedRows[0]);
                $companyAuditDialog.modal('show');
            }
        }


    }

    // 确定审核
    exports.auditCommitHandler=function () {
        var row = $companyAuditTable.bootstrapTable('getSelections')[0];

        phoenixUtils.ajaxRequest(
            ctx+ "/admin/sys/saveAuditing",
            {companyId: row.companyId,auditingState:$(":radio[name='auditingState']:checked").val(),failReason:$('#failReason').val()},
            function (res) {
                if(res.code == Constants.CODE_SUCCESS){
                    $companyAuditTable.bootstrapTable('refresh');
                    $companyAuditDialog.modal('hide');
                }else {
                    layer.msg(res.message);
                }
            }
        );

    }

    // 删除记录
    exports.deleteCompanyHandler = function () {
        var selectedRows = $companyAuditTable.bootstrapTable('getSelections');
        if (selectedRows.length === 0) {
            layer.msg(Constants.NO_SELECT_RECORD_TIP);
            return false;
        }else {
            layer.confirm('确定要删除？', {
                btn: ['确定','取消'] //按钮
            }, function(index, layero){
                var ids = $.map(selectedRows, function(row) {
                    return row.companyId;
                });
                phoenixUtils.ajaxRequest(
                    ctx+ "/admin/sys/deleteAuditing",
                    {companyIds: ids},
                    function (res) {
                        if(res.code == Constants.CODE_SUCCESS){
                            $companyAuditTable.bootstrapTable('refresh');
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
        $companyAuditQueryDialog.modal('show');
    }

    // 高级查询重置
    exports.queryDialogResetHandler = function () {
        $companyAuditQueryDialog.reset();
    }
    // 高级查询查询事件
    exports.queryDialogQueryHandler = function () {
        $companyAuditTable.bootstrapTable('refresh');
        isSeniorQuery = false;
        $companyAuditQueryDialog.modal('hide');
    }


    // 生成字表信息
    function initDetail(data){
        var html =
        '<div class="table-detail">'+
        '<div class="row">'+
        '<div class="col-xs-10 col-sm-2">'+
        '<div class="text-center">'+
        '<img height="100" class="thumbnail inline no-margin-bottom" alt="Domain Owners Avatar" src="'+ctx+'/static/images/avatars/profile-pic.jpg" />'+
        '<br />'+
        '<div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">'+
        '<div class="inline position-relative">'+
        '<a class="user-title-label" href="#">'+
        '<i class="ace-icon fa fa-circle light-green"></i>'+
        '&nbsp;'+
        '<span class="white">网站管理员</span>'+
        '</a>'+
        '</div>'+
        '</div>'+
        '</div>'+
        '</div>'+


        '<div class="col-xs-12 col-sm-7">'+
        '<div class="space visible-xs"></div>'+

        '<div class="profile-user-info profile-user-info-striped">'+
        '<div class="profile-info-row">'+
        '<div class="profile-info-name"> 用户名</div>'+

        '<div class="profile-info-value">'+
        '<span>'+data.userName+'</span>'+
        '</div>'+
        '</div>'+

        '<div class="profile-info-row">'+
        '<div class="profile-info-name"> 邮箱 </div>'+

        '<div class="profile-info-value">'+
        '<span>'+data.mailbox+'</span>'+
        '</div>'+
        '</div>'+

        '<div class="profile-info-row">'+
        '<div class="profile-info-name">系统账号</div>'+

        '<div class="profile-info-value">'+
        '<span>'+data.sysAccount+'</span>'+
        '</div>'+
        '</div>'+

        '<div class="profile-info-row">'+
        '<div class="profile-info-name">创建时间</div>'+

        '<div class="profile-info-value">'+
        '<span>'+dateFormatter(data.createTime)+'</span>'+
        '</div>'+
        '</div>'+
        '</div>'+
        '</div>';
        // 审核中
        if(data.auditing.auditingState == 0){
            html +='<div class="col-xs-12 col-sm-3">'+
                '<div class="space visible-xs"></div>'+
                '<h5 class="blue lighter less-margin">审核结果:审核中</h5>'+

                '<div class="space-6"></div>'+

                '<fieldset>'+
                '<textarea class="width-100" readonly placeholder="等待审核" style="resize:none" rows="3"></textarea>'+
                '</fieldset>'+

                '</div>'+
                '</div>'+

                '</div>'+
                '</div>';
        } else{
            html +='<div class="col-xs-12 col-sm-3">'+
                '<div class="space visible-xs"></div>'+
                '<h5 class="blue lighter less-margin">审核结果：<span class="red lighter less-margin">失败!</span></h5>'+

                '<div class="space-6"></div>'+

                '<fieldset>'+
                '<textarea class="width-100" readonly style="resize:none" rows="3">'+data.auditing.failReason+'</textarea>'+
                '</fieldset>'+

                '</div>'+
                '</div>'+

                '</div>'+
                '</div>';
        }
        return html;

    }

});
