/**
 * Created by zzr on 2017/4/23.
 */
seajs.use(['jquery','componentutils'],function($,componentUtils){
    $(function () {
        /**
         * 点击切换验证码图片
         */
        $(".verificationCode").on("click",function () {
            $(this).attr("src", "validatecode/get");
            return false;
        });

        /**
         * 输完验证码，失去焦点
         */
        var checkCode = false;
        $("input[name = 'verificationCode']").blur(function(){
            var verificationCode = $(this).val();
            if(verificationCode == ''){return;}
            $.ajax({
                type: "POST",
                url: ctx+ "/validatecode/validate",
                data: {
                    patchca: verificationCode
                },
                dataType: 'json',
                cache: false,
                success: function (res) {
                    // 验证码输入正确
                    if (res.code == "0"){
                        checkCode = true;
                        // 验证码输入错误
                    } else if (res.code == "1") {
                        setLoginMsg(res.message)
                        checkCode = false;
                    }
                }, error: function () {
                    setLoginMsg("异常，稍后再试")
                    checkCode = false;
                }
            });
        });
        /**
         * 点击登录
         */
        $(".commit-form .btn").on("click",function () {

            var userName = $("input[name = 'userName']").val();
            var password = $("input[name = 'password']").val();
            var verificationCode = $("input[name = 'verificationCode']").val();
            debugger
            // 对登录名和密码非空验证
            if (userName == ""){
                setLoginMsg("登录名不能为空!")
                checkCode = false;
            } else if (password == ""){
                setLoginMsg("密码不能为空!")
                checkCode = false;
            } else if (verificationCode == ""){
                setLoginMsg("验证码不能为空!")
                checkCode = false;
            } else if(checkCode){
                // 登录名与密码一致验证
                $.ajax({
                    type: "POST",
                    url: ctx + "/login",
                    data: {
                        loginName: userName,
                        password: password,
                        patchca: verificationCode
                    },
                    dataType: 'json',
                    cache: false,
                    success: function (res) {
                        if (res.code == "0") {
                            //saveCookie();
                            window.location.href = ctx + "/admin";
                        } else {
                            setLoginMsg(res.message)
                            checkCode = false;
                            $("input[name = 'verificationCode']").val("");
                        }
                    }, error: function () {
                        debugger
                        setLoginMsg("异常，稍后再试")
                        checkCode = false;
                    }
                });
            }
        });
    });


    function  setLoginMsg(msg) {
        $(".form-msg").empty();
        var msgHtml = componentUtils.loginMessage(msg);
        $(".form-msg").append(msgHtml);
        $(".verificationCode").trigger("click");
    }


});

