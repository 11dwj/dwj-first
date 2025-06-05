


<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>零度空间</title>
	<link rel="stylesheet" type="text/css" href="/websites/loginH5/css/style.css" />
	<link rel="stylesheet" type="text/css" href="/websites/loginH5/css/style_login.css" />
	<meta http-equiv="X-UA-Compatible" content="IE=10" />
	<script type="text/javascript" src="/websites/loginH5/js/jquery-1.9.1.min.js"></script>
</head>

<body class="login">
<div class="idx01">
	<img src="/websites/loginH5/images/logo.png?v=1747722791259" class="toptitle" />
	<div class="loginitems ">
		<div class="inputs">
			<input type="text" name="username" placeholder="用户名" class="yhm"/>
			<input type="password" name="password" placeholder="密  码" class="mm"/>

			<table style='position:absolute;top:100px'>
				<tr>
					<td width=80%><input placeholder="验证码" style='height:50px' id=codeInput name="codeInput" type="text" size=3 style="height:16px" maxlength="4"></td>
					<td><img style='margin-top:50px;height:30px'id=loginCheckCode src="/websites/webcomment/checkCode.jsp?type=login&random=1747722791259" onclick=LoginCheck_img("loginCheckCode","codeInput") /></td>
				</tr>
			</table>
		</div>
		<img src="/websites/loginH5/images/loginbg.png" id="loginin"/>
	</div>
	<img src="/websites/loginH5/images/dizuo.png" class="light"/>
	<div class="dizuo">
		<div class="ripple rippleEffect1"></div>
		<div class="ripple rippleEffect2"></div>
	</div>

	<div class="stars"></div>
</div>
<script type="text/javascript">
	var key=false;
	if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE6.0") {
		//alert("IE 6.0");
		key=true;
	} else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE7.0") {
		//alert("IE 7.0");
		key=true
	} else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE8.0") {
		//alert("IE 8.0");
		key=true
	} else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE9.0") {
		//alert("IE 9.0");
		key=true
	}
	if(key){
		$(".dizuo").html("");
		$(".star").remove()
	}
</script>

<script>
	$(function() {
		var stars = 260;
		var $stars = $('.stars');
		var r = 800;
		for(var i = 0; i < stars; i++) {
			var $star = $('<div/>').addClass('star');
			$stars.append($star);
		}
		$('.star').each(function() {
			var cur = $(this);
			var s = 0.2 + Math.random() * 1;
			var curR = r + Math.random() * 300;
			cur.css({
				transformOrigin: '0 0 ' + curR + 'px',
				transform: ' translate3d(0,0,-' + curR + 'px) rotateY(' + Math.random() * 360 + 'deg) rotateX(' + Math.random() * -50 + 'deg) scale(' + s + ',' + s + ')'
			});
		});

		$("input").bind("keypress",function(event){
			if(event.keyCode  == "13"){
				$("#loginin").click();
			}
		})

		$("#loginin").click(function(){
			var codeInput = $("[name='codeInput']").val();
			$.post("/websites/loginH5/login.jsp","username="+$("input[name=username]").val()
					+"&password="+$("input[name=password]").val() +"&checkCode=" +codeInput ,function(data){
				console.log(data);
				if(data.success){
					window.location.reload();
				}else{
					if (data.msg == "checkError") {
						LoginCheck_img("loginCheckCode","codeInput")
						alert("验证码错误");
					} else {
						alert(data.msg);
					}
				}
			},"json")
		});

	});
	function LoginCheck_img(str,inputId){
		var img;
		if(document.getElementById(str) && document.getElementById(inputId)){
			img=document.getElementById(str);
			img.src="/websites/webcomment/checkCode.jsp?type=login&"+Math.random();
			document.getElementById(inputId).value="";
		}
	}
</script>
</body>
</html>