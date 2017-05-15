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

    //（0:，1:10-50人，2:50人以上）
    var companySizeFormatter = function (value,row,index) {
        switch (value){
            case 0:return '<span class="label label-sm label-success">1-10人</span>';break;
            case 1:return '<span class="label label-sm label-warning">10-50人</span>';break;
            case 2:return '<span class="label label-sm label-danger">50人以上</span>';break;
            default:return'未说明';break;
        }
    }

    // 注册主体（0：公司，1：机构，2:个人）
    var companyTypeFormatter = function (value,row,index) {
        switch (value){
            case 0:return '公司';break;
            case 1:return '机构';break;
            case 2:return '个人';break;
            default:return'未说明';break;
        }
    }

    // 审核结果
    var companyStateFormatter = function (value,row,index) {
        switch (value){
            case 2:return '<span class="label label-sm label-info">未审核</span>';break;
            case 3:return '<span class="label label-sm label-danger">审核失败</span>';break;
            default:return'未说明';break;
        }
    }

        //初始化子表格
    var initSubTable = function (index, row, $detail) {
        debugger
        var data;
        $.ajax({
            type: "POST",
            url: ctx+ "/admin/sys/getUserAndAuditing",
            data: {
                companyId: row.companyId
            },
            dataType: 'json',
            async: false,
            success: function (res) {
                if(res.code == 0){
                    data = res.data[0];
                }
            }, error: function () {
                alert("系统异常");
            }
        });
debugger

        if(data != null){

        } else {

        }
        $detail.html(
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
            '</div>'+

            '<div class="col-xs-12 col-sm-3">'+
            '<div class="space visible-xs"></div>'+
            '<h5 class="blue lighter less-margin">审核结果</h5>'+

        '<div class="space-6"></div>'+

            '<fieldset>'+
            '<textarea class="width-100" readonly placeholder="等待审核" style="resize:none" rows="3"></textarea>'+
            '</fieldset>'+

            '</div>'+
            '</div>'+




            '</div>'+
            '</div>'
        );

    };


    //得到查询的参数
    var queryParams = function (params) {
        debugger
        var temp = {
            pageSize: params.limit,   //页面大小
            pageOffset: params.offset,  //页码
            companyName: params.search // 搜索框
        };
        return temp;
    };

    var tableOpting = {
        url : ctx+'/admin/sys/getCompanyAuditing',
        detailView:true,
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
            formatter:companyTypeFormatter,
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
            formatter:companySizeFormatter
        }, {
        field:'companyState',
        title:'审核结果',
            align:'center',
            formatter:companyStateFormatter
        }, {
            field:'establishmentDate',
            title:'成立时间',
            formatter : dateFormatter
        }, {
            field:'createTime',
            title:'创建时间',
            formatter :dateTimeFormatter
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
