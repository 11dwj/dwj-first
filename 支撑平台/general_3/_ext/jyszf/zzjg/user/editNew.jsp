




<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
<title>新建人员</title>
<meta http-equiv='Pragma' content='no-cache'>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=EmulateIE7' />
<link id='cssLink' type='text/css' rel='stylesheet' href='/scripts/Style_blue.css' />
<link type='text/css' rel='StyleSheet' href='/scripts/cb2.css'>
<script language='javaScript1.5' src='/scripts/ieemu.js'></script>
<script language='javaScript' src='/scripts/cb2.js'></script>
<link type='text/css' rel='stylesheet' href='/scripts/iframe.css'>
<script language='javascript' src='/scripts/aBase.js'></script>
<script language='javascript' src='/scripts/aEdit.js'></script>
<script language='javaScript'>
var pathId='_general__ext_jyszf_zzjg_user_editNew_jsp';
var queryStr='';
var userId='admin';
entity='UserAndDept';
</script>
<script language="JavaScript">
function afterSubmit(){
	var name = myForm.userLoginId.value;
	var result = sendSync("nameHandle.jsp?name="+encodeURI(name));
	var result1 = sendSync("nameAidutHandle.jsp?name="+encodeURI(name));
    if(result.indexOf("SB")!=-1){
    	myForm.userLoginId.focus();
    	alert("登录用户名已存在！");
    	return;
    }else if(result1.indexOf("SB")!=-1){
    	myForm.userLoginId.focus();
    	alert("登录用户名已存在！");
    	return;
    }
    
    if(trim(myForm.userLoginId.value) == ""){
      	myForm.userLoginId.focus();
        alert("请添加用户名！");
        return;
      }
  if(trim(myForm.userName.value) == ""){
  	myForm.userName.focus();
    alert("请添加姓名！");
    return;
  }
  //var re=/^[\u4E00-\u9FA5\uF900-\uFA2D]*$/;
  //if(!re.test(myForm.userName.value) || myForm.userName.value.length<2 || myForm.userName.value.length>5){
  //	myForm.userName.focus();
  //	alert("您的真实姓名不合法,合法的真实姓名由2到4个汉字组成!");
  //	return;
 // }
  if(myForm.deptId.value==""){
    alert("请选择所属部门！");
    return;
  }
/*   if(trim(myForm.mobileNo.value) != ""&&myForm.mobileType[0].checked&&!checkMobile(myForm.mobileNo,"手机号码")){
    return;
  }else if(trim(myForm.mobileNo.value) != ""&&myForm.mobileType[1].checked&&!checkPhone(myForm.mobileNo,"小灵通或大灵通号码")){
    return;
  }
  if(trim(myForm.email.value) != ""&&!checkEmail(myForm.email,"电子邮件"))return;
   */
  //if(trim(myForm.deptTelNo.value)=='' && trim(myForm.mobileNo.value)=='' && trim(myForm.email.value)==''){
  //	alert('当联系电话和EMAIL都为空时，单位电话不能为空！');
  //	return;
  //}
  
  if(myForm.deptTelNo.value!="")myForm.deptTelNo.value=myForm.deptTelNo.value.replace("，","");
  if(document.getElementsByName("how").length>0){
  	document.getElementsByName("how")[0].value="save";
  }
  myForm.submit();
}


