<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 전송 폼</title>

<style type="text/css">
	<!--
		td { font_family: "굴림"; font-size: 11px;}
		
		.box{
			font-family:"굴림";
			font-size:12px;
			border-style: solid;
			border-top-width:1px;
			border-right-width:1px;
			border-bott2006-08-01om-width:1px;
			border-left-width:1px;}
	-->
	
</style>


<!-- 작성된 애용 유효성 검사 -->
<script language="javascript">
<!--
	function initForm(frm)
	{
  	 	frm.mailTo.value = "";
    	frm.mailFrom.value = "";
   		frm.fromName.value = "";
  	 	frm.title.value = "";
  		frm.content.value = "";
   		frm.upfile.select();            
   		document.selection.clear(); 
   		frm.mailTo.focus();
	}

	function checkForm(frm)
	{
 		 var Filter = /(\S+)@(\S+)\.(\S+)/ 
    
  	if( !frm.mailTo.value.match(Filter))
  	{ 
   	 alert("유효하지 않은 이메일주소 입니다");
		frm.mailTo.focus();
		return;
  	}

  	if( !frm.mailFrom.value.match(Filter))
   { 
		alert("유효하지 않은 이메일주소 입니다");
		frm.mailFrom.focus();
		return;
   }

  if( !frm.fromName.value )
  {
    alert("보내는 분의 이름 또는 정보를 입력해 주세요");
	frm.fromName.focus();
	return;
  }

  if( !frm.title.value )
  {
    alert("메일의 제목을 입력해 주세요");
	frm.title.focus();
	return;
  }

  if( !frm.content.value )
  {
    alert("메일의 내용을 입력해 주세요");
	frm.content.focus();
	return;
  }


  	frm.action = "mail.php";
 	 frm.submit();

	}
//-->
</script>
</head>
<body>

	<form name="form" method="post" enctype="multipart/form-data">
		<table width="600" border="1" cellspacing="1" cellpadding="0">
			<tr>
				<td width="150" align="center" >보내는사람 이름(name)</td>
				<td width="350"><input type="text" name="name" size="60"></td>
			</tr>
			<tr>
				<td width="134" align="center">보내는사람(from Email)</td>
				<td width="350"><input type="text" name="email" size="60"></td>
			</tr>
			<tr>
				<td align="center" >제목(subject)</td>
				<td><input type="text" name="subject" size="60"></td>
			</tr>
			<tr>
				<td align="center" >내용(content)</td>
				<td><textarea name="content" cols="62" rows="10"></textarea></td>
			</tr>
			<tr>
				<td align="center">파일(upfile)</td>
				<td align="center" ><input type="file" name="upfile" size="50"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
      				<button type="button" class="btn btn-primary btn-lg btn-block" onclick="send_mail()">보내기</button>&nbsp;
					<input type="button" name="init" value="초기화" onClick="initForm(this.form);">
				</td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		function send_mail(){
   			 window.open("./test_mail.jsp", "", "width=370, height=360, resizable=no, scrollbars=no, status=no");
		}
</script>


</body>
</html>