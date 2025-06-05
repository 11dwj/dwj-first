
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

	<script type="text/javascript" src="/scripts/jquery/jquery-1.11.min.js?random=1747721601591" ></script>

	<script src='/websites/login/zww_loginNew.jsp?act=enter'></script>
	<script src='/websites/test.js'></script>

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

						<div id=logInfo style="display:none"><input id=codeInput name="codeInput" type="hidden" ><input type="hidden" name="isRemember" value="no"></div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
<script>
	var base='http://222.189.15.73:1088';

	function login(){
		$("[name='form_05_login']").submit();
	}


	$("#vercodeimg").on('click', function(){
		$(this).attr("src", "/websites/zwwlogin/captcha.jsp?time=" + Math.random());
		$("#vercode").val("");
	});

	document.onkeydown = function(e){
		var ev = document.all ? window.event : e;
		if (ev.keyCode==13) {
			$("#submit").click();
		}
	}
</script>
</html>