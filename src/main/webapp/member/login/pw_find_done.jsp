<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.MemberDAO" %>

<title>done</title>

<div align="center">
<h2>비밀번호 찾기</h2>
</div>

<jsp:useBean id="dto" class="bean.MemberDTO"/>

<%
String email = request.getParameter("email");
MemberDAO dao = new MemberDAO();
int result = dao.newPassword(dto); // 등록email에 새암호 update
if(result==1)
{ //  등록된 email로 메일 전송(새암호 포함)
%>
	<form action="SendMail.jsp" method="post">
	<input type="hidden" name="email" value="<%=email%>"/>
	</form>
<%
}

%>
	
<div align="center">
	<table border="1">
		<tr>
			<td align="center"><FONT face="Impact">"<%=email %>" 으로 <br>비밀번호 재설정 링크가 발송되었어요.</FONT></td>
		</tr>
		<tr>
			<td align="center"> <small> 5분내로 go-worker로 부터 메일을 받지 못하셨다면<br/> 스팸 폴더를 확인해주세요. </small></td>
		</tr>
	</table>
</div>

