<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- main content -->
            <div id="toolbar" class="toolbar-cc clearfix p12">
                <div class="form-inline" role="form" data-spy="affix" data-offset-top="159">
                    <div class="pull-left">
                        <button class="btn btn-primary" id="companyAudit-auditing-button" type="button" >
                            <i class="fa fa-flag mr5" aria-hidden="true"></i>审核
                        </button>
                        <button class="btn btn-primary" id="companyAudit-delete-button" type="button" >
                            <i class="fa fa-trash-o mr5" aria-hidden="true"></i>删除
                        </button>
                        <button class="btn btn-primary" id="companyAudit-query-button" type="button" >
                            <i class="fa fa-search mr5" aria-hidden="true"></i>高级查询
                        </button>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class=" table-striped" id="companyAuditTable" >
                </table>
            </div>
        </div>
    </div>
</div>

<!-- 高级查询界面  -->
<div class="modal fade" id="companyAuditQueryDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog w800">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">高级查询</h4>
            </div>
            <div class="modal-body" style="max-height: 800px;">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" id="companyAuditQueryForm" novalidate="novalidate">
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <label class="control-label">单位名称</label>
                                    <input type="text" class="form-control" name = "companyName" placeholder="" aria-required="true">
                                </div>
                                <div class="col-sm-4">
                                    <label class="control-label">访问路径</label>
                                    <input type="text" class="form-control" name = "visitUrl" placeholder="" aria-required="true">
                                </div>
                                <div class="col-sm-4">
                                    <label class="control-label">邮箱</label>
                                    <input type="text" class="form-control" name = "mailbox" placeholder="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <label class="control-label">注册主体</label>
                                        <select name="subjectType" class="form-control">
                                            <option value=""></option>
                                            <option value="0">公司</option>
                                            <option value="1">机构</option>
                                            <option value="2">个人</option>
                                        </select>
                                </div>

                                <div class="col-sm-4">
                                    <label class="control-label">所在行业</label>
                                    <select name="industryType" class="form-control">
                                        <option value=""></option>
                                        <option value="商品贸易">商品贸易</option>
                                        <option value="生活服务">生活服务</option>
                                        <option value="商务服务">商务服务</option>
                                        <option value="科技服务">科技服务</option>
                                        <option value="工农业">工农业</option>
                                    </select>
                                </div>

                                <div class="col-sm-4">
                                    <label class="control-label">规模</label>
                                    <select name="companySize" class="form-control">
                                        <option value=""></option>
                                        <option value="0">1-10人</option>
                                        <option value="1">10-50人</option>
                                        <option value="2">50以上</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-sm-4">
                                    <label class="control-label">工商注册开始时间</label>
                                    <div class="input-group">
                                        <input class="form-control date-picker" name="establishmentDateBegin" type="text" data-date-format="yyyy-mm-dd" />
                                        <span class="input-group-addon">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <label class="control-label">工商注册结束时间</label>
                                    <div class="input-group">
                                        <input class="form-control date-picker"  name="establishmentDateEnd" type="text" data-date-format="yyyy-mm-dd" />
                                        <span class="input-group-addon">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <label class="control-label">审核状态</label>
                                    <select name="companyState" class="form-control">
                                        <option value=""></option>
                                        <option value="2">未通过</option>
                                        <option value="3">审核失败</option>
                                    </select>
                                </div>

                            </div>

                            <div class="form-group">

                                <div class="col-sm-4">
                                    <label class="control-label">创建开始时间</label>
                                    <div class="input-group">
                                        <input class="form-control date-picker" name="createTimeBegin" type="text" data-date-format="yyyy-mm-dd" />
                                        <span class="input-group-addon">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
                                    </div>
                                </div>
                                <div class="col-sm-4">
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
                    <button class="btn btn-default" id = "companyAuditQuery-cancel-button" type="button" data-dismiss="modal" >取消</button>
                    <button class="btn btn-primary" id = "companyAuditQuery-reset-button" type="button">重置</button>
                    <button class="btn btn-primary query" id = "companyAuditQuery-commit-button" type="button">查询</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>



<!-- 审核页面界面  -->
<div class="modal fade" id="companyAuditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog w800">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">单位审核</h4>
            </div>
            <div class="modal-body" style="max-height: 800px;">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" id="auditingForm" novalidate="novalidate">
                                <div class="form-group">
                                    <label class="control-label col-xs-12 col-sm-3	 no-padding-right" for="companyName">单位名称:</label>
                                    <div class="col-xs-12 col-sm-8">
                                        <input type="text" name="companyName" id="companyName" class="col-xs-12 col-sm-10" disabled/>
                                    </div>
                                </div>

                                <div class="space-2"></div>

                                <div class="form-group">
                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right">审核:</label>

                                    <div class="col-xs-12 col-sm-8 ">
                                        <div class="col-xs-12 col-sm-4 no-padding-right no-padding-left">
                                            <label class="control-label line-height-1 blue">
                                                <input name="auditingState" value="4" type="radio" class="ace"/>
                                                <span class="lbl">审核通过</span>
                                            </label>
                                        </div>

                                        <div class="col-xs-12 col-sm-4 no-padding-right no-padding-left">
                                            <label class="control-label  line-height-1 blue">
                                                <input name="auditingState" value="3" type="radio" class="ace" />
                                                <span class="lbl">审核失败</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="space-2"></div>

                                <div class="form-group failReason">
                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right">失败原因:</label>

                                    <div class="col-xs-12 col-sm-8">
                                        <textarea name="failReason" id="failReason"  class="col-xs-12 col-sm-10" style="resize:none" rows="3"></textarea>
                                    </div>
                                </div>

                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-right">
                    <button class="btn btn-default" id = "companyAuditing-auditing-cancel-button" type="button" data-dismiss="modal" >取消</button>
                    <button class="btn btn-primary query" id = "companyAuditing-auditing-commit-button" type="button">确定</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script src="${ctx}/assets/js/admin/sys/companyAuditingList.js"></script>