<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- main content -->
            <div id="toolbar" class="toolbar-cc clearfix p12">
                <div class="form-inline" role="form" data-spy="affix" data-offset-top="159">
                    <div class="pull-left">
                        <button class="btn btn-primary" id="company-delete-button" type="button" >
                            <i class="fa fa-trash-o mr5" aria-hidden="true"></i>删除
                        </button>
                        <button class="btn btn-primary" id="company-enable-button" type="button" >
                            <i class="fa fa-unlock mr5" aria-hidden="true"></i>启用
                        </button>
                        <button class="btn btn-primary" id="company-disable-button" type="button" >
                            <i class="fa fa-lock mr5" aria-hidden="true"></i>停用
                        </button>
                        <button class="btn btn-primary" id="company-seniorQuery-button" type="button" >
                            <i class="fa fa-search mr5" aria-hidden="true"></i>高级查询
                        </button>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class=" table-striped" id="companyTable" >
                </table>
            </div>
        </div>
    </div>
</div>


<!-- 高级查询界面  -->
<div class="modal fade" id="companyQueryDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                    <label class="control-label">单位状态</label>
                                    <select name="companyState" class="form-control">
                                        <option value=""></option>
                                        <option value="1">锁定</option>
                                        <option value="0">正常</option>
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
                    <button class="btn btn-default" id = "companyQuery-cancel-button" type="button" data-dismiss="modal" >取消</button>
                    <button class="btn btn-primary" id = "companyQuery-reset-button" type="button">重置</button>
                    <button class="btn btn-primary query" id = "companyQuery-commit-button" type="button">查询</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<!-- 单位员工详情-->
<div class="modal fade" id="companyUserDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog w800">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">员工列表</h4>
            </div>
            <div class="modal-body" style="max-height: 800px;">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- main content -->
                        <div class="table-responsive">
                            <table class=" table-striped" id="companyUserTable" >
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<!-- 单位编辑界面  -->
<div class="modal fade" id="companyEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog w800">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">单位编辑</h4>
            </div>
            <div class="modal-body" style="max-height: 800px;">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" id="companyEditForm" novalidate="novalidate">
                            <input type="hidden" name="companyId">
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label class="control-label">单位名称</label>
                                    <input type="text" class="form-control" name = "companyName" placeholder="" aria-required="true" disabled>
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">访问路径</label>
                                    <input type="text" class="form-control" name = "visitUrl" placeholder="" aria-required="true" disabled>
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">邮箱</label>
                                    <input type="text" class="form-control" name = "mailbox" placeholder="" aria-required="true">
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">负责人</label>
                                    <input type="text" class="form-control" name = "representative" placeholder="" aria-required="true">
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label class="control-label">工商注册</label>
                                    <div class="input-group">
                                        <input class="form-control date-picker"  name="establishmentDate" type="text" data-date-format="yyyy-mm-dd" />
                                        <span class="input-group-addon">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">所在行业</label>
                                    <select name="industryType" class="form-control">
                                        <option value="商品贸易">商品贸易</option>
                                        <option value="生活服务">生活服务</option>
                                        <option value="商务服务">商务服务</option>
                                        <option value="科技服务">科技服务</option>
                                        <option value="工农业">工农业</option>
                                    </select>
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">规模</label>
                                    <select name="companySize" class="form-control">
                                        <option value="0">1-10人</option>
                                        <option value="1">10-50人</option>
                                        <option value="2">50以上</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">注册主体</label>
                                    <select name="subjectType" class="form-control">
                                        <option value="0">公司</option>
                                        <option value="1">机构</option>
                                        <option value="2">个人</option>
                                    </select>
                                </div>


                            </div>

                            <div class="form-group">

                                <div class="col-sm-3">
                                    <label class="control-label">手机号码</label>
                                    <input type="text" class="form-control" name = "mobile" placeholder="" aria-required="true">
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">固定电话</label>
                                    <input type="text" class="form-control" name = "telPhone" placeholder="" aria-required="true">
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">邮政编码</label>
                                    <input type="text" class="form-control" name = "zipCode" placeholder="" aria-required="true">
                                </div>

                            </div>

                            <div class="form-group">

                                <div class="col-sm-12">
                                    <label class="control-label">联系地址</label>
                                    <textarea class="form-control" name = "address" placeholder="" aria-required="true"></textarea>
                                </div>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-right">
                    <button class="btn btn-default" id = "companyEdit-cancel-button" type="button" data-dismiss="modal" >取消</button>
                    <button class="btn btn-primary query" id = "companyEdit-commit-button" type="button">确定</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>



<script src="${ctx}/assets/js/admin/sys/companyList.js"></script>