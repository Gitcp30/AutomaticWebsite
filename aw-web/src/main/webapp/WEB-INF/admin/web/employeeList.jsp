<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- main content -->
            <div id="toolbar" class="toolbar-cc clearfix p12">
                <div class="form-inline" role="form" data-spy="affix" data-offset-top="159">
                    <div class="pull-left">
                        <button class="btn btn-primary" id="employee-add-button" type="button" >
                            <i class="fa fa-plus mr5" aria-hidden="true"></i>新增
                        </button>
                        <button class="btn btn-primary" id="employee-delete-button" type="button" >
                            <i class="fa fa-trash-o mr5" aria-hidden="true"></i>删除
                        </button>
                        <button class="btn btn-primary" id="employee-enable-button" type="button" >
                            <i class="fa fa-unlock mr5" aria-hidden="true"></i>启用
                        </button>
                        <button class="btn btn-primary" id="employee-disable-button" type="button" >
                            <i class="fa fa-lock mr5" aria-hidden="true"></i>停用
                        </button>
                        <button class="btn btn-primary" id="employee-seniorQuery-button" type="button" >
                            <i class="fa fa-search mr5" aria-hidden="true"></i>高级查询
                        </button>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class=" table-striped" id="employeeTable" >
                </table>
            </div>
        </div>
    </div>
</div>



<!-- 高级查询界面  -->
<div class="modal fade" id="employeeQueryDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                    <label class="control-label">员工名称</label>
                                    <input type="text" class="form-control" name = "userName" placeholder="" aria-required="true">
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">系统账号</label>
                                    <input type="text" class="form-control" name = "sysAccount" placeholder="" aria-required="true">
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">邮箱</label>
                                    <input type="text" class="form-control" name = "mailbox" placeholder="" aria-required="true">
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">员工编号</label>
                                    <input type="text" class="form-control" name = "staffNo" placeholder="" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label class="control-label">身份证号码</label>
                                    <input type="text" class="form-control" name = "idCard" placeholder="" aria-required="true">
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">手机号</label>
                                    <input type="text" class="form-control" name = "mobile" placeholder="" aria-required="true">
                                </div>


                                <div class="col-sm-3">
                                    <label class="control-label">性别</label>
                                        <select name="sex" class="form-control">
                                            <option value=""></option>
                                            <option value="0">男</option>
                                            <option value="1">女</option>
                                        </select>
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">状态</label>
                                    <select name="userState" class="form-control">
                                        <option value=""></option>
                                        <option value="0">正常</option>
                                        <option value="1">锁定</option>
                                    </select>
                                </div>


                            </div>

                            <div class="form-group">

                                <div class="col-sm-3">
                                    <label class="control-label">生日开始时间</label>
                                    <div class="input-group">
                                        <input class="form-control date-picker" name="birthdayBegin" type="text" data-date-format="yyyy-mm-dd" />
                                        <span class="input-group-addon">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">生日结束时间</label>
                                    <div class="input-group">
                                        <input class="form-control date-picker"  name="birthdayEnd" type="text" data-date-format="yyyy-mm-dd" />
                                        <span class="input-group-addon">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
                                    </div>
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
                    <button class="btn btn-default" id = "employeeQuery-cancel-button" type="button" data-dismiss="modal" >取消</button>
                    <button class="btn btn-primary" id = "employeeQuery-reset-button" type="button">重置</button>
                    <button class="btn btn-primary query" id = "employeeQuery-commit-button" type="button">查询</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<!-- 新增用户弹框  -->
<div class="modal fade" id="employeeAddDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog w800">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">员工信息</h4>
            </div>
            <div class="modal-body" style="max-height: 800px;">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" id="employeeAddForm" novalidate="novalidate">
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label class="control-label">员工名称</label>
                                    <input type="text" class="form-control" name = "userName" placeholder="" aria-required="true">
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">邮箱</label>
                                    <input type="text" class="form-control" id="mailbox" name = "mailbox" placeholder="" aria-required="true">
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">员工编号</label>
                                    <input type="text" class="form-control" name = "staffNo" placeholder="" aria-required="true">
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">手机号</label>
                                    <input type="text" class="form-control" name = "mobile" placeholder="" aria-required="true">
                                </div>


                            </div>
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label class="control-label">身份证号码</label>
                                    <input type="text" class="form-control" name = "idCard" placeholder="" aria-required="true">
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">职务</label>
                                    <input type="text" class="form-control" name = "duties" placeholder="" aria-required="true">
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">固定电话</label>
                                    <input type="text" class="form-control" name = "telPhone" placeholder="" aria-required="true">
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">备注</label>
                                    <input type="text" class="form-control" name = "remark" placeholder="" aria-required="true">
                                </div>

                            </div>

                            <div class="form-group">

                                <div class="col-sm-3">
                                    <label class="control-label">性别</label>
                                    <select name="sex" class="form-control">
                                        <option value="0">男</option>
                                        <option value="1">女</option>
                                    </select>
                                </div>

                                <div class="col-sm-3">
                                    <label class="control-label">状态</label>
                                    <select name="userState" class="form-control">
                                        <option value="0">正常</option>
                                        <option value="1">锁定</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">生日</label>
                                    <div class="input-group">
                                        <input class="form-control date-picker" name="birthday" type="text" data-date-format="yyyy-mm-dd" />
                                        <span class="input-group-addon">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                <label class="control-label">联系地址</label>
                                <textarea name="address"  class="form-control" style="resize:none" rows="2"></textarea>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-right">
                    <button class="btn btn-default" id = "employeeAdd-cancel-button" type="button" data-dismiss="modal" >取消</button>
                    <button class="btn btn-primary" id = "employeeAdd-reset-button" type="button">重置</button>
                    <button class="btn btn-primary query" id = "employeeAdd-commit-button" type="button">提交</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>



<script src="${ctx}/assets/js/admin/web/employeeList.js"></script>