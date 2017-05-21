/**
 * Created by zzr on 2017/4/27.
 */
seajs.use(['./assets/js/admin/sys/companyAuditingListHandler','bootstrap-datepicker'],function(handler){

    var $companyAuditTable = $('#companyAuditTable');
    var $auditingStateRadio = $(":radio[name='auditingState']");


    var tableOpting = {
        url : ctx+'/admin/sys/getCompanyAuditing',
        detailView:true,
        height: 500,
        columns: [{
            checkbox: true
        }, {
            field: 'companyId',
            title: '单位id',
            visible:false
        }, {
            field: 'companyName',
            title: '单位名称'
        }, {
            field: 'visitUrl',
            title: '访问路径'
        }, {
            field: 'subjectType',
            title: '注册主体',
            formatter:handler.companyTypeFormatter,
            align:'center'
        }, {
            field:'mailbox',
            title:'邮箱'
        }, {
            field:'industryType',
            title:'所在行业'
        }, {
            field:'companySize',
            title:'规模',
            align:'center',
            formatter:handler.companySizeFormatter
        }, {
        field:'companyState',
        title:'审核结果',
            align:'center',
            formatter:handler.companyStateFormatter
        }, {
            field:'establishmentDate',
            title:'成立时间',
            formatter : dateFormatter
        }, {
            field:'createTime',
            title:'创建时间',
            formatter :dateTimeFormatter
        }],
        //注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: handler.initSubTable,
        formatSearch:function () {
            return 'id/名称';
        },
        queryParams : handler.queryParams
    };

    /**
     * 定义单位查询按钮事件
     */
    var companyAuditButtonConfigs = {
        "#companyAudit-auditing-button" : {
            name : '审核',
            eventType : 'click',
            proxy : true,
            event : handler.auditingHandler
        },
        "#companyAudit-delete-button" : {
            name : '移除',
            eventType : 'click',
            proxy : true,
            event : handler.deleteCompanyHandler
        },
        "#companyAudit-query-button" : {
            name : '查询',
            eventType : 'click',
            proxy : true,
            event : handler.queryDialogHandler
        },
        "#companyAuditing-auditing-commit-button" : {
            name : '确定',
            eventType : 'click',
            proxy : true,
            event : handler.auditCommitHandler
        },
        "#companyAuditQuery-reset-button" : {
            name : '重置',
            eventType : 'click',
            proxy : true,
            event : handler.queryDialogResetHandler
        },
        "#companyAuditQuery-commit-button" : {
            name : '确定',
            eventType : 'click',
            proxy : true,
            event : handler.queryDialogQueryHandler
        }
    };


    $('.date-picker').datepicker({
        autoclose: true,
        todayHighlight: true
    })
    //show datepicker when clicking on the icon
        .next().on(ace.click_event, function(){
        $(this).prev().focus();
    });

    loadPagePermission(companyAuditButtonConfigs, function(data) {
        bindEvent(data);
    });


    // 审核通过/不通过 ：不显示/显示失败原因
    $auditingStateRadio.on('click',function () {
        switch ($(this).val()) {
            case "3":
                $('#auditingForm .failReason').show();
                break;
            case "4":
                $('#auditingForm .failReason').hide();
                break;
        }
    });

    $companyAuditTable.bootstrapTable(tableOpting);


});
