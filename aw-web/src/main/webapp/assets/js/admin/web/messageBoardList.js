/**
 * Created by zzr on 2017/4/27.
 */
seajs.use(['./assets/js/admin/web/messageBoardListHandler','bootstrap-datepicker'],function(handler){

    var $messageBoardTable = $('#messageBoardTable');

    // 单位表字段（主表）
    var tableOpting = {
        url : ctx+'/admin/web/getMessageBoard',
        height:500,
        columns: [ {
            checkbox: true
        }, {
            field: 'userName',
            title: '留言用户名',
        }, {
            field:'mailbox',
            title:'邮箱'
        },{
            field:'content',
            title:'内容',
            align:"center"
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
            return '留言用户名';
        },
        queryParams : handler.queryParams
    };



    /**
     * 定义单位查询按钮事件
     */
    var companyButtonConfigs = {
        "#messageBoard-delete-button" : {
            name : '删除',
            eventType : 'click',
            proxy : true,
            event : handler.deleteMessageBoardHandler
        },
        "#messageBoard-seniorQuery-button" : {
            name : '高级查询',
            eventType : 'click',
            proxy : true,
            event : handler.seniorQueryHandler
        },
        "#messageBoardQuery-reset-button" : {
            name : '高级查询重置',
            eventType : 'click',
            proxy : true,
            event : handler.messageBoardQueryResetHandler
        },
        "#messageBoardQuery-commit-button" : {
            name : '高级查询提交',
            eventType : 'click',
            proxy : true,
            event : handler.messageBoardQueryCommitHandler
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


    $messageBoardTable.bootstrapTable(tableOpting);



});
