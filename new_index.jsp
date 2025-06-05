
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户 登录</title>
    <link href="/websites/gyunLogin/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="/websites/gyunLogin/layui/css/layui.css" media="all">
    <script src='/websites/gyunLogin/layui/layui.js'></script>
    <script src="/scripts/jquery/jquery-1.11.min.js"></script>
    <script src='/websites/login/zww_loginNew.jsp?act=enter'></script>
    <script src='/websites/test.js'></script>
    <
        var base = 'http://222.189.15.73:1088';
        var loginAttempts = 0;

        function login() {
            if ($("#USERNAME").val().trim() === '' || $("#PASSWORD").val().trim() === '') {
                alert("用户名和密码不能为空！");
                return;
            }

            if ($("#vercode").val().trim() === '') {
                alert("请输入验证码！");
                return;
            }

            loginAttempts++;
            if (loginAttempts >= 5) {
                alert("登录失败次数过多，请稍后再试！");
                window.location.href = "/login锁定页面.jsp";
                return;
            }

            $("[name='form_05_login']").submit();
        }

        function loginOrQuit() {
            var username = $("#USERNAME").val().trim();
            var password = $("#PASSWORD").val().trim();
            var vercode = $("#vercode").val().trim();

            if (username === '' || password === '' || vercode === '') {
                alert("请填写所有必填信息！");
                return false;
            }

            // 模拟密码强度检查
            var passwordStrength = checkPasswordStrength(password);
            if (passwordStrength === 'weak') {
                alert("您的密码强度较低，请在登录后立即修改密码！");
                window.location.href = "/no_pass.jsp";
                return false;
            }

            return true;
        }

        function checkPasswordStrength(password) {
            if (password.length < 8) return 'weak';
            if (!/[A-Z]/.test(password)) return 'weak';
            if (!/[0-9]/.test(password)) return 'weak';
            if (!/[!@#$%^&*()_+\-={}[\]:";'<>?,./]/.test(password)) return 'weak';
            return 'strong';
        }

        // 验证码点击更换
        $("#vercodeimg").on('click', function() {
            $(this).attr("src", "/websites/zwwlogin/captcha.jsp?time=" + Math.random());
            $("#vercode").val("");
        });

        // 按回车键提交
        document.onkeydown = function(e) {
            var ev = document.all ? window.event : e;
            if (ev.keyCode === 13) {
                $("#submit").click();
            }
        }

        // 防止页面在非顶层窗口中打开
        if (top !== self) {
            window.top.location.href = "/";
        }
    </script>
</head>
<body>
<div class="loginbg">
    <div class="loginmain">
        <div class="loginbox">
            <form name="form_05_login" method="post" onsubmit="return loginOrQuit()">
                <div class="dl" style="margin-left:45px">
                    <div class="dl-hy"><span>用户登录</span></div>
                    <div class="dl-t">
                        <div class="insert">
                            <div class="dl-bg"><i class="layui-icon layui-icon-username"></i></div>
                            <input type="text" name="USERNAME" id="USERNAME" autocomplete="off" placeholder="请输入用户名" />
                        </div>
                        <div class="insert">
                            <div class="dl-bg"><i class="layui-icon layui-icon-password"></i></div>
                            <input type="password" name="PASSWORD" id="PASSWORD" placeholder="请输入密码" />
                        </div>
                        <div class="insert">
                            <div class="dl-bg"><i class="layui-icon layui-icon-auz"></i></div>
                            <input type="text" name="vercode" id="vercode" placeholder="请输入验证码"/>
                            <img id="vercodeimg" class="vercodeimg" src="/websites/zwwlogin/captcha.jsp" title="看不清？更换一张">
                        </div>
                        <div onclick="login()" type="submit" name="subButton" id="submit" class="submit">登录</div>
                        <div id="logInfo" style="display:none">
                            <input id="codeInput" name="codeInput" type="hidden">
                            <input type="hidden" name="isRemember" value="no">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
