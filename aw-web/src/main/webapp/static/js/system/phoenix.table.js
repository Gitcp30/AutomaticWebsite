define(function(require, exports, module) {
    !function($) {
        $.extend($.fn.bootstrapTable.defaults, {
            classes : "table table-no-bordered",
            queryParamsType : '',
            clickToSelect : true,
            pagination : true,
            cache : false,
            sidePagination : 'server',// 设置为服务器端分页
            pageSize : 10, // 每页的记录行数（*）
            pageList : [ 10, 20, 50, 100, 200, 500 ],
            sortable : true, // 是否启用排序
            sortOrder : "asc", // 排序方式
            uniqueId : "id",
            searchOnEnterKey:false,
            queryParams: function (params) {
                return params;
            },
        });
    }(jQuery);
});
