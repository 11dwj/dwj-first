








<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<link rel="shortcut icon" href="/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>零度空间</title>
<link href="/websites/login/css/jyta1.css" rel="stylesheet" type="text/css" />
<link href="/tihuan/login/common.css" rel="stylesheet" type="text/css" />
<script src='/scripts/jquery/jquery-1.9.1.js'></script>
<script src='/websites/test.js'></script>

<script language="JavaScript" type="text/JavaScript">
$(function() {
	var stars = 280;
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
});
var base='http://222.189.15.73:1188';
	var webSiteId = '';
	if (window != top)
		top.location = window.location;
	function correctPNG() {
		var pngs = document.getElementsByName("png");
		if (!pngs)
			return;
		for (var i = pngs.length - 1; i >= 0; i--) {
			var img = pngs[i]
			var imgName = img.src.toUpperCase()
			if (imgName.substring(imgName.length - 3, imgName.length) == "PNG") {
				var imgID = (img.id) ? "id='" + img.id + "' " : ""
				var imgClass = (img.className) ? "class='" + img.className
						+ "' " : ""
				var imgTitle = (img.title) ? "title='" + img.title + "' "
						: "title='" + img.alt + "' "
				var imgStyle = "display:inline-block;" + img.style.cssText
				if (img.align == "left")
					imgStyle = "float:left;" + imgStyle
				if (img.align == "right")
					imgStyle = "float:right;" + imgStyle
				if (img.parentElement.href)
					imgStyle = "cursor:hand;" + imgStyle
				var strNewHTML = "<span "
						+ imgID
						+ imgClass
						+ imgTitle
						+ " style=\""
						+ "width:"
						+ img.width
						+ "px; height:"
						+ img.height
						+ "px;"
						+ imgStyle
						+ ";"
						+ "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
						+ "(src=\'" + img.src
						+ "\', sizingMethod='scale');\"></span>"
				img.outerHTML = strNewHTML
			}
		}
	}
	function selectSystem(index){
		
		var table = document.getElementById("systemtab");
		for (var i = 0; i < table.rows.length; i++) {
			//表格的第i行，第2列
			var row=table.rows[i];
			for (var j = 0; j < row.cells.length; j++) {
				if(index==j){
					row.cells[j].className="selected";
				}else{
					row.cells[j].className="";
				}
			}
		}
	}
</script>
</head>
<body class="bg donggang">
<div class="container"></div>
<div class="stars"></div>
	<div class="main">
		<div class="main1 donggang"></div> 
		<div class="main2 donggang" style="height: 320px;">
			<div class="main2_2 donggang">
				<div class="main3">
					<table id="systemtab" border="0" cellpadding="0" cellspacing="0"
						style="text-align: center;width: 100%;">
						<tr>
							<td id="indexWeb" class="selected" onclick="selectSystem(0)">
								一窗受理系统</td>
							<td id="indexManage" onclick="selectSystem(1)">
								后台管理系统</td>
						</tr>
					</table>
				</div>
				<div class="main4">
					<script async="async">
						document.write("<script src='/websites/login/webloginIndex.jsp?act=enter'><//script>")
					</script>
				</div>
			</div>
		</div>
	</div>

<div class="light">
	<div class="light1"></div>
	<div class="light2"></div>
</div>
	<script type="text/javascript">
		var sub = document.getElementById("subLogin");
		if (sub) {
			sub.value = "";
			sub.style.width = "69px";
			sub.style.height = "27px";
			sub.style.background = "url(/images/Login/002.jpg)";
			sub.style.border = "0px";
		}
	</script>
</body>
</html>