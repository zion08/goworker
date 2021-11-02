<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<title>로그인</title>

<div class="login-page" align="center">
	<h2>로그인</h2>
</div>
<script>
	function blankCheck()
	{
		pwv=document.getElementsByName("password")[0].value;
		if (pwv == "") 
		{
			alert("비밀번호를 입력해주세요.");
			return false;
		}
	}
</script>

<form action="loginPro.jsp" method="post" onsubmit="return blankCheck();" >
	<div align="center">
		<table border="1">
			<tr>
				<td colspan="3">이메일<br /></td>
			</tr>
			<tr>
				<td colspan="3"><input type="email" name="email"
					placeholder="example@goworker.com" /></td>
			</tr>

			<tr>
				<td colspan="3">비밀번호<br /></td>
			</tr>
			<tr>
				<td colspan="3"><input type="password" name="password"
					placeholder="비밀번호를 입력하세요." /></td>
			</tr>
			<tr align="left">
				<td colspan="3">로그인 상태 유지<input type="checkbox" name="logining"
					value="yes" /></td>
			</tr>
			<tr align="left">
				<td colspan="3"><a href="pw_find.jsp">비밀번호 찾기</a></td>
			</tr>
			<tr align="left">
				<td colspan="3"><input type="submit" value="이메일 로그인" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="카카오" /></td>
				<td><input type="submit" value="네이버" /></td>
				<td><input type="submit" value="구글" /></td>
			</tr>
			<tr>
				<td colspan="3"><a href="/member/apply/apply.jsp"> 계정이	없으신가요?</a></td>
			</tr>
		</table>
	</div>
</form>





