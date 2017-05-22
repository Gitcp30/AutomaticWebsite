<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- main content -->
            <form class="form-horizontal" id="userEditForm" enctype="multipart/form-data" novalidate="novalidate">

                <input type="hidden" name="userId">

                <div class="form-group">
                    <label class="col-xs-10 col-sm-3 control-label no-padding-right">用户头像</label>
                    <div class="col-sm-3">
                        <img src="" alt="选择头像" id="userEdit_picSrc" class="col-sm-12" width="100%" height="100" style="padding: 0;cursor: pointer;">
                        <input type="file" id="userEdit_up"  style="visibility:hidden"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">系统账号</label>

                    <div class="col-sm-3">
                        <input type="text"  name = "sysAccount" class="col-xs-12 col-sm-12" placeholder="" aria-required="true"disabled >
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" >邮箱</label>

                    <div class="col-sm-3">
                        <input type="text" name = "mailbox" class="col-xs-12 col-sm-12" placeholder="" aria-required="true"disabled >
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" >用户名</label>
                    <div class="col-sm-3">
                        <input type="text" id="userName" name = "userName" class="col-xs-12 col-sm-12" placeholder="" aria-required="true" >
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" >手机号</label>
                    <div class="col-sm-3">
                        <input type="text" id="mobile" name = "mobile" class="col-xs-12 col-sm-12" placeholder="" aria-required="true" >
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-xs-12 col-sm-3 no-padding-right">性别:</label>
                    <div class="col-xs-12 col-sm-7 ">
                        <div class="col-xs-12 col-sm-2 no-padding-right no-padding-left">
                            <label class="control-label line-height-1 blue">
                                <input name="sex" value="0" type="radio" class="ace"/>
                                <span class="lbl">男</span>
                            </label>
                        </div>

                        <div class="col-xs-12 col-sm-2 no-padding-right no-padding-left">
                            <label class="control-label  line-height-1 blue">
                                <input name="sex" value="1" type="radio" class="ace" />
                                <span class="lbl">女</span>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" >职务</label>
                    <div class="col-sm-3">
                        <input type="text" name = "duties" class="col-xs-12 col-sm-12" placeholder="" aria-required="true" >
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" >身份证号码</label>
                    <div class="col-sm-3">
                        <input type="text" id="idCard" name = "idCard" class="col-xs-12 col-sm-12" placeholder="" aria-required="true" >
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" >员工编号</label>
                    <div class="col-sm-3">
                        <input type="text" id="staffNo" name = "staffNo" class="col-xs-12 col-sm-12" placeholder="" aria-required="true" >
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" >出生日期</label>
                    <div class="col-sm-3">
                        <div class="input-group col-xs-12 col-sm-12">
                            <input class="form-control date-picker" name="birthday" type="text" data-date-format="yyyy-mm-dd" />
                            <span class="input-group-addon">
								<i class="fa fa-calendar bigger-110"></i>
							</span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" >备注</label>
                    <div class="col-sm-3">
                        <textarea class="col-xs-12 col-sm-12" id="remark" name = "remark" placeholder="" aria-required="true"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" >地址</label>
                    <div class="col-sm-3">
                        <textarea class="col-xs-12 col-sm-12" id="address" name = "address" placeholder="" aria-required="true"></textarea>
                    </div>
                </div>

            </form>

                <div class="pull-right">
                    <button class="btn btn-default" id = "userEdit-cancel-button" type="button">取消</button>
                    <button class="btn btn-primary query" id = "userEdit-commit-button" type="button">确定</button>
                </div>


        </div>
    </div>
</div>


<script src="${ctx}/assets/js/admin/web/userEdit.js"></script>