function saveAndNew(){
	var name = myForm.userLoginId.value;
	var result = sendSync("nameHandle.jsp?name="+encodeURI(name));
    if(result == 'SB'){
    	myForm.userLoginId.focus();
    	alert("登录账号名已存在！");
    	return;
    }
    if(trim(myForm.userLoginId.value) == ""){
      	myForm.userLoginId.focus();
        alert("请添加用户名！");
        return;
      }
  if(trim(myForm.userName.value) == ""){
  	myForm.userName.focus();
    alert("请添加姓名！");
    return;
  }
  //var re=/^[\u4E00-\u9FA5\uF900-\uFA2D]*$/;
  //if(!re.test(myForm.userName.value) || myForm.userName.value.length<2 || myForm.userName.value.length>5){
  //	myForm.userName.focus();
  //	alert("您的真实姓名不合法,合法的真实姓名由2到4个汉字组成!");
  //	return;
 // }
  if(myForm.deptId.value==""){
    alert("请选择所属部门！");
    return;
  }
/*   if(trim(myForm.mobileNo.value) != ""&&myForm.mobileType[0].checked&&!checkMobile(myForm.mobileNo,"手机号码")){
    return;
  }else if(trim(myForm.mobileNo.value) != ""&&myForm.mobileType[1].checked&&!checkPhone(myForm.mobileNo,"小灵通或大灵通号码")){
    return;
  }
  if(trim(myForm.email.value) != ""&&!checkEmail(myForm.email,"电子邮件"))return;
   */
  //if(trim(myForm.deptTelNo.value)=='' && trim(myForm.mobileNo.value)=='' && trim(myForm.email.value)==''){
  //	alert('当联系电话和EMAIL都为空时，单位电话不能为空！');
  //	return;
  //}
  
  if(myForm.deptTelNo.value!="")myForm.deptTelNo.value=myForm.deptTelNo.value.replace("，","");
  if(document.getElementsByName("how").length>0){
  	document.getElementsByName("how")[0].value="saveAndNew";
  }
  myForm.submit();
}

function inputHomeTelNo(obj){
	obj.value="";
	obj.onfocus=function(){};
	obj.style.color="#000000";
}
function editHomeTelNo(obj){
	myForm.deptTelNo.value="";
	if(isNullForHN("firstNo") || isNullForHN("secondNo"))return;
	myForm.deptTelNo.value=myForm.firstNo.value+"-"+myForm.secondNo.value;
    if(!isNullForHN("thirdNo"))myForm.deptTelNo.value=myForm.deptTelNo.value+"-"+myForm.thirdNo.value;
    var stateNo=document.myForm.stateNo.options[document.myForm.stateNo.selectedIndex].value;
    if(stateNo!='')myForm.deptTelNo.value="("+stateNo+")-"+myForm.deptTelNo.value;
}
function selectEnt(tag, entityName, topId) {
	var input2 = getPreviousInput(tag);
	if (input2 == null) {
		return;
	}
	var input1 = getPreviousInput(input2);
	if (input1 == null) {
		return;
	}
	if (entityName == "User") {
		return selectUser(tag);
	}else if(entityName == "NetFile"){
	    tag.addAttach = function(file){
	    	input1.value = file;
	    	input2.value = file;
	    };
		return selectFile("",tag);
	}
	href = "/common_0/selectEnt/index.jsp?entityName=" + entityName;
	if(topId) href+="&id="+topId;
	if(entityName == "Department"){
	   href+="&namespace=jyzww";
	}
	var info = getExplorer();
	if(info=="edge"||info=="Chrome"){
		var url = href;
		var w = centWinNo(url,300,440);
	    w.returnValue = function(str){
	    	returnValue = str;
	        if (returnValue && returnValue != null) {
				values = returnValue.split(",");
				if (input1.type && input1.type == "hidden") {
					input1.value = values[0];
					input2.value = values[1];
				} else {
					input2.value = values[0];
					input1.value = values[1];
				}
			}
	    };
	}else{
	returnValue = popDialog(href,300,440);
	if (returnValue && returnValue != null) {
		values = returnValue.split(",");
		if (input1.type && input1.type == "hidden") {
			input1.value = values[0];
			input2.value = values[1];
		} else {
			input2.value = values[0];
			input1.value = values[1];
		}
	}
	}
//弹出层停用
// 	if (input1.type && input1.type == "hidden") {
// 		window.top.createDialog2(input1,input2,href,300,440,",");
// 	}else{
// 		window.top.createDialog2(input2,input1,href,300,440,",");
// 	}
}


function selectEnt2(tag, entityName, topId) {
	var input2 = getPreviousInput(tag);
	if (input2 == null) {
		return;
	}
	var input1 = getPreviousInput(input2);
	if (input1 == null) {
		return;
	}
	
	href = "/common_0/selectEnt/index2.jsp?entityName=" + entityName+"&namespace=jyzww";
	if(topId) href+="&id="+topId;

	returnValue = popDialog(href,300,440);
	if (returnValue && returnValue != null) {
		values = returnValue.split(",");
		if (input1.type && input1.type == "hidden") {
			input1.value = values[0];
			input2.value = values[1];
		} else {
			input2.value = values[0];
			input1.value = values[1];
		}
	}
//弹出层停用
// 	if (input1.type && input1.type == "hidden") {
// 		window.top.createDialog2(input1,input2,href,300,440,",");
// 	}else{
// 		window.top.createDialog2(input2,input1,href,300,440,",");
// 	}
}

