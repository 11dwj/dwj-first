





<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>系统信息</title>
<link rel="stylesheet" href="/scripts/zhdj/js/layui/css/layui.css" media="all">
<script src="/scripts/zhdj/js/jquery-1.9.1.min.js" charset="utf-8"></script>
<script src="/scripts/zhdj/js/layui/layui.all.js" charset="utf-8"></script>
<style>
form{
	margin:10px 5px 10px 5px
}
.layui-form-label{
	height:38px;
	line-height:38px;
}
.layui-input-block{
	width:180px;
	height:36px;
	line-height:36px;
	border:1px solid #e6e6e6;
	/* padding-left:10px */
}
</style>
</head>
<body>
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
  <ul class="layui-tab-title" >
    <li class="layui-this" style="width:calc(50% - 30px);">个人信息</li>
    <li style="width:calc(50% - 30px);">账号修改</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
	    <div style="text-align: center">
			<img src="/websites/zhdj/default.png" class="layui-circle" style="width:100px;height:100px;">
			<br>
			
			<img style="margin:0px 4px 2px 0px;" src="img/积分.png"/><span>我的积分：0.0</span>
		</div>
		<form class="layui-form layui-form-pane" action="" id="grxx">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-block"></div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block"></div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">民族</label>
				<div class="layui-input-block"></div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">出生日期</label>
				<div class="layui-input-block"></div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">身份证号码</label>
				<div class="layui-input-block"></div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">手机号码</label>
				<div class="layui-input-block"></div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">学历</label>
				<div class="layui-input-block"></div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">工作岗位</label>
				<div class="layui-input-block"></div>
			</div>
		</div>
		

		
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">入党时间</label>
				<div class="layui-input-block"></div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">转正时间</label>
				<div class="layui-input-block"></div>
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">所在组织</label>
			<div class="layui-input-block" style="width:515px;"></div>
		</div>
		</form>
    </div>
    <div class="layui-tab-item">
    	<form class="layui-form layui-form-pane" action="" id="zhxg">
    		密码修改
			<hr class="layui-bg-green">
	    	<div class="layui-form-item">
				<label class="layui-form-label" style="width:150px">输入旧密码:</label>
				<div class="layui-input-block" style="width:200px;margin-left:150px;">
				<input type="password" name="oldPassword" required lay-verify="required" placeholder="请输入旧密码" autocomplete="new-password" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="width:150px">输入新密码:</label>
				<div class="layui-input-block" style="width:200px;margin-left:150px;">
				<input type="password" name="newPassword" required lay-verify="required" placeholder="请输入新密码" autocomplete="new-password" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="width:150px">再次确认密码:</label>
				<div class="layui-input-block" style="width:200px;margin-left:150px;">
				<input type="password" name="password" required lay-verify="required" placeholder="请再次输入新密码" autocomplete="new-password" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-btn" onclick="saveMm()">确认修改密码</div>
			</div>
			登录名修改
			<hr class="layui-bg-green">
	    	<div class="layui-form-item">
				<label class="layui-form-label" style="width:150px">输入密码确认:</label>
				<div class="layui-input-block" style="width:200px;margin-left:150px;">
				<input type="password" name="checkPassword" required lay-verify="required" placeholder="请输入密码确认" autocomplete="new-password" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="width:150px">输入新登录名:</label>
				<div class="layui-input-block" style="width:200px;margin-left:150px;">
				<input type="text" name="newLoginName" required lay-verify="required" placeholder="请输入新登录名" autocomplete="new-password" class="layui-input">
				</div>				
			</div>
			<div class="layui-form-item">
				<div class="layui-btn" onclick="saveDlm()">确认修改登录名</div>
			</div>
    	</form>
    </div>
  </div>
</div>
 
<script>
//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
layui.use(['element','form'], function(){
  var element = layui.element;
  var form = layui.form;
  window.saveMm=function(){
		let newPassword = $("input[name=newPassword]").val();
		let password = $("input[name=password]").val();
		if($.trim(password)==""){
			alert("密码不可以为空");
		}else{
			if($.trim(newPassword)!=$.trim(password)){
				alert("两次密码不一致");
			}else{
				$.ajax({
					url:'/websites/zhdj/api/password/changePsd.jsp',
					data:{
						oldPassword:$("input[name=oldPassword]").val(),
						newPassword:$("input[name=newPassword]").val(),
						password:$("input[name=password]").val()						
					},
					type:'post',
					dataType:'json',
					success:function(data){
						if(data.success){
								alert(data.msg);
						}else
							alert(data.msg);
					}
				});
			}
		}
	}
  window.saveDlm=function(){
		let checkPassword = $("input[name=checkPassword]").val();
		let newLoginName = $("input[name=newLoginName]").val();
		if($.trim(checkPassword)==""){
			alert("密码不可以为空");
		}else if($.trim(newLoginName)==""){
			alert("新的登录名不可以为空");
		}else if(YHMonblus(newLoginName)!=""){
			alert(YHMonblus(newLoginName));
		}else{
				$.ajax({
					url:'/websites/zhdj/api/password/changeLoginId.jsp',
					data:{
						checkPassword:checkPassword,
						newLoginName:newLoginName
					},
					type:'post',
					dataType:'json',
					success:function(data){
						if(data.success){
								alert(data.msg);
						}else
							alert(data.msg);
					}
				});
		}
	}
});
</script>
<script>
//    用户名
    function YHMonblus(username){
       // var reN =/^\d{6,18}$/;
        var re = /^[a-zA-Z0-9_]{2,30}$/;
        if(username==""){
           return "请输入用户名";
        }else if(username.length < 2 ||username.length >30){
            return "格式错误,登录名长度应为2-30个字符";
        }else if(!re.test(username)){
        	 return "格式错误,登录名只能包含英文字母和下划线";
        }
        return "";
    }

</script>
</body>
</html>

