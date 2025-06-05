




<!DOCTYPE html>
<html>
<head>
<title>新建人员</title>
<meta http-equiv='Pragma' content='no-cache'>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=11' />
<link id='cssLink' type='text/css' rel='stylesheet' href='/scripts/Style_blue.css' />
<link type='text/css' rel='StyleSheet' href='/scripts/cb2.css'>
<script language='javaScript1.5' src='/scripts/ieemu.js'></script>
<script language='javaScript' src='/scripts/cb2.js'></script>
<link type='text/css' rel='stylesheet' href='/scripts/iframe.css'>
<script language='javascript' src='/scripts/aBase.js'></script>
<script language='javascript' src='/scripts/aEdit.js'></script>
<script language='javaScript'>
var pathId='_general_system_user_editNew_jsp';
var queryStr='';
var userId='admin';
entity='UserAndDept';
</script>
<script language="JavaScript">
function afterSubmit(){
	var name = myForm.userLoginId.value;
	var result = sendSync("nameHandle.jsp?name="+encodeURI(name));
    if(result == 'SB'){
    	myForm.userLoginId.focus();
    	alert("登录账号名已存在！");
    	return;
    }
  if(trim(myForm.userName.value) == ""){
  	myForm.userName.focus();
    alert("请添加真实姓名！");
    return;
  }
  //var re=/^[\u4E00-\u9FA5\uF900-\uFA2D]*$/;
  //if(!re.test(myForm.userName.value) || myForm.userName.value.length<2 || myForm.userName.value.length>5){
  //	myForm.userName.focus();
  //	alert("您的真实姓名不合法,合法的真实姓名由2到4个汉字组成!");
  //	return;
 // }
  if(myForm.deptId.value==""){
    alert("用户所属机构不能为空！");
    return;
  }
  
  if(trim(myForm.role.value)==""){
  	alert("会员角色不能为空！");
  	return;
  }
  
/*   if(trim(myForm.mobileNo.value) != ""&&myForm.mobileType[0].checked&&!checkMobile(myForm.mobileNo,"手机号码")){
    return;
  }else if(trim(myForm.mobileNo.value) != ""&&myForm.mobileType[1].checked&&!checkPhone(myForm.mobileNo,"小灵通或大灵通号码")){
    return;
  }
  if(trim(myForm.email.value) != ""&&!checkEmail(myForm.email,"电子邮件"))return;
   */
  re=/^[0-9]{3,4}$/;
  var stateNo=myForm.stateNo.options[myForm.stateNo.selectedIndex].value;
  if((stateNo=="中国0086" || stateNo=="")&& !isNullForHN("firstNo") && !re.test(myForm.firstNo.value)){
  	myForm.firstNo.focus();
  	alert("单位电话的区号不合法！");
  	return;
  }
  re=/^[0-9]{7,8}$/;
  if(!isNullForHN("secondNo") && !re.test(myForm.secondNo.value)){
  	myForm.secondNo.focus();
  	alert("单位电话的本地号码不合法！");
  	return;
  }
  re=/^[0-9]{1,8}$/;
  if(!isNullForHN("thirdNo") && !re.test(myForm.thirdNo.value)){
  	myForm.thirdNo.focus();
  	alert("单位电话的分机号码不合法！");
  	return;
  }
  if(isNullForHN("firstNo") && !isNullForHN("secondNo")){
  	alert("单位电话缺少区号！");
  	return;
  }
  if(!isNullForHN("firstNo")&& isNullForHN("secondNo")){
  	alert("单位电话缺少本地号码！");
  	return;
  }
  if((!isNullForHN("stateNo")||!isNullForHN("thirdNo")) && isNullForHN("firstNo") && isNullForHN("secondNo")){
  	alert("单位电话缺少区号和本地号码！");
  	return;
  }
  //if(trim(myForm.deptTelNo.value)=='' && trim(myForm.mobileNo.value)=='' && trim(myForm.email.value)==''){
  //	alert('当联系电话和EMAIL都为空时，单位电话不能为空！');
  //	return;
  //}
  if(!confirm("注册信息若有虚假，系统或客服人员将取消注册、终止服务!\n是否继续？"))return;
  
  if(myForm.deptTelNo.value!="")myForm.deptTelNo.value=myForm.deptTelNo.value.replace("，","");
  
  myForm.submit();
}
function inputHomeTelNo(obj){
	obj.value="";
	obj.onfocus=function(){};
	obj.style.color="#000000";
}
function isNullForHN(name){
	if(name=="firstNo" && (trim(myForm.firstNo.value)=='' || trim(myForm.firstNo.value)=='区号'))return true;
	if(name=="secondNo" && (trim(myForm.secondNo.value)=='' || trim(myForm.secondNo.value)=='本地号码'))return true;
	if(name=="thirdNo" && (trim(myForm.thirdNo.value)=='' || trim(myForm.thirdNo.value)=='分机号码'))return true;
	if(name=="stateNo" && document.myForm.stateNo.options[document.myForm.stateNo.selectedIndex].value=='')return true;
	return false;
}
function editHomeTelNo(obj){
	myForm.deptTelNo.value="";
	if(isNullForHN("firstNo") || isNullForHN("secondNo"))return;
	myForm.deptTelNo.value=myForm.firstNo.value+"-"+myForm.secondNo.value;
    if(!isNullForHN("thirdNo"))myForm.deptTelNo.value=myForm.deptTelNo.value+"-"+myForm.thirdNo.value;
    var stateNo=document.myForm.stateNo.options[document.myForm.stateNo.selectedIndex].value;
    if(stateNo!='')myForm.deptTelNo.value="("+stateNo+")-"+myForm.deptTelNo.value;
}