function selectEnt3(tag, entityName, topId) {
	var input2 = getPreviousInput(tag);
	if (input2 == null) {
		return;
	}
	var input1 = getPreviousInput(input2);
	if (input1 == null) {
		return;
	}
	
	href = "/common_0/selectEnt/index3.jsp?entityName=" + entityName+"&namespace=jyzww";
	if(topId) href+="&id="+topId;

	returnValue = popDialog(href,300,440);
	if (returnValue && returnValue != null) {
		values = returnValue.split(",");
		if (input1.type && input1.type == "hidden") {
			input1.value = values[0];
			input2.value = values[1];
		} else {
			input2.value = values[0];
			input1.value = values[1];
		}
	}
//弹出层停用
// 	if (input1.type && input1.type == "hidden") {
// 		window.top.createDialog2(input1,input2,href,300,440,",");
// 	}else{
// 		window.top.createDialog2(input2,input1,href,300,440,",");
// 	}
}

</SCRIPT>
</head>
<body class="body2">
<table width="100%" height="61" border="0" cellpadding="0" cellspacing="0">
  <tr>
     <td class="win1"><img name=png src='/images/logo.png'/></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="win2"><input type='button' value='保存并返回' onclick=afterSubmit() class='win21'>&nbsp;&nbsp;<input type='button' value='保存并新建' onclick=saveAndNew() class='win21'>&nbsp;&nbsp;<input type='button' value='关闭' onclick=closeWindow(window) class='win21'>&nbsp;&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="win3">
	<div>
