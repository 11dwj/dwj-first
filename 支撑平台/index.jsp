
<script type="text/javascript">
	if (top == self) {
		//alert("在最顶层");
	} else {
		window.top.location.href = "/";
	}

	// 登录失败次数限制和锁定机制
	var loginFailCount = 0;
	var loginLockTime = 30; // 分钟

	function checkLoginAttempts() {
		// 获取登录失败次数
		var failCount = localStorage.getItem('loginFailCount') || 0;
		loginFailCount = parseInt(failCount);

		// 如果超过限制，显示锁定提示
		if (loginFailCount >= 5) {
			alert('您的账户已被锁定，请稍后尝试。锁定时间：' + 
			      (loginLockTime - Math.floor((new Date().getTime() - localStorage.getItem('loginLockTime')) / 10)) + '分钟');
			return false;
		}
	}

	// 提交前检查弱密码
	function isWeakPassword(password) {
		// 检查是否包含3个连续的相同字符
		var threeInARow = /(.)\1{2}/.test(password);
		// 检查是否包含常见英文单词
		var commonWords = ['admin', 'password', 'user', '123456'];
		var isCommonWord = commonWords.some(word => password.toLowerCase().includes(word));
		// 检查是否为纯数字或纯字母
		var isOnlyDigits = /^\d+$/.test(password);
		var isOnlyLetters = /^[A-Za-z]$/.test(password);

		return threeInARow || isCommonWord || isOnlyDigits || isOnlyLetters;
	}

	function loginOrQuit() {
		var form = document.form_05_login;
		var password = form.PASSWORD.value;

		// 弱密码检测
		if (isWeakPassword(password)) {
			alert('检测到弱密码，请使用更复杂的密码！');
			form.PASSWORD.focus();
			return false;
		}

		// 提交前检查登录失败次数
		checkLoginAttempts();

		return true;
	}

	// 登录失败处理
	window.onload = function() {
		// 获取登录失败次数
		loginFailCount = localStorage.getItem('loginFailCount') || 0;
		
		// 如果超过限制，显示锁定提示
		if (loginFailCount >= 5) {
			alert('您的账户已被锁定，请稍后尝试。');
		}
	};

</script>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">

	<title></title>

	<title>用户登录</title>

	<link href="/websites/gyunLogin/css/style.css" rel="stylesheet" />
	<link rel="stylesheet" href="/websites/gyunLogin/layui/css/layui.css" media="all">
	<script src='/websites/gyunLogin/layui/layui.js'></script>


	<script type="text/javascript" src="/scripts/jquery/jquery-1.11.min.js?random=1747721601591" ></script>

	<script src='/websites/login/zww_loginNew.jsp?act=enter'></script>
	<script src='/websites/test.js'></script>


	<script type="text/javascript" src="/scripts/jquery-1.1.min.js?random=174721601591"></script>

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

	var base='http://2.189.15.73:108';


	function login(){
		$("[name='form_05_login']").submit();
	}



	// 点击验证码图片更换验证码

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


	// 登录失败处理
	$(document).ready(function() {
		// 从URL参数中获取失败次数
		var failCountParam = parseInt(window.location.search.split('failCount=')[1] || 0);
		loginFailCount = failCountParam;
		
		// 更新本地存储
		localStorage.setItem('loginFailCount', failCountParam);
	}

</script>
</html>