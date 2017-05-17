/**
 * Created by zzr on 2017/4/27.
 */
seajs.use(['./assets/js/admin/sys/companyListHandler','bootstrap-datepicker'],function(handler){

    var $companyTable = $('#companyTable');
    var $companyUserTable = $('#companyUserTable');

    // 单位表字段（主表）
    var tableOpting = {
        url : ctx+'/admin/sys/getCompany',
        detailView:true,
        columns: [{
            checkbox: true
        }, {
            field: 'companyId',
            title: '单位id',
            visible:false
        }, {
            field: 'companyName',
            title: '单位名称',
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
        title:'单位状态',
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
        }, {
            field : 'options',
            title : '操作',
            formatter : handler.operateFormatter,
            events : handler.operateEvents
        } ],
        //注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: handler.initSubTable,
        formatSearch:function () {
            return '单位名称';
        },
        queryParams : handler.queryParams
    };



    // 员工表（子表）
    var userTableOpting = {
        url : ctx+'/admin/sys/getCompanyUser',
        toolbar: '#toolbar2',
        columns: [{
            checkbox: true
        }, {
            field: 'userName',
            title: '员工名称',
        }, {
            field: 'userType',
            title: '类型'
        }, {
            field: 'sysAccount',
            title: '系统账号',
        }, {
            field:'mailbox',
            title:'邮箱'
        }, {
            field:'industryType',
            title:'所在行业'
        }, {
            field:'mobile',
            title:'手机号',
        }, {
            field:'sex',
            title:'性别',
        }, {
            field:'duties',
            title:'职务',
        }, {
            field:'birthday',
            title:'出生日期',
        }, {
            field:'remark',
            title:'备注',
        }, {
            field:'duties',
            title:'职务',
        }, {
            field:'address',
            title:'住址',
        }, {
            field:'idCard',
            title:'身份证号码',
        }, {
            field:'userState',
            title:'用户状态',
        }, {
            field:'staffNo',
            title:'员工编号',
        }, {
            field:'createTime',
            title:'创建时间',
            formatter :date2Formatter
        }],
        formatSearch:function () {
            return '员工名称';
        },
        queryParams : handler.queryUserParams
    };


    /**
     * 定义单位查询按钮事件
     */
    var companyButtonConfigs = {
        "#company-delete-button" : {
            name : '删除',
            eventType : 'click',
            proxy : true,
            event : handler.deleteCompanyHandler
        },
        "#company-enable-button" : {
            name : '启用',
            eventType : 'click',
            proxy : true,
            event : handler.enableHandler
        },
        "#company-disable-button" : {
            name : '停用',
            eventType : 'click',
            proxy : true,
            event : handler.disableHandler
        },
        ".getList" : {
        name : '重置',
            eventType : 'click',
            proxy : true,
            event : handler.getUserHandler
    }
    };



    loadPagePermission(companyButtonConfigs, function(data) {
        bindEvent(data);
    });



    $(function() {
        $companyTable.bootstrapTable(tableOpting);
        $companyUserTable.bootstrapTable(userTableOpting);
    });


});
