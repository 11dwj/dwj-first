




                  
                  
<script language="JavaScript" type="text/JavaScript">                  


	alert("创建成功!");
	try{
		if(opener && opener.closed == false){
			if(opener.document.location.toString().indexOf("contactlist.jsp") == -1 ) {
				if(opener.parent.parent.parent.user_bar.frames.contactlist.document.location.toString().indexOf("contactlist.jsp") > -1){
					opener=opener.parent.parent.parent.user_bar.frames.contactlist;
					opener.updateAddUser('1teuyce7htv3l','','','null','','');					}
				}else{
					opener.updateAddUser('1teuyce7htv3l','','','null','','');
				}
			}
	}catch(e){}
	window.location = "otherInfo.jsp?userId=1teuyce7htv3l&namespace=bcjz";

window.close();
</script>