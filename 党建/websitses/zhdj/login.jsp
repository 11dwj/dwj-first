



<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   	 	<title>党建引领</title>
   	 	<link rel="stylesheet" type="text/css" href="css/style_login.css"/>
   	 	<link rel="stylesheet" href="/scripts/layui/css/layui.css" media="all">
   	 	<script src="js/jquery-1.9.1.min.js"></script>
	</head>
	<body class="login">
		<img src="img/title1.png" class="a-bouncein zhdjlogo " id="logo">
		<form name="myForm">
		<div class="loginitems a-fadeinR">
			<img src="img/yhdl.png" alt="" class="yhdl"/>
			<div class="inputrow">
				<div class="left">
					<img src="img/user.png" alt="" />
				</div>
				<div class="right">
					<input id="username" name="username" type="text" placeholder="用户名"/>
				</div>
			</div>
			<div class="inputrow">
				<div class="left">
					<img src="img/pswd.png" alt="" />
				</div>
				<div class="right">
					<input id="password" name="password" type="password"  placeholder="密  码"/>
				</div>
			</div>
			<div class="yzm">
				<div class="inputrow-yzm">
					<input type="text" name="vercode" id="vercode" placeholder="请输入验证码"/>
				</div>
				<div class="img-yzm">
					<img id="vercodeimg" class="vercodeimg" src="/websites/zhdj/captcha.jsp" title="看不清？更换一张">
				</div>
			</div>
			<div>
			<div style="width: 80%;float: left;margin-left:7%" id="lg" onclick="login()" class="jui-button bgred">党员登录</div>
			<!-- <div style="width: 40%;float: right;" id="lg" onclick="window.location='main.jsp?token=youke'" class="jui-button bgred">群众登录</div> -->
			</div>
			
				<a style="float: right;" href="register.jsp">立即注册</a>
			
			
		</div>
		<input type="hidden" name="type" value="login"/>
		</form>
		<div style="display: none;" id="confirm">
			<table class="layui-hide" id="demo">
			
			</table>
		</div>
		
		<script src="/scripts/layui/layui.js" charset="utf-8"></script>
		<script>
			var layer,table;
			layui.use(['table','layer'], function(){
				table = layui.table;
				layer = layui.layer;
			})
	$("#vercodeimg").on('click', function(){
		$(this).attr("src", "/websites/zhdj/captcha.jsp?time=" + Math.random());
	});
			
			function check(id,uid){
				if(confirm("核实信息后不可更改！！")){
					$.getJSON("api/login.jsp?type=check&id="+id+"&uid="+uid,function(data){
						if(data.msg == "success"){
							alert("信息核实成功，请重新登录！");
						}else{
							alert("信息核实失败，请联系管理员！");
						}
						layer.closeAll();
					})
				}
			}
			
			window.onload=function(){
				setTimeout(function(){
					document.getElementById("logo").className="zhdjlogo pulse";
				},1500)
			}
			function login(){
				var vercode=$.trim($("input[name=vercode]").val());
				if($.trim($("input[name=username]").val())==""){
					layer.tips('请输入用户名', '#username');
					$("input[name=username]").focus();
				}else if($.trim($("input[name=password]").val())==""){
					layer.tips('请输入密码', '#password');
					$("input[name=password]").focus();
				}else if(vercode==""){
					layer.tips('请输入验证码', '#vercode');
					$("input[name=vercode]").focus();
				}else{
				$.getJSON('/websites/zhdj/captchaVerify.jsp?vercode=' + vercode, function(result){
				if (result.success) {
					
					var username = $("input[name=username]").val();
					var currentPassword="";
					currentPassword=$("input[name=password]").val();
					var type = $("input[name=type]").val();
					var vercode = $("input[name=vercode]").val();
					$.ajax({
						url:"api/login.jsp",
						data:{'username':username,'password':currentPassword,'vercode':vercode,'type':type},
						success:function(data){
							
							if(data.msg == "false"){
								layer.msg('用户名或密码错误', {
									  offset: 't',
									  anim: 6
									});
							}else{
								if(data.partys){
									if(data.partys.length ==0 && data.isManager){
										window.location = 'main.jsp';
										return;
									}
									table.render({
									    elem: '#demo'
									    ,cols: [[ //标题栏
									     {field: 'username', title: '用户名',width:90}
									     , {field: 'id', title: '身份证号码',width:180}
									      ,{field: 'party', title: '所属支部',width:240}
									    ]]
										,data:data.partys
									});
									layer.open({
										  title:'核实人员信息（<font color="red">点击姓名选择正确人员</font>）',
										  type: 1,
										  skin: 'layui-layer-rim', //加上边框
										  area: ['520px', '300px'], //宽高
										  content: $("#confirm").html()
									});
								}else{
									window.location = 'main.jsp';
								}
							}
						}
					})
					
					} else {
							layer.msg(result.msg);
							$("#vercodeimg").trigger("click");
							return false;
						}
						});
				}
			}
		</script>
	</body>
</html>
