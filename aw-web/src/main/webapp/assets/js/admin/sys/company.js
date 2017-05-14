/**
 * Created by zzr on 2017/4/27.
 */
seajs.use(['componentutils'],function(componentUtils){

    var operateConfigItemsFormatter = function() {
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

    var operateConfigItemsEvents = {
        'click .delete' : function(e, value, rowData, index) {
            var ids = [];
            ids.push(rowData.ebfhId);
            deleteConfigItemsByIds(ids);
        },

        'click .edit' : function(e, value, rowData, index) {
            delete rowData[0];
            delete rowData.rowState;
            delete rowData.rownum;
            delete rowData.validFields;
            delete rowData.msg;
            delete rowData.esstStationCode;
            configItemsAddHandler(rowData, true);
        }
    };

    //初始化子表格(无线循环)
    var initSubTable = function (index, row, $detail) {
        debugger
        $detail.html('<div class="profile-info-row">'+
            '<div class="profile-info-name"> Location </div>'+

            '<div class="profile-info-value">'+
            '<i class="fa fa-map-marker light-orange bigger-110"></i>'+
            '<span>Netherlands, Amsterdam</span>'+
        '</div>'+
        '</div>');

    };


    //得到查询的参数
    var queryParams = function (params) {
        debugger
        var temp = {
            pageSize: params.limit,   //页面大小
            pageNumber: params.offset,  //页码
            searchText: params.search // 搜索框
        };
        return temp;
    };

    var tableOpting = {
        url : ctx+'/admin/sys/getCompany',
        detailView:true,
        columns: [{
            checkbox: true
        }, {
            field: 'companyId',
            title: '单位id',
        }, {
            field: 'companyName',
            title: '单位名称'
        }, {
            field: 'visitUrl',
            title: '访问路径'
        }, {
            field: 'subjectType',
            title: '类型'
        }, {
            field:'mailbox',
            title:'邮箱'
        }, {
            title : '操作',
            formatter : operateConfigItemsFormatter,
            events : operateConfigItemsEvents
        }],
        //注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: function (index, row, $detail) {
            initSubTable(index, row, $detail);
        },
        formatSearch:function () {
            return 'id/名称';
        },
        queryParams : queryParams
    };

    var configItemsAddHandler = function () {
        $("#ebFeeList-advanceQuery").modal('show');
    }

    var deleteConfigItemsHandler = function () {
        alert(222);
    }
    /**
     * 定义配置科目按钮
     */
    var configItemsButtonConfigs = {
        "#cdOrderTypeList-add-button" : {
            name : '添加',
            eventType : 'click',
            proxy : true,
            event : configItemsAddHandler
        },
        "#cdOrderTypeList-delete-button" : {
            name : '移除',
            eventType : 'click',
            proxy : true,
            event : deleteConfigItemsHandler
        }
    };

    loadPagePermission(configItemsButtonConfigs, function(data) {
        bindEvent(data);
    });

    $(function() {
        $('#sys_company').bootstrapTable(tableOpting);
    });


});
