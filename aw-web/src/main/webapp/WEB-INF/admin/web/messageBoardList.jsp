<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- main content -->
            <div id="toolbar" class="toolbar-cc clearfix p12">
                <div class="form-inline" role="form" data-spy="affix" data-offset-top="159">
                    <div class="pull-left">
                        <button class="btn btn-primary" id="messageBoard-delete-button" type="button" >
                            <i class="fa fa-trash-o mr5" aria-hidden="true"></i>删除
                        </button>
                        <button class="btn btn-primary" id="messageBoard-seniorQuery-button" type="button" >
                            <i class="fa fa-search mr5" aria-hidden="true"></i>高级查询
                        </button>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class=" table-striped" id="messageBoardTable" >
                </table>
            </div>
        </div>
    </div>
</div>



<!-- 高级查询界面  -->
<div class="modal fade" id="messageBoardQueryDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog w800">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">高级查询</h4>
            </div>
            <div class="modal-body" style="max-height: 800px;">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" id="messageBoardQueryForm" novalidate="novalidate">
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label class="control-label">名称</label>
                                    <input type="text" class="form-control" name = "userName" placeholder="" aria-required="true">
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">邮箱</label>
                                    <input type="text" class="form-control" name = "mailbox" placeholder="" aria-required="true">
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
                    <button class="btn btn-default" id = "messageBoardQuery-cancel-button" type="button" data-dismiss="modal" >取消</button>
                    <button class="btn btn-primary" id = "messageBoardQuery-reset-button" type="button">重置</button>
                    <button class="btn btn-primary query" id = "messageBoardQuery-commit-button" type="button">查询</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>





<script src="${ctx}/assets/js/admin/web/messageBoardList.js"></script>