<form action="addUserDept.jsp" method="post" name="myForm" style="margin:0px">
<div>
<table width='100%' BORDER=0 CELLSPACING=0 CELLPADDING=2>
<tr><td colspan="4" class=c1 style="text-align:left;font-size:20px">人员信息：</td></tr>
		<tr>
		<td nowrap align='right' width='10%' class=c2>用户名：</td>
			<td width='40%' class=c3 ><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="userLoginId" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
			<td nowrap align='right' width='10%' class=c2>姓名：</td>
			<td width='40%' class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="userName" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
		</tr>
		<tr>
			<td nowrap align='right' width='10%' class=c2>灌云协同对应账号：</td>
			<td width='90%' colspan="3" class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="gyxtAccount" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
		</tr>
		<tr>
		<td nowrap align='right' width='10%' class=c2>性别：</td>
			<td width='40%' class=c3>
		<input name="sex" type="radio" value="男" />	男
			<input name="sex" type="radio" value="女" />女
			</td>
		<td nowrap align='right' width='10%' class=c2 >所在部门：</td>
		
			<td width='40%' class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="deptId" value="" type=hidden DATAREFER="Department" ><input id=item name="deptId_nouse" value="" readOnly STYLE="width:100%" CLASS="boxCheck" ></td><td width=20><img align='absmiddle' style="cursor:hand" src="/images/menu/calendar2.gif" title="选择相关对象" onClick="selectEnt3(this,'Department')"></td></tr></table></td> 
	
		</tr>
		<tr>
			<td nowrap align='right' width='10%' class=c2>职务：</td>
			<td width='40%' class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="post" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
			<td nowrap align='right' width='10%' class=c2>移动电话：</td>
			<td width='40%' class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="mobileNo" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
		</tr>
		<tr>
			<td nowrap align='right' width='10%' class=c2>办公电话：</td>
			<td width='40%' class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="deptTelNo" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
			<td nowrap align='right' width='10%' class=c2>顺序编号：</td>
			<td width='40%' class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="orderNo" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
		</tr>
		<tr>
			<td nowrap align='right' width='10%' class=c2>短号码：</td>
			<td width='40%' class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="commonNo" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
			<td nowrap align='right' width='10%' class=c2>政务邮箱：</td>
			<td width='40%' class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="email" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
		</tr>
		<tr>
			<td nowrap align='right' width='10%' class=c2>住址：</td>
			<td width='40%' class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="homeAddr" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
			<td nowrap align='right' width='10%' class=c2>身份证：</td>
			<td width='40%'  class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="idCardNum" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
		</tr>

		
		
		<table width='100%' BORDER=0 CELLSPACING=0 CELLPADDING=2>
		<tr>
			<td colspan="4" class=c1 style="text-align:left;font-size:20px">角色信息：</td>
		</tr>
			
			<tr>
			
  	<td class=c2 style="height:30px;text-align:left">
  	<input type="checkBox"  name="userType" value="113y5gkk0ecqn" />南岗镇
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	<input type="checkBox"  name="userType" value="12iaxab9de87t" />燕尾港镇
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	<input type="checkBox"  name="userType" value="18uv79sc32zzs" />同兴镇
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	<input type="checkBox"  name="userType" value="1ud6s6wp2rfif" />系统管理员
  	</td>
  	
  </tr>
  
			<tr>
			
  	<td class=c2 style="height:30px;text-align:left">
  	<input type="checkBox"  name="userType" value="70peahwzt0ut" />下车镇
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	<input type="checkBox"  name="userType" value="bbusw1z87am9" />四队镇
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	<input type="checkBox"  name="userType" value="djpyt6d48qxx" />伊山镇
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	<input type="checkBox"  name="userType" value="fn9t9bezg008" />东王集镇
  	</td>
  	
  </tr>
  
			<tr>
			
  	<td class=c2 style="height:30px;text-align:left">
  	<input type="checkBox"  name="userType" value="j1f3fstp3h8i" />侍庄街道
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	<input type="checkBox"  name="userType" value="lelfa6c8c7aa" />龙苴镇
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	<input type="checkBox"  name="userType" value="m6n75qg5ia1d" />小伊镇
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	<input type="checkBox"  name="userType" value="ofadhl5nuz2v" />图河镇
  	</td>
  	
  </tr>
  
			<tr>
			
  		<td class=c2 style="height:30px;text-align:left">
  			<input type="checkBox"  name="userType" value="pjbdgoou5kjq" />圩丰镇
  		</td>
  	
  		<td class=c2 style="height:30px;text-align:left">
  			<input type="checkBox"  name="userType" value="vmya1wrv0wne" />杨集镇
  		</td>
  	
  		<td class=c2 style="height:30px;text-align:left">
  			<input type="checkBox"  name="userType" value="wqx4anyf50xa" />灌云县
  		</td>
  			
  		<td class=c2></td>
  	
  </tr>
  
  	<tr>
		<td colspan="4" class=c1 style="text-align:left;font-size:20px">公开应用：</td>
	</tr>
  	
  		<tr>
			
  	<td class=c2 style="height:30px;text-align:left">
  	审批服务
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	自动化办公
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	综合执法
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	党建引领
  	</td>
  	
  </tr>
  
  		<tr>
			
  	<td class=c2 style="height:30px;text-align:left">
  	网格管理
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	经济发展
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	智慧安监
  	</td>
  	
  	<td class=c2 style="height:30px;text-align:left">
  	内容管理
  	</td>
  	
  </tr>
  
  		<tr>
			
  		<td class=c2 style="height:30px;text-align:left">
  			指挥调度
  		</td>
  			
  		<td class=c2></td>
  			
  		<td class=c2></td>
  			
  		<td class=c2></td>
  	
  </tr>
  
</table>
</div>
<input name=id type=hidden value="">
<input type="hidden" name="namespace" value="jyzww">
<input id=how name=how type=hidden value="">
<input type="hidden" name="role" >
</form>
 </div>
	</td>
  </tr>
</table>
<script>
	document.getElementsByName("userName")[0].style.border="1px solid #ee0000";
	document.getElementsByName("userLoginId")[0].style.border="1px solid #ee0000";
	
	var str="";
	var userType=document.getElementsByName("userType");
	for(var i=0;i<userType.length;i++){
		if(userType[i].checked){
			str +=userType[i].value+",";
		}
	}
	document.getElementsByName("role")[0].value=str;
	for(var i=0;i<userType.length;i++){
		userType[i].onclick=function(){
			if(this.checked){
				str +=this.value+",";
			}else{
				str =str.replace(this.value+",","");
			}
			document.getElementsByName("role")[0].value=str;
		}
	}
	
	
	var zwyj = document.getElementsByName("zwyj")[0];
	zwyj.onclick=function(){
		if(this.checked){
			this.value="yes";
		}else{
			this.value="no";
		}
	}
	
</script>
</body>
</html>

