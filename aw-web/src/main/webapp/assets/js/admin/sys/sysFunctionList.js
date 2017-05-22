/**
 * Created by zzr on 2017/4/27.
 */
seajs.use(['./assets/js/admin/sys/sysFunctionListHandler','phoenix.util','treegrid-css','treegrid.bootstrap3','treegrid.extension'],function(handler,phoenixUtils){

    /**
     * 定义单位查询按钮事件
     */
    var companyAuditButtonConfigs = {
        "#function-add-button" : {
            name : '添加',
            eventType : 'click',
            proxy : true,
            event : handler.addDialogHandler
        },
        "#functionAdd-commit-button" : {
            name : '确定',
            eventType : 'click',
            proxy : true,
            event : handler.addDialogCommitHandler
        },




    };



    loadPagePermission(companyAuditButtonConfigs, function(data) {
        bindEvent(data);
    });




    $(function () {
        $('#sysFunctionTable').treegridData({
            id: 'functionId',
            parentColumn: 'parentId',
            type: "GET", //请求数据的ajax类型
            url: ctx+'/admin/sys/getAllFunction',   //请求数据的ajax的url
            ajaxParams: {}, //请求数据的ajax的data属性
            expandColumn: null,//在哪一列上面显示展开按钮
            striped: true,   //是否各行渐变色
            bordered: true,  //是否显示边框
            expandAll: true,  //是否全部展开,
            columns: [
                {
                    title: '菜单名称',
                    field: 'text'
                },
                {
                    title: '菜单ID',
                    field: 'functionId'
                },
                {
                    title: '类型',
                    field: 'functionType'
                },
                {
                    title: '排序序号',
                    field: 'orderNo'
                },{
                    title: '访问路径',
                    field: 'url'
                },{
                    title: '图标',
                    field: 'functionClass'
                },{
                    title: '默认开关',
                    field: 'style'
                },
                {
                    title: '描述',
                    field: 'functionDesc'
                }, {
                    field : 'options',
                    title : '操作',
                    formatter : handler.operateFormatter,
                    events : handler.operateEvents
                }
            ]
        });

    });


});
