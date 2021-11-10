<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.Cookies" %>
<jsp:include page="kakao_login.html" flush="false" />
<title>로그인</title>
<%
	Cookies cookies = new Cookies(request);
	if(session.getAttribute("sid") !=null || cookies.getValue("cid")!=null)
	{ // 세션id있으면 main화면으로 이동
		response.sendRedirect("main.jsp");
	}else {
%>
<div class="login-page" align="center">
	<h2>로그인</h2>
</div>
<script>
	function blankCheck()  // 암호 공백 확인.
	{
		idv=document.getElementsByName("id")[0].value;
		if(idv=="")
		{
			alert("아이디를 입력해주세요.");
			return false;
		}
		
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
				<td colspan="1">아이디<br /></td>
			</tr>
			<tr>
				<td colspan="1"><input type="text" name="id"
					placeholder="아이디 입력해주세요" /></td>
			</tr>

			<tr>
				<td colspan="1">비밀번호<br /></td>
			</tr>
			<tr>
				<td colspan="1"><input type="password" name="password"
					placeholder="비밀번호를 입력하세요." /></td>
			</tr>
			<tr align="left">
				<td colspan="1">로그인 상태 유지<input type="checkbox" name="logining"
					value="yes" /></td>
			</tr>
			<tr align="left">
				<td colspan="1"><a href="pw_find.jsp">비밀번호 찾기</a></td>
			</tr>
			<tr align="center">
				<td colspan="1"><input type="submit" value=" 로그인 " /><button type="button" 
					onClick="location.href='/goworker/member/apply/apply.jsp'" >회원가입</button></td>
			</tr>
			<tr>
				<td><a href="javascript:kakaoLogin();"><img src="/goworker/member/login/image/kakao.png" style="height:40px;width:auto;"/></a></td>
			</tr>
		</table>
	</div>
</form>
<%
}
%>
