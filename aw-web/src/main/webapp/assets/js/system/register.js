/**
 * Created by zzr on 2017/4/23.
 */
define(function(require, exports, module) {
    require("jquery");
    require("bootstrap");
    require("wizard");
    require("jquery-validate");
    require("bootstrap-datepicker");
    require("select2");
    require("ace-elements");
    require("ace");

    $('#steps-container')
        .ace_wizard({
           /* step: 2 ,//设置起始位置
            buttons: '.wizard-actions:eq(0)'*/
        })
        .on('actionclicked.fu.wizard' , function(e, info){
            debugger
            if(info.step == 1) {
                if(!$('#user-form').valid()) e.preventDefault();
            } else if(info.step == 2){
                if(!$('#company-form').valid()) {
                    e.preventDefault();
                } else {
                    // 执行保存
                }
            }
        })
        .on('finished.fu.wizard', function(e) {
            // 点击 "最后提交按钮事件"
            window.location.href = ctx + "/login";
    });

    /**
     * 用户注册form验证
     */
   /* $('#user-form').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        ignore: "",
        rules: {
            mailbox: {
                required: true,
                email:true,
                remote: {
                    type: "post",
                    //请求方式
                    url: ctx+"/register/checkMailbox",     //发送请求的url地址
                    data: {
                        mailbox: function(){
                           return $("#mailbox").val();
                        }
                    },
                    dataType: "json",        //发送的数据类型
                    dataFilter: function(res) { //返回结果
                        res = $.parseJSON(res);
                        if (res.code == "0") {
                            return true;
                        }else {
                            return false;
                        }
                    }
                }
            },
            password: {
                required: true,
                minlength: 6,
                maxlength:16
            },
            password2: {
                required: true,
                minlength: 6,
                maxlength:16,
                equalTo: "#password"
            },
            verificationCode:{
                required: true,
                digits:true,
                remote: {
                    type: "post",
                    //请求方式
                    url: ctx+"/register/checkVerificationCode",
                    data: {
                        mailbox: function(){
                           return $("#mailbox").val();
                        },
                        verificationCode:function () {
                            return $("#verificationCode").val();
                        }
                    },
                    dataType: "json",        //发送的数据类型
                    dataFilter: function(res) { //返回结果
                        res = $.parseJSON(res);
                        if (res.code == "0") {
                            return true;
                        }else {
                            return false;
                        }
                    }
                }
            }
        },

        messages: {
            mailbox: {
                required: "请输入注册邮箱！",
                email: "请输入合法的邮箱地址！",
                remote:"输入邮箱已存在或公司正在审核中！"
            },
            password: {
                required: "请输入6-16位数字，字母等组成的密码！",
                minlength: "密码长度为6-16位！",
                maxlength:"密码长度为6-16位！"
            },
            password2: {
                required: "请输入6-16位数字，字母等组成的密码！",
                minlength: "密码长度为6-16位！",
                maxlength:"密码长度为6-16位！",
                equalTo: "与输入密码不匹配！"
            },
            verificationCode:{
                required: "请输入验证码！",
                digits:"请输入数字!",
                remote:"验证码错误！"

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
           error.insertAfter(element.parent());
        },

        submitHandler: function (form) {
        },
        invalidHandler: function (form) {
        }
    });*/


    jQuery.validator.addMethod("english", function(value, element) {
        var chrnum = /^([a-zA-Z]+)$/;
        return this.optional(element) || (chrnum.test(value));
    }, "只能输入字母");

    /**
     * 公司注册form验证
     */
    $('#company-form').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        ignore: "",
        rules: {
            visitUrl: {
                 required: true,
                 english:true,
                 maxlength:10,
                 remote: {
                     type: "post",
                     //请求方式
                     url: ctx+"/register/checkVisitUrl",
                     data: {
                         visitUrl: function () {
                             return $("#visitUrl").val();
                         },
                     },
                     dataType: "json",        //发送的数据类型
                     dataFilter: function(res) { //返回结果
                     res = $.parseJSON(res);
                         if (res.code == "0") {
                            return true;
                         }else {
                            return false;
                         }
                     }
                 }
             },
            companyName:{
                required: true,
                maxlength:32
            }
        },

        messages: {
            visitUrl:{
                required: "请输入公司路径！",
                maxlength:"公司路径不能超过10个字符！",
                remote:"公司路径已存在！"
            },
            companyName:{
                required: "注册名称不能为空！",
                maxlength:"公司路径不能超过32个字符！"
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

    /**
     * 切换注册主体radio
     */
    $("input[name=subjectType]").change(function(){
        debugger
        var val = $(this).val();
        switch (val){
            case "0":$(".logoSrc").show();$(".industryType").show();$(".establishmentDate").show();$(".companySize").show();break;
            case "1":$(".logoSrc").hide();$(".industryType").show();$(".establishmentDate").hide();$(".companySize").hide();break;
            case "2":$(".logoSrc").hide();$(".industryType").hide();$(".establishmentDate").hide();$(".companySize").hide();break;
            default:alert("系统错误!");break;
        }
    });


    /**
     * 验证点击，获取
     */
    $("#getVerificationCode").on("click",function(){
        // 获取验证码前对邮箱进行验证
        if(!$("input[name = 'mailbox']").valid()){
            return;
        }
        $.ajax({
            type: "POST",
            url: ctx + "/register/createVerificationCode",
            data: {
                mailbox: $("input[name = 'mailbox']").val()
            },
            dataType: 'json',
            cache: false,
            success: function (res) {
                if (res.code == "0") {
                    showtime(30);
                }else {
                    // 生成验证码异常
                    alert("重新生成验证码！");
                }
            }, error: function () {
                alert("系统错误，重新生成验证码！");
            }
        });
    });




    function showtime(t){
        $("#getVerificationCode").addClass("disabled");
        for(i=1;i<=t;i++) {
            window.setTimeout("update_p(" + i + ","+t+")", i * 1000);
        }

    }



    $('#logoSrc').ace_file_input({
        style: 'well',
        btn_choose: 'Drop files here or click to choose',
        btn_change: null,
        no_icon: 'ace-icon fa fa-cloud-upload',
        droppable: true,
        thumbnail: 'fit'//large | fit
        //,icon_remove:null//set null, to hide remove/reset button
        /**,before_change:function(files, dropped) {
						//Check an example below
						//or examples/file-upload.html
						return true;
					}*/
        /**,before_remove : function() {
						return true;
					}*/
        ,
        preview_error : function(filename, error_code) {
            //name of the file that failed
            //error_code values
            //1 = 'FILE_LOAD_FAILED',
            //2 = 'IMAGE_LOAD_FAILED',
            //3 = 'THUMBNAIL_FAILED'
            //alert(error_code);
        }

    }).on('change', function(){
        //console.log($(this).data('ace_input_files'));
        //console.log($(this).data('ace_input_method'));
    });

    $('.date-picker').datepicker({
        autoclose: true,
        todayHighlight: true
    })
    //show datepicker when clicking on the icon
        .next().on(ace.click_event, function(){
        $(this).prev().focus();
    });

});

function update_p(num,t) {
    if(num == t) {
        $("#getVerificationCode").text( "重新发送 ");
        $("#getVerificationCode").removeClass("disabled");
    }
    else {
        printnr = t-num;
        $("#getVerificationCode").text( printnr+"秒后重新发送");
    }
}