var input2,input1;
function selectEnt(tag, entityName, topId) {
	input2 = getPreviousInput(tag);
	if (input2 == null) {
		return;
	}
	input1 = getPreviousInput(input2);
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
	   href+="&namespace=tlzkj";
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


function formValue() { // 用于谷歌浏览器之间传值
    var data = window.ReturnValue;
	values = data.split(",");
	if (input1.type && input1.type == "hidden") {
		input1.value = values[0];
		input2.value = values[1];
	} else {
		input2.value = values[0];
		input1.value = values[1];
	}
}



</SCRIPT>
</head>
<body class="body2">
<table width="100%" height="61" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="win1"><table style='display:none;' border=0 cellspacing=0 cellpadding=0 class=index-1>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="win2"><input type='button' id='null' value='确定' onclick=afterSubmit() class='win21'>&nbsp;&nbsp;<input type='button' id='null' value='关闭' onclick=closeWindow(window) class='win21'>&nbsp;&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="win3">
	<div>
<form action="manageNew.jsp" method="post" name="myForm" style="margin:0px">
<div>
<table width='100%' BORDER=0 CELLSPACING=0 CELLPADDING=2>
<input type = "hidden" name = "id" value = "">
    <tr>
      <td nowrap align="right" width='10%' class=c2>登录账号：</td>
      <td nowrap class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="userLoginId" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
    </tr>
    <tr>
      <td nowrap align="right" width='10%' class=c2>真实姓名：</td>
      <td nowrap class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="userName" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table>
      </td>
    </tr>
    <tr>
      <td nowrap align="right" width='10%' class=c2>所属机构：</td>
      <td nowrap class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="deptId" value="" type=hidden DATAREFER="Department" ><input id=item name="deptId_nouse" value="" readOnly STYLE="width:100%" CLASS="box" ></td><td width=20><img align='absmiddle' style="cursor:hand" src="/images/menu/calendar2.gif" title="选择相关对象" onClick="selectEnt(this,'Department')"></td></tr></table>
      </td>
    </tr>
    
	<tr>
		<td align="right" width='10%' class=c2>所属角色：</td>
		<td align="left" class=c3><input type="hidden" name="roles" value="null" CHECKNULL="所属角色"><input type="text" id="role" name="role" size="60" value='' readonly class="box" /><input type="image" style="border:0px #ffffff solid;cursor:hand;" src="/images/menu/calendar2.gif" onClick="selectEnts(this,'RoleType');return false;" title="所属角色" align="absmiddle"></td>
	</tr>
	
    <tr>
		<td align="right" width='10%' class=c2><br/>移动电话：</td>
		<td align="left" class=c3><font color=red>注意：外地手机号码前不需加0</font><b>（使用手机号码注册，可获得短信息即时通信服务）</b><br/>
		<input type="hidden" name="mobileType" value="1" checked>
		<!-- <input type="radio" name="mobileType" value="2">小灵通或大灵通  -->
		<table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="mobileNo" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table></td>
	</tr>
	<tr>
		<td align="right" width='10%' class=c2>电子邮箱：</td>
		<td align="left" class=c3><table width=100% BORDER=0 CELLSPACING=0 CELLPADDING=0><tr><td><input id=item name="email" STYLE="width:100%" CLASS="box"  value="" ></td></tr></table><b>（适合海外用户或个别特殊情况者）</b></td>
	</tr>
	<tr>
		<td align="right" width='10%' class=c2>单位电话：</td>
		<td align="left" class=c3><input id=item name="deptTelNo" STYLE="width:100%" CLASS="box"  type="hidden" value="">
		<select name="stateNo"  title="国家或地区号码" onblur="editHomeTelNo(this)" style="width:100px;" class="box">
			<option selected STYLE="color:#bbbbbb" value="">国家或地区号码</option>
			<option value="马来西亚0060">马来西亚-0060</option> <option value="菲律宾0063">菲律宾-0063</option> <option value="泰国0066">泰国-0066</option> <option value="日本0081">日本-0081</option> <option value="越南0084">越南-0084</option> <option value="香港00852">香港-00852</option> <option value="柬埔寨00855">柬埔寨-00855</option> <option value="中国0086"> 中国-0086</option><option value="台湾地区00886"> 台湾地区-00886</option><option value="孟加拉国00880">孟加拉国-00880</option> <option value="印度00091">印度-00091</option> <option value="阿富汗0093">阿富汗-0093</option> <option value="缅甸0095">缅甸-0095</option> <option value="黎巴嫩00961">黎巴嫩-00961</option> <option value="叙利亚00963">叙利亚-00963</option> <option value="科威特00965">科威特-00965</option> <option value="阿曼00968">阿曼-00968</option> <option value="巴林00973">巴林-00973</option> <option value="不丹00975">不丹-00975</option> <option value="尼泊00977">尼泊-00977</option> <option value=" 印度尼西亚0062"> 印度尼西亚-0062</option> <option value=" 新加坡0065"> 新加坡-0065</option> <option value="文莱00673">文莱-00673</option> <option value=" 韩国0082"> 韩国-0082</option> <option value="朝鲜00850">朝鲜-00850</option> <option value="澳门00853">澳门-00853</option> <option value="老挝00856">老挝-00856</option> <option value="台湾00886">台湾-00886</option> <option value=" 土耳其0090"> 土耳其-0090</option> <option value=" 巴基斯坦0092"> 巴基斯坦-0092</option> <option value=" 斯里兰卡0094"> 斯里兰卡-0094</option> <option value="马尔代夫00960">马尔代夫-00960</option> <option value="约旦00962">约旦-00962</option> <option value="伊拉克00964">伊拉克-00964</option> <option value="沙特阿拉伯00966">沙特阿拉伯-00966</option> <option value="以色列00972">以色列-00972</option> <option value="卡塔尔00974">卡塔尔-00974</option> <option value="蒙古00976">蒙古-00976</option> <option value=" 伊朗0098"> 伊朗-0098</option> <option value=" 俄罗斯007"> 俄罗斯-007</option> <option value=" 荷兰0031"> 荷兰-0031</option> <option value=" 法国0033"> 法国-0033</option> <option value="直布罗陀00350">直布罗陀-00350</option> <option value="卢森堡00352">卢森堡-00352</option> <option value="冰岛00354">冰岛-00354</option> <option value="马耳他00356">马耳他-00356</option> <option value="芬兰00358">芬兰-00358</option> <option value="匈牙利00336">匈牙利-00336</option> <option value="南斯拉夫00338">南斯拉夫-00338</option> <option value="圣马力诺00223">圣马力诺-00223</option> <option value=" 罗马尼亚0040"> 罗马尼亚-0040</option> <option value=" 英国0044"> 英国-0044</option> <option value=" 瑞典0046"> 瑞典-0046</option> <option value=" 波兰0048"> 波兰-0048</option> <option value=" 希腊0030"> 希腊-0030</option> <option value=" 比利时0032"> 比利时-0032</option> <option value=" 西班牙0034"> 西班牙-0034</option> <option value="葡萄牙00351">葡萄牙-00351</option> <option value="爱尔兰00353">爱尔兰-00353</option> <option value="阿尔巴尼亚00355">阿尔巴尼亚-00355</option> <option value="塞浦路斯00357">塞浦路斯-00357</option> <option value="保加利亚00359">保加利亚-00359</option> <option value="德国00349">德国-00349</option> <option value=" 意大利0039"> 意大利-0039</option> <option value="梵蒂冈00396">梵蒂冈-00396</option> <option value=" 瑞士0041"> 瑞士-0041</option> <option value=" 奥地利0043"> 奥地利-0043</option> <option value=" 丹麦0045"> 丹麦-0045</option> <option value=" 挪威0047"> 挪威-0047</option> <option value="埃及0020">埃及-0020</option> <option value="阿尔及利亚00213">阿尔及利亚-00213</option> <option value="利比亚00218">利比亚-00218</option> <option value="塞内加尔00221">塞内加尔-00221</option> <option value="马里00223">马里-00223</option> <option value="科特迪瓦00225">科特迪瓦-00225</option> <option value="尼日尔00227">尼日尔-00227</option> <option value="贝宁00229">贝宁-00229</option> <option value="利比里亚00231">利比里亚-00231</option> <option value="加纳00233">加纳-00233</option> <option value="乍得00235">乍得-00235</option> <option value="喀麦隆00237">喀麦隆-00237</option> <option value="圣多美00239">圣多美-00239</option> <option value="赤道几内亚00240">赤道几内亚-00240</option> <option value="刚果00242">刚果-00242</option> <option value="安哥拉00244">安哥拉-00244</option> <option value="阿森松00247">阿森松-00247</option> <option value="苏丹00249">苏丹-00249</option> <option value="埃塞俄比亚00251">埃塞俄比亚-00251</option> <option value="吉布提00253">吉布提-00253</option> <option value="坦桑尼亚00255">坦桑尼亚-00255</option> <option value="布隆迪00257">布隆迪-00257</option> <option value="赞比亚00260">赞比亚-00260</option> <option value="留尼旺岛00262">留尼旺岛-00262</option> <option value="纳米比亚00264">纳米比亚-00264</option> <option value="莱索托00266">莱索托-00266</option> <option value="斯威士兰00268">斯威士兰-00268</option>
		</select>-
		<input name="firstNo" title="区号" CLASS="box" STYLE="width:40px;color:#bbbbbb" value="区号" onfocus="inputHomeTelNo(this)" onblur="editHomeTelNo(this)">-
		<input name="secondNo" title="本地号码" STYLE="color:#bbbbbb" CLASS="box" value="本地号码" onfocus="inputHomeTelNo(this)" onblur="editHomeTelNo(this)">-
		<input name="thirdNo" title="分机号码" STYLE="width:60px;color:#bbbbbb" CLASS="box" value="分机号码" onfocus="inputHomeTelNo(this)" onblur="editHomeTelNo(this)">
		</br><b>当联系电话和EMAIL都为空时，单位电话不能为空！</b></td>
	</tr>
</table>
</div>
<input type="hidden" name="namespace" value="tlzkj">
</form>
 </div>
	</td>
  </tr>
</table>
</body>
</html>

