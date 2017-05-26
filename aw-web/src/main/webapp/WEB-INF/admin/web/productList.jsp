<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- main content -->
            <div id="toolbar" class="toolbar-cc clearfix p12">
                <div class="form-inline" role="form" data-spy="affix" data-offset-top="159">
                    <div class="pull-left">
                        <button class="btn btn-primary" id="product-add-button" type="button" >
                            <i class="fa fa-plus mr5" aria-hidden="true"></i>新增
                        </button>
                        <button class="btn btn-primary" id="product-delete-button" type="button" >
                            <i class="fa fa-trash-o mr5" aria-hidden="true"></i>删除
                        </button>
                        <button class="btn btn-primary" id="product-enable-button" type="button" >
                            <i class="fa fa-unlock mr5" aria-hidden="true"></i>启用
                        </button>
                        <button class="btn btn-primary" id="product-disable-button" type="button" >
                            <i class="fa fa-lock mr5" aria-hidden="true"></i>停用
                        </button>
                        <button class="btn btn-primary" id="product-stick-button" type="button" >
                            <i class="fa fa-lock mr5" aria-hidden="true"></i>置顶
                        </button>
                        <button class="btn btn-primary" id="product-seniorQuery-button" type="button" >
                            <i class="fa fa-search mr5" aria-hidden="true"></i>高级查询
                        </button>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class=" table-striped" id="productTable" >
                </table>
            </div>
        </div>
    </div>
</div>


<%--

<!-- 高级查询界面  -->
<div class="modal fade" id="bullentinBoardQueryDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog w800">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">高级查询</h4>
            </div>
            <div class="modal-body" style="max-height: 800px;">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" id="employeeQueryForm" novalidate="novalidate">
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label class="control-label">标题</label>
                                    <input type="text" class="form-control" name = "bullentinBoardTitle" placeholder="" aria-required="true">
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">状态</label>
                                    <select name="status" class="form-control">
                                        <option value=""></option>
                                        <option value="0">正常</option>
                                        <option value="1">停用</option>
                                        <option value="2">置顶</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">创建开始时间</label>
                                    <div class="input-group">
                                        <input class="form-control date-picker" name="createTimeBegin" type="text" data-date-format="yyyy-mm-dd" />
                                        <span class="input-group-addon">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">创建结束时间</label>
                                    <div class="input-group">
                                        <input class="form-control date-picker"  name="createTimeEnd" type="text" data-date-format="yyyy-mm-dd" />
                                        <span class="input-group-addon">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
                                    </div>
                                </div>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-right">
                    <button class="btn btn-default" id = "bullentinBoardQuery-cancel-button" type="button" data-dismiss="modal" >取消</button>
                    <button class="btn btn-primary" id = "bullentinBoardQuery-reset-button" type="button">重置</button>
                    <button class="btn btn-primary query" id = "bullentinBoardQuery-commit-button" type="button">查询</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!-- 新增用户弹框  -->
<div class="modal fade" id="bullentinBoardAddDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog w800">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">公告栏信息</h4>
            </div>
            <div class="modal-body" style="max-height: 800px;">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" id="bullentinBoardAddForm" novalidate="novalidate">
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <label class="control-label">标题</label>
                                    <input type="text" class="form-control" name = "bullentinBoardTitle" placeholder="" aria-required="true">
                                </div>

                                <div class="col-sm-4">
                                    <label class="control-label">状态</label>
                                    <select name="status" class="form-control">
                                        <option value="0">正常</option>
                                        <option value="1">停用</option>
                                        <option value="2">置顶</option>
                                    </select>
                                </div>
                                <div class="col-sm-4">
                                    <label class="control-label">权重</label>
                                    <input type="text" class="form-control" name = "bbOrder" placeholder="" aria-required="true">
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="wysiwyg-editor" id="bullentinBoard-editor"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-right">
                    <button class="btn btn-default" id = "bullentinBoardAdd-cancel-button" type="button" data-dismiss="modal" >取消</button>
                    <button class="btn btn-primary" id = "bullentinBoardAdd-reset-button" type="button">重置</button>
                    <button class="btn btn-primary query" id = "bullentinBoardAdd-commit-button" type="button">提交</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


--%>


<script src="${ctx}/assets/js/admin/web/productList.js"></script>