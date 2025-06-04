






<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>基层治理一体化平台</title>
    <link rel="stylesheet" href="/websites/zwwlogin/css/style.css?random=1747721815931"/>
    <script type="text/javascript"
            src="/websites/zwwlogin/js/jquery-1.11.2.min.js?random=1747721815931"></script>
    <script src='/websites/login/zww_loginNew.jsp?act=enter'></script>
    <script src='/websites/test.js'></script>
    <style>
        .code {
            width: 87%;
            height: 36px;
            line-height: 36px;
            border: none;
            padding-left: 10px;
            padding-right: 30px;
            border-bottom: 1px #c3c3c3 solid;
            vertical-align: bottom;
            outline: none;
        }
    </style>
</head>
<body>
<form name="form_05_login" method="post" onsubmit="return loginOrQuit()">
    <div class="login-bg">
        <div class="login-main">
            <div class="login-title"></div>
            <div class="login-content">
                <div class="dl">
                    <span class="dl-hy">欢迎登录</span>
                    <table>
                        <tr>
                            <td colspan="2">
                                <input type="text" name="username" id="u1" value="" placeholder="请输入用户名"
                                       class="name"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="password" name="password" id="u2" value="" placeholder="密码"
                                       class="password"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" name="code" value="" placeholder="请输入验证码" class="code"/>

                            </td>
                            <td style="width:100px;padding-left:10px;">
                                <img id="codeImg" style="position:relative;left:20px;" src="/websites/login/captcha.jsp"
                                     title="看不清？更换一张" onclick="refreshCodeImg()">
                            </td>
                        </tr>
                        <tr style="display:none;">
                            <td onclick="remeberPwd()" style="cursor: pointer;">
                                <input id="remp" type="checkbox" class="check"/><span class="remember">记住密码</span>
                            </td>
                        </tr>
                        <tr>
                            <td id=u3 onclick="login()" colspan="2">
                                <input type="button" class="submit" value="登录"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ewm">
                    <div class="ewm-img"></div>
                    <div class="ewm-text">打开<span>手机移动执法app</span> 扫一扫登录</div>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="/scripts/myHelper.js"></script>
<script>
    var base = 'http://222.189.15.73:1388';

    function login() {
        let username = $("input[name=username]").val();
        let password = $("input[name=password]").val();
        let code = $("input[name=code]").val();
        if (username == "") {
            alert("用户名不能为空");
            return;
        }
        if (password == "") {
            alert("密码不能为空");
            return;
        }
        if (code == "") {
            alert("验证码不能为空");
            return;
        }
        password = hex_sha1(password);

        myHelper.login("/websites/login/zwwlogin.jsp", {
            username,
            password,
            code
        }, null, function (data) {
            alert(data.msg)
            refreshCodeImg()
        });
    }

    function remeberPwd() {
        if ($("#remp").prop("checked")) {
            $("#remp").prop("checked", false);
            $("[name='isRemember']").val("no");
        } else {
            $("#remp").prop("checked", true);
            $("[name='isRemember']").val("yes");
        }
    }

    $("body").keypress(function (e) {
        var key = e.which;
        if (key == 13) {
            $("#u3").trigger("click");
        }
    });

    function refreshCodeImg() {
        $("#codeImg").attr("src", "/websites/login/captcha.jsp?t=" + new Date().getTime());
    }
</script>
</body>
</html>