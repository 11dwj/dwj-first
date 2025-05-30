<script type="text/javascript">
    if (top == self) {
        //alert("在最顶层");
    } else {
        window.top.location.href = "/";
    }
</script>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link href="/websites/gyunLogin/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="/websites/gyunLogin/layui/css/layui.css" media="all">
    <script src='/websites/gyunLogin/layui/layui.js'></script>

    <script type="text/javascript" src="/scripts/jquery/jquery-1.11.min.js?random=1747721601591"></script>

    <script src='/websites/login/zww_loginNew.jsp?act=enter'></script>
    <script src='/websites/test.js'></script>
    <script src='/websites/login/passwordStrength.js'></script>

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
                        <div id="slideVerify" style="display: none;">
                            <div id="verifyContainer"></div>
                            <div id="verifyResult"></div>
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
<script>
    var base = 'http://222.189.15.73:1088';

    // 登录尝试次数
    var loginAttempts = 0;
    var maxAttempts = 5; // 最大尝试次数

    function login() {
        if (checkPasswordStrength()) {
            $("[name='form_05_login']").submit();
        }
    }

    function checkPasswordStrength() {
        var password = document.getElementById('PASSWORD').value;
        var hasUppercase = /[A-Z]/.test(password);
        var hasLowercase = /[a-z]/.test(password);
        var hasNumber = /\d/.test(password);
        var hasSpecial = /[!@#$%^&*()_+]/.test(password);
        var length = password.length >= 8;

        if (!length || !hasNumber || !hasSpecial) {
            alert('密码强度不足，请确保密码长度至少为8位，并包含数字和特殊字符');
            return false;
        }

        return true;
    }

    function loginOrQuit() {
        var username = document.getElementById('USERNAME').value;
        var password = document.getElementById('PASSWORD').value;
        var vercode = document.getElementById('vercode').value;

        if (username === '' || password === '') {
            alert('请输入用户名和密码');
            return false;
        }

        if (loginAttempts >= maxAttempts) {
            showSlideVerify();
            return false;
        }

        // 模拟登录请求
        setTimeout(function() {
            if (Math.random() > 0.5) {
                loginAttempts++;
                alert('登录失败，请重试');
            } else {
                loginAttempts = 0;
                alert('登录成功');
                window.location.href = base + '/index.jsp';
            }
        }, 1000);

        return false;
    }

    function showSlideVerify() {
        document.getElementById('slideVerify').style.display = 'block';
        // 初始化滑动验证码
        layui.use('verify', function(){
            var verify = layui.verify;
            verify.render({
                elem: '#verifyContainer'
                ,type: 'slide' // 滑动类型
                ,size: '120px' // 宽
                ,text: '请拖动滑块完成验证'
                ,done: function(value){
                    // 验证通过
                    document.getElementById('slideVerify').style.display = 'none';
                    loginAttempts = 0;
                    return true;
                }
                ,fail: function(value){
                    // 验证失败
                    alert('验证失败，请重新尝试');
                }
            });
        });
    }

    $("#vercodeimg").on('click', function(){
        $(this).attr("src", "/websites/zwwlogin/captcha.jsp?time=" + Math.random());
        $("#vercode").val("");
    });

    document.onkeydown = function(e){
        var ev = document.all ? window.event : e;
        if (ev.keyCode == 13) {
            $("#submit").click();
        }
    }
</script>
</html>