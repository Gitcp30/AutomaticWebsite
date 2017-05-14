<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- main content -->
            <div id="toolbar" class="toolbar-cc clearfix p12">
                <div class="form-inline" role="form" data-spy="affix" data-offset-top="159">
                    <div class="pull-left">
                        <button class="btn btn-primary" id="cdOrderTypeList-add-button" type="button" >
                            <i class="fa fa-plus mr5" aria-hidden="true"></i>新增
                        </button>
                        <button class="btn btn-primary" id="cdOrderTypeList-delete-button" type="button" >
                            <i class="fa fa-trash-o mr5" aria-hidden="true"></i>删除
                        </button>
                        <button class="btn btn-primary" id="cdOrderTypeList-enable-button" type="button" >
                            <i class="fa fa-unlock mr5" aria-hidden="true"></i>启用
                        </button>
                        <button class="btn btn-primary" id="cdOrderTypeList-disable-button" type="button" >
                            <i class="fa fa-lock mr5" aria-hidden="true"></i>停用
                        </button>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class=" table-striped" id="sys_company" >
                </table>
            </div>
        </div>
    </div>
</div>

<!-- 高级查询界面  -->
<div class="modal fade" id="ebFeeList-advanceQuery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog w800">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">高级查询</h4>
            </div>
            <div class="modal-body" style="max-height: 800px;">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" id="validateForm" novalidate="novalidate">
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label class="control-label">费用名称</label>
                                    <input type="text" class="form-control" name = "ebfhNameCn" placeholder="" aria-required="true">
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">英文名称</label>
                                    <input type="text" class="form-control" name = "ebfhNameEn" placeholder="" aria-required="true">
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">简称</label>
                                    <input type="text" class="form-control" name = "ebfhCode" placeholder="" aria-required="true">
                                </div>
                                <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3">
                                    <label class="control-label fontred">状态</label>
                                    <select class="sns-combobox select2" type="combox" name="ebfhStatus" id="ebfhStatus_query"
                                            data-options="cfgKey:'SYS_CONFIG_STATUS'">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3">
                                    <label class="control-label fontred">费用类型
                                    </label>
                                    <select class="sns-combobox select2" type="combox" name="ebfhCostType" id="ebfhCostType_query"
                                            data-options="cfgKey:'ORG_COST_TYPE',require:true">
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">收付类型</label> <select name="" class="form-control">
                                    <option value=""></option>
                                    <option value="01">应收</option>
                                    <option value="02">应付</option>
                                </select>
                                </div>
                                <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3">
                                    <label class="control-label fontred">应用单据类型</label>
                                    <select class="sns-combobox select2" type="combox" name="ebfhOrderType" id="ebfhOrderType_query"
                                            data-options="cfgKey:'SYS_LDMD_FEE_DOC_TYPE'">
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <label class="control-label">新增是否默认</label> <select name="ebfhDefaultOnAdd" class="form-control">
                                    <option value=""></option>
                                    <option value="Y">是</option>
                                    <option value="N">否</option>
                                </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-3 col-xs-3 col-sm-3 col-lg-3">
                                    <label class="control-label fontred">税率
                                    </label>
                                    <div class="sns-popwin-div input-group" data-options="cfgKey:'LRMS_TAX_RATE',valueName: 'ebfhTaxRateCode',
									 			textName:'ebfhTaxRateName'">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-right">
                    <button class="btn btn-primary query" id = "ebFeeList-advanceQuery-query-button" type="button">查询</button>
                    <button class="btn btn-primary" id = "ebFeeList-advanceQuery-reset-button" type="button">重置</button>
                    <button class="btn btn-primary" id = "ebFeeList-advanceQuery-cancel-button" type="button" data-dismiss="modal" >取消</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>



<script src="${ctx}/assets/js/admin/sys/company.js"></script>