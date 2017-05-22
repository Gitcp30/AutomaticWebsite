<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- main content -->
            <div class="clearfix" style="margin-top: 10px; margin-bottom: 10px;">
                <div class="form-inline" role="form" data-spy="affix" data-offset-top="159">
                    <div class="pull-left">
                        <button class="btn btn-primary" id="function-add-button" type="button" >
                            <i class="fa fa-plus mr5" aria-hidden="true"></i>新增功能菜单
                        </button>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class=" table-striped" id="sysFunctionTable" >
                </table>
            </div>
        </div>
    </div>
</div>


<!-- 新增界面  -->
<div class="modal fade" id="functionAddDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog w800">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">新增功能</h4>
            </div>
            <div class="modal-body" style="max-height: 800px;">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" id="functionAddForm" novalidate="novalidate">
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label class="control-label">功能名称</label>
                                    <input type="text" class="form-control" name = "text" placeholder="" aria-required="true">
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">父节点</label>
                                    <select name="parentId" id="funcParentId" class="form-control">
                                    </select>
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">访问路径</label>
                                    <input type="text" class="form-control" name = "url" placeholder="" aria-required="true">
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">权重</label>
                                    <input type="text" class="form-control" name = "orderNo" placeholder="" aria-required="true">
                                </div>

                            </div>
                            <div class="form-group">

                                <div class="col-sm-3">
                                    <label class="control-label">类型</label>
                                    <select name="functionType" class="form-control">
                                        <option value="0">通用</option>
                                        <option value="1">网站管理</option>
                                        <option value="2">系统管理</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">开关</label>
                                    <select name="style" class="form-control">
                                        <option value="open">开</option>
                                        <option value="closed">关</option>
                                    </select>
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">图标</label>
                                    <select name="functionClass" class="form-control">
                                        <option value="menu-icon fa fa-list">menu-icon fa fa-list</option>
                                        <option value="menu-icon fa fa-list">menu-icon fa fa-list</option>
                                        <option value="menu-icon fa fa-list">menu-icon fa fa-list</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-sm-12">
                                    <label class="control-label">功能描述</label>
                                    <textarea class="form-control" name = "functionDesc" placeholder="" aria-required="true"></textarea>
                                </div>

                            </div>

                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-right">
                    <button class="btn btn-default" id = "functionAdd-cancel-button" type="button" data-dismiss="modal" >取消</button>
                    <button class="btn btn-primary query" id = "functionAdd-commit-button" type="button">确定</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>



<script src="${ctx}/assets/js/admin/sys/sysFunctionList.js"></script>