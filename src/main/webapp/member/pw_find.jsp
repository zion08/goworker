<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/include/header.jsp" %>
<title>비밀번호 찾기</title>
<div align="center">
<h2>비밀번호 찾기</h2>
<%
	session.invalidate(); // email을 통해서 암호를 찾아야 하니깐 로그인된 상태가 아니므로 남아있는 session값들 삭제시켜줌
%>
</div>
<form action="pw_findPro.jsp" method="post" >
	<div align="center">
		<table border="1">
			<tr>
				<td >가입한 이메일 주소를 입력해주세요.<br /></td>
			</tr>
			<tr>
				<td><input type="email" name="email" placeholder="example@goworker.com" /></td>
			</tr>
			<tr>
				<td> <small> 가입하신 이메일 주소를 입력해주시면<br/> 새로운 비밀번호를 설정 가능한 링크를 보내드립니다. </small></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="이메일 전송하기" />
				</td>
			</tr>
		</table>
	</div>
</form>
	
<%@ include file = "/include/footer.jsp" %>