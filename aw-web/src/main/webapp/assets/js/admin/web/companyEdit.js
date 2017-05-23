/**
 * Created by zzr on 2017/4/27.
 */
seajs.use(['phoenix.util','constants','bootstrap-datepicker','jquery-validate','phoenix.validate'],function(phoenixUtils,Constants){

    var $companyUpdateForm = $('#companyUpdateForm');
    var $companySettingPanel = $('#companyUpdateForm .companySetting');

    $('.date-picker').datepicker({
        autoclose: true,
        todayHighlight: true
    })
    //show datepicker when clicking on the icon
        .next().on(ace.click_event, function(){
        $(this).prev().focus();
    });

    // 注册主体（0：公司，1：机构，2:个人）
    var companyTypeFormatter = function (value) {
        switch (value){
            case 0:$companySettingPanel.show();return '公司';break;
            case 1:$companySettingPanel.hide();return '机构';break;
            case 2:$companySettingPanel.hide();return '个人';break;
            default:return'未说明';break;
        }
    }


    /**
     * 初始化页面
     */
    var initData = function () {
        phoenixUtils.ajaxRequest(ctx+'/admin/web/getCompany',{},function (data) {
            if(data != null){
                data.subjectType = companyTypeFormatter(data.subjectType);
                $companyUpdateForm.toForm(data);
                $('#companyUpdateForm .date-picker').datepicker("setDate", dateFormatter(data.establishmentDate));

            } else {
                layer.msg("没有查询到结果！");
            }

        });
    }


    /**
     * 单位信息form验证
     */
    $companyUpdateForm.validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        ignore: "",
        rules: {
            companyName:{
                required: true,
                maxlength:32
            },
            mailbox: {
                required: true,
                email: true,
            },
            representative:{
                required: true,
                maxlength:32
            },
            mobile:{
                isMobile:true
            },
            telPhone:{
                digits:true,
             },
            zipCode:{
                digits:true,
                maxlength:6,
            },
            address:{
                maxlength:255
            }

        },

        messages: {
            companyName:{
                required: "注册名称不能为空！",
                maxlength:"公司路径不能超过32个字符！"
            },
            mailbox: {
                required: "请输入联系邮箱！",
                email: "请输入合法的邮箱地址！",
            },
            representative:{
                required: "负责人不能为空！",
                maxlength:"负责人不能超过32个字符！"
            },
            telPhone:{
                digits:'请输入合法电话！',
            },
            zipCode:{
                digits:'请输入合法邮政编码！',
                maxlength:"邮政编码长度为6位",
            },
            address:{
                maxlength:"地址不能超过255个字符！",
            }

        },
        highlight: function (e) {
            debugger
            $(e).closest('div').removeClass('has-success').addClass('has-error');
        },

        success: function (e) {debugger

            $(e).parent().removeClass('has-error').addClass('has-success');
            $(e).remove();
        },

        errorPlacement: function (error, element) {
            if(element.is('input[type=file]') || element.is('.date-picker')){
                error.insertAfter(element);
            } else {
                error.insertAfter(element);
            }
        },

        submitHandler: function (form) {
        },
        invalidHandler: function (form) {
        }
    });



    // 修改提交
    $("#companyUpdate-commit-button").on('click',function () {

        if(!$companyUpdateForm.valid()){
            return;
        }

        var data = $companyUpdateForm.serializeObject();
debugger
        phoenixUtils.jsonAjaxRequest(ctx+'/admin/web/updateCompany',data,function (res) {
            debugger
            if(res.code == Constants.CODE_SUCCESS){
                layer.msg(Constants.OPERATE_SUCCESS);
            }else {
                layer.msg(res.message);
            }
        });



    });


    $(function () {
        // 初始化页面数据
        initData();
    });


});
