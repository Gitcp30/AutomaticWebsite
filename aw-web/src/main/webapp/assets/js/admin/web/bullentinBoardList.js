/**
 * Created by zzr on 2017/4/27.
 */
seajs.use(['./assets/js/admin/web/bullentinBoardListHandler','bootstrap-datepicker','bootstrap-wysiwyg','jquery.hotkeys.index', 'ace-elements', 'ace'],function(handler){

    var $bullentinBoardTable = $('#bullentinBoardTable');
    var $bullentinBoardEditor = $('#bullentinBoard-editor');

    // 公告表字段（主表）
    var tableOpting = {
        url : ctx+'/admin/web/getBullentinBoard',
        columns: [ {
            checkbox: true
        }, {
            field: 'bullentinBoardTitle',
            title: '公告标题',
            formatter :handler.titleFormatter,
        }, {
            field:'status',
            title:'状态',
            formatter :handler.stateFormatter,
            align:"center"
        }, {
            field:'bbOrder',
            title:'权重',
        },  {
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
            return '标题';
        },
        queryParams : handler.queryParams
    };

    // 内容编辑框
    $bullentinBoardEditor.ace_wysiwyg({
        toolbar: ['font',
            null,
            'fontSize',
            null,
            {name: 'bold', className: 'btn-info'},
            {name: 'italic', className: 'btn-info'},
            {name: 'underline', className: 'btn-info'},
            null,
            'foreColor',
            null,
            {name: 'undo', className: 'btn-grey'},
            {name: 'redo', className: 'btn-grey'}
        ],
        'wysiwyg': {
            fileUploadError: function () {
            }
        }
    }).prev().addClass('wysiwyg-style2');

    /**
     * 定义单位查询按钮事件
     */
    var companyButtonConfigs = {
        "#bullentinBoard-add-button" : {
            name : '新增',
            eventType : 'click',
            proxy : true,
            event : handler.addbullentinBoardHandler
        },
        "#bullentinBoard-delete-button" : {
            name : '删除',
            eventType : 'click',
            proxy : true,
            event : handler.deleteBullentinBoardHandler
        },
        "#bullentinBoard-enable-button" : {
            name : '启用',
            eventType : 'click',
            proxy : true,
            event : handler.enableHandler
        },
        "#bullentinBoard-disable-button" : {
            name : '停用',
            eventType : 'click',
            proxy : true,
            event : handler.disableHandler
        },
        "#bullentinBoard-stick-button" : {
            name : '置顶',
            eventType : 'click',
            proxy : true,
            event : handler.stickHandler
        },
        "#bullentinBoard-seniorQuery-button" : {
            name : '高级查询',
            eventType : 'click',
            proxy : true,
            event : handler.queryDialogHandler
        },
        "#bullentinBoardAdd-reset-button" : {
            name : '重置',
            eventType : 'click',
            proxy : true,
            event : handler.bbAddDialogResetHandler
        },
        "#bullentinBoardAdd-commit-button" : {
            name : '确定',
            eventType : 'click',
            proxy : true,
            event : handler.bbAddDialogCommitHandler
        },
        "#bullentinBoardQuery-reset-button" : {
            name : '重置',
            eventType : 'click',
            proxy : true,
            event : handler.bullentinBoardQueryResetHandler
        },
        "#bullentinBoardQuery-commit-button" : {
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


    $bullentinBoardTable.bootstrapTable(tableOpting);



});
