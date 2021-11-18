<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.MemberDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file = "../include/header.jsp" %>

<html>
<head>
<title>비밀번호수정</title>
</head><br>
<%
	String id = (String)session.getAttribute("sid");
	if(sid == null){
%>		<script>
			alert("로그인후 사용가능합니다. ");
			window.location="loginForm.jsp";
		</script>
<%	}else{
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getUserInfo(sid);
%>
<body>
<form action="modifyPro.jsp" method="post">
		<input type="hidden" name="id" value="<%=sid%>" /> 
 <table border="1" align="center">
	<tr>
		<td>아이디 : <%=sid%> </td>
		<input type="hidden" name="id" value="<%=dto.getId()%>"/>
	</tr>
 	<tr>		
		<td>email : <%=dto.getEmail()%>
		<input type="hidden" name="email" value="<%=dto.getEmail()%>"/></td>
	</tr>
	</fome>
	<form action="pw_change.jsp" method="post">
	<tr>
        <td>비밀번호 : <input type="password" name="password" value="<%=dto.getPassword()%>" /></td>
    </tr>
    <tr>
		<td>회원등급 :
			<select name = 'rank' >
				<option value = "member">멤버</option>
				<option value = "manager">매니저</option>
			</select></td>
	</tr>         
    <tr>           
    	<td><input type="submit" value="정보 수정"  /></td>
 	</tr>
 <%}%>
 </table>
</form>  
</body> 
<br/>
<%@ include file = "/include/footer.jsp" %>
</html>






