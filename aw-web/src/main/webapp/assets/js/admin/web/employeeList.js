/**
 * Created by zzr on 2017/4/27.
 */
seajs.use(['./assets/js/admin/web/employeeListHandler','bootstrap-datepicker'],function(handler){

    var $employeeTable = $('#employeeTable');

    // 单位表字段（主表）
    var tableOpting = {
        url : ctx+'/admin/web/getEmployee',
        columns: [ {
            checkbox: true
        }, {
            field: 'userName',
            title: '员工名称',
        }, {
            field: 'sysAccount',
            title: '系统账号',
        }, {
            field:'mailbox',
            title:'邮箱'
        }, {
            field:'staffNo',
            title:'员工编号',
        }, {
            field:'mobile',
            title:'手机号',
        }, {
            field:'sex',
            title:'性别',
            formatter :handler.userSexFormatter
        }, {
            field:'duties',
            title:'职务',
        }, {
            field:'birthday',
            title:'出生日期',
            formatter :dateFormatter
        }, {
            field:'address',
            title:'住址',
            visible:false
        }, {
            field:'idCard',
            title:'身份证号码',
        }, {
            field:'userState',
            title:'用户状态',
            formatter :handler.userStateFormatter,
            align:"center"
        }, {
            field:'remark',
            title:'备注',
        }, {
            field:'createTime',
            title:'创建时间',
            formatter :dateFormatter
        }, {
            field : 'options',
            title : '操作',
            formatter : handler.operateFormatter,
            events : handler.operateEvents
        } ],
        //注册加载子表的事件。注意下这里的三个参数！
        formatSearch:function () {
            return '员工名称';
        },
        queryParams : handler.queryParams
    };



    /**
     * 定义单位查询按钮事件
     */
    var companyButtonConfigs = {
        "#employee-add-button" : {
            name : '新增',
            eventType : 'click',
            proxy : true,
            event : handler.addEmployeeHandler
        },
        "#employee-delete-button" : {
            name : '删除',
            eventType : 'click',
            proxy : true,
            event : handler.deleteEmployeeHandler
        },
        "#employee-enable-button" : {
            name : '启用',
            eventType : 'click',
            proxy : true,
            event : handler.enableHandler
        },
        "#employee-disable-button" : {
            name : '停用',
            eventType : 'click',
            proxy : true,
            event : handler.disableHandler
        },
        "#employee-seniorQuery-button" : {
            name : '高级查询',
            eventType : 'click',
            proxy : true,
            event : handler.queryDialogHandler
        },
        "#employeeAdd-reset-button" : {
            name : '重置',
            eventType : 'click',
            proxy : true,
            event : handler.addDialogResetHandler
        },
        "#employeeAdd-commit-button" : {
            name : '确定',
            eventType : 'click',
            proxy : true,
            event : handler.addDialogCommitHandler
        },
        "#employeeQuery-reset-button" : {
            name : '重置',
            eventType : 'click',
            proxy : true,
            event : handler.employeeQueryResetHandler
        },
        "#employeeQuery-commit-button" : {
            name : '高级查询提交',
            eventType : 'click',
            proxy : true,
            event : handler.queryDialogCommitHandler
        },

    };

    $('.date-picker').datepicker({
        autoclose: true,
        todayHighlight: true
    })
    //show datepicker when clicking on the icon
        .next().on(ace.click_event, function(){
        $(this).prev().focus();
    });

    loadPagePermission(companyButtonConfigs, function(data) {
        bindEvent(data);
    });


    $employeeTable.bootstrapTable(tableOpting);



});
