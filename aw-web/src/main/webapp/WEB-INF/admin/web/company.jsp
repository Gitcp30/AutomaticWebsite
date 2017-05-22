<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- main content -->
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


<script src="${ctx}/assets/js/admin/web/companyEdit.js"></script>