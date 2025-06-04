





<html>
	<head>
		<title>重置密码</title>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script language="JavaScript" src="/js/window.js"></script>
		<script language="JavaScript" src="/js/tables.jsp"></script>
		<script language='javascript' src='/scripts/aBase.js'></script>
		<script language='javascript' src='/scripts/aEdit.js'></script>
		<link type='text/css' rel='stylesheet' href='/scripts/iframe.css'>
		<link id="cssLink" rel="stylesheet" type="text/css" href="/scripts/Style_blue.css"/>
		<link type='text/css' rel='StyleSheet' href='/scripts/cb2.css'>
		<script language="JavaScript">
		function makeToolbar(items){
			its="";
			if(items) its=","+items+",";
			str="<table width=100% border=0 bordercolorlight=#808080 bordercolordark=#ffffff cellspacing=0 cellpadding=0>\n";
			str+="<tr><td nowrap>\n";
			if(its.indexOf(",关闭,")>=0) str+="<input type='button' id='null' value='关闭' onclick=cancel() class='win21'>&nbsp;&nbsp;";
else str+="<input type='button' id='null' value='关闭' onclick=cancel() class='win21'>&nbsp;&nbsp;";
if(its.indexOf(",短信提醒,")>=0) str+="<input type='button' id='null' value='短信提醒' onclick=warn('phone') class='win21'>&nbsp;&nbsp;";
else str+="<input type='button' id='null' value='短信提醒' onclick=warn('phone') class='win21'>&nbsp;&nbsp;";
if(its.indexOf(",邮件提醒,")>=0) str+="<input type='button' id='null' value='邮件提醒' onclick=warn('mail') class='win21'>&nbsp;&nbsp;";
else str+="<input type='button' id='null' value='邮件提醒' onclick=warn('mail') class='win21'>&nbsp;&nbsp;";

			str+="\n</td></tr></table>\n";	
			document.getElementById('toolbar').innerHTML=str;
		}

function cancel()
{
opener.location.reload();
window.close();
}
function newAccount(){
 window.close();
 popWin("editNew.jsp?id=ojdupffrrzqi");
}
function warn(way){
  if(way == "mail"){
     centWin("/general_0/webmail/new.jsp?users=ojdupffrrzqi&temp=UserAccountToEmail&subject=用户帐号通知",730,600);
  }else if(way == "phone"){
    centWin("/general_0/mobile/send/edit.jsp?users=ojdupffrrzqi&temp=UserAccountToMobile",700,430);
  }
  
}
</SCRIPT>
	</head>
	<form name = "myForm" action = "warnInfo.jsp" method = "post">
	<input type = "hidden" name = "phoneUrl">
	<input type = "hidden" name = "emailUrl">
	<input type = "hidden" name = "msg" value = "该用户密码已重置成功！">
	<input type = "hidden" name = "how" value = "pass">
	</form>
	<body class="bodycolor" topmargin="2" leftmargin="2" rightmargin="2"
		bottommargin="2">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td class="win2"><div id=toolbar></div></td>
		  </tr>
		</table>
		
		<script language="JavaScript">
			makeToolbar();
		</script>

		<span class="VSep"></span>
		<table border="1" bordercolorlight="#808080" bordercolordark="#ffffff"
			cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td nowrap align="center" width=210 height=40>
					<b>该用户密码已重置成功！
					</b>
				</td>
			</tr>
		</table>

	</body>
	<script type="text/javascript">
	var userLoginId = "19850638328"
	if(userLoginId != "null"){
		 document.myForm.phoneUrl.value = "/general_0/mobile/send/edit.jsp?users=ojdupffrrzqi&temp=UserAccountToMobile";
  		 document.myForm.emailUrl.value = "/general_0/webmail/new.jsp?users=ojdupffrrzqi&temp=UserAccountToEmail&subject=用户帐号通知";
		 //myForm.submit();
	}
	</script>
</html>


<script type="text/javascript">
/*
if(parent&&parent.index){
  parent.index.location.reload();
}else if(opener){
  opener.location.reload();
  window.close();
}
*/
</script>
