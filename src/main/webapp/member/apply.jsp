<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<title>회원가입</title>

<script>
	function blankCheck()
	{
		if(id=="")
		{
			alert("닉네임을 입력하세요.");	
		}
		if(email=="")
		{
			alert("이메일을 입력하세요.");	
		}
		if(password=="")
		{
			alert("비밀번호를 입력하세요.");	
		}
	}
</script>

<script>
	function idCheck()
	{
		idv=document.getElementsByName("id")[0].value;
		open("confirm.jsp?id='+idv, 'idCheck', 'width=500,height=500');
	}
</script>
<script>
	function eCheck()
	{
		emailv=document.getElementsByName("email")[0].value;
		open("confirm.jsp?id='+emailv, 'eCheck', 'width=500,height=500');
	}
</script>

<div class="apply-page" align="center">
		<h2>회원가입</h2>
</div>

<form action="applyPro.jsp" method="post" onsubmit="return blankCheck()">
	<div align="center">
		<table border="1">
			<tr>
				<td align="center">i   d : </td>
				<td><input type="text" name="id" placeholder="nickname" /></td>
				<td align="center"><a href="confirm.jsp">ID중복확인</a></td>
			</tr>
			<tr>
				<td align="center">email : </td>
				<td><input type="text" name="email" placeholder="example@goworker.com" /></td>
				<td align="center"><a href="confirm.jsp">email중복확인</a></td>
			</tr>
			<tr>
				<td align="center">password : </td>
				<td><input type="password" name="password" placeholder="영문+숫자 조합 6자리 이상 입력해주세요." /></td>
			</tr>
		</table>
			<input type="submit" value="회원가입" onclick="applyPro.jsp"/>	
	</div>
</form>












