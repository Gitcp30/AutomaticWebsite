/**
 * Created by zzr on 2017/4/27.
 */
seajs.use(['phoenix.util','constants','bootstrap-datepicker','uploadPreview','jquery-validate','phoenix.validate'],function(phoenixUtils,Constants){

    var $userEditForm = $('#userEditForm');


    $('.date-picker').datepicker({
        autoclose: true,
        todayHighlight: true
    })
    //show datepicker when clicking on the icon
        .next().on(ace.click_event, function(){
        $(this).prev().focus();
    });


    new uploadPreview({ UpBtn: "userEdit_up", DivShow: "imgdiv", ImgShow: "userEdit_picSrc" });
    $("#userEdit_picSrc").click(function(){
        $("#userEdit_up").click();
    });

    var initData = function () {
        phoenixUtils.ajaxRequest(ctx+'/admin/web/getUser',{},function (data) {
            if(data != null){
                $userEditForm.toForm(data);
                // 初始化 头像
                if(data.picSrc != null && data.picSrc != ''){
                    $('#userEdit_picSrc').attr('src',ctx+data.picSrc);
                }
                $('#userEditForm .date-picker').datepicker("setDate", dateFormatter(data.birthday));
            } else {
                layer.msg("没有查询到结果！");
            }

        });
    }



    /**
     * 公司注册form验证
     */
    $userEditForm.validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        ignore: "",
        rules: {
            userName: {
                required: true,
                maxlength:32
            },
            mobile:{
                required: true,
                isMobile:true
            },
            idCard:{
                required: true,
                isIdCardNo:true
            },
            staffNo:{
                maxlength:32
            },
            remark:{
                maxlength:255
            },
            address:{
                maxlength:255
            }

        },

        messages: {
            userName:{
                required: "用户名不能为空！",
                maxlength:"用户名不能超过32个字符！",
            },
            mobile:{
                required: "手机不能为空！",
            },
            idCard:{
                required: "身份证不能为空！",
            },
            staffNo:{
                maxlength:"员工编号不能超过32个字符！",
            },
            remark:{
                maxlength:"备注不能超过255个字符！",
            },
            address:{
                maxlength:"地址不能超过255个字符！",
            }

        },
        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-success').addClass('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
            $(e).remove();
        },

        errorPlacement: function (error, element) {
            if(element.is('input[type=file]') || element.is('.date-picker')){
                error.insertAfter(element.parent().parent());
            } else {
                error.insertAfter(element.parent());
            }
        },

        submitHandler: function (form) {
        },
        invalidHandler: function (form) {
        }
    });



    // 修改提交
    $("#userEdit-commit-button").on('click',function () {

        if(!$userEditForm.valid()){
            return;
        }

        var data = $userEditForm.serializeObject();
        debugger
        var formData = new FormData();


        $.each(data, function(key, val) {
            formData.append(key,val);
        });
        // 是否更换图片
        if($('#userEdit_up')[0].files[0] != undefined){
            formData.append('photo', $('#userEdit_up')[0].files[0]);
        }

        phoenixUtils.ajaxRequest(ctx+'/admin/web/updateUser',formData,function (res) {
            debugger
            if(res.code == Constants.CODE_SUCCESS){
                layer.msg(Constants.OPERATE_SUCCESS);
            }else {
                layer.msg(res.message);
            }
        },{processData: false,contentType: false});



    });

    $(function () {
        // 初始化页面数据
        initData();
    });

});
