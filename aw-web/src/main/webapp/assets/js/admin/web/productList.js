/**
 * Created by zzr on 2017/4/27.
 */
seajs.use(['./assets/js/admin/web/productListHandler','bootstrap-datepicker','uploadPreview'],function(handler){

    var $productTable = $('#productTable');
    var $bullentinBoardEditor = $('#bullentinBoard-editor');

    // 产品表字段（主表）
    var tableOpting = {
        url : ctx+'/admin/web/getProduct',
        columns: [ {
            checkbox: true
        }, {
            field: 'productName',
            title: '产品名称',
            align:"center"
        }, {
            field: 'productDesc',
            title: '产品描述',
            align:"center"
        }, {
            field:'state',
            title:'状态',
            formatter :handler.stateFormatter,
            align:"center"
        }, {
            field:'productOrder',
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
            return '产品名称';
        },
        queryParams : handler.queryParams
    };


    new uploadPreview({ UpBtn: "product_up", DivShow: "imgdiv", ImgShow: "product_picSrc" });
    $("#product_picSrc").click(function(){
        $("#product_up").click();
    });

    /**
     * 定义单位查询按钮事件
     */
    var companyButtonConfigs = {
        "#product-add-button" : {
            name : '新增',
            eventType : 'click',
            proxy : true,
            event : handler.addproductHandler
        },
        "#product-delete-button" : {
            name : '删除',
            eventType : 'click',
            proxy : true,
            event : handler.deleteProductHandler
        },
        "#product-enable-button" : {
            name : '启用',
            eventType : 'click',
            proxy : true,
            event : handler.enableHandler
        },
        "#product-disable-button" : {
            name : '停用',
            eventType : 'click',
            proxy : true,
            event : handler.disableHandler
        },
        "#product-stick-button" : {
            name : '置顶',
            eventType : 'click',
            proxy : true,
            event : handler.stickHandler
        },
        "#product-seniorQuery-button" : {
            name : '高级查询',
            eventType : 'click',
            proxy : true,
            event : handler.queryDialogHandler
        },
        "#productAdd-reset-button" : {
            name : '重置',
            eventType : 'click',
            proxy : true,
            event : handler.productAddDialogResetHandler
        },
        "#productAdd-commit-button" : {
            name : '确定',
            eventType : 'click',
            proxy : true,
            event : handler.productAddDialogCommitHandler
        },
        "#productQuery-reset-button" : {
            name : '重置',
            eventType : 'click',
            proxy : true,
            event : handler.productQueryResetHandler
        },
        "#productQuery-commit-button" : {
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


    $productTable.bootstrapTable(tableOpting);



});
