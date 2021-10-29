<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="goworker.been.MemberDAO" %>
<%@ page import="goworker.been.MemberDTO" %>
<%llllllllllllllllllllllllllll
	String id = (String)session.getAttribute("id");
	if(id == null){
%>		<script>
			alert("로그인후 사용가능합니다. ");
			window.location="loginForm.jsp";
		</script>
<%	}else{
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getUserInfo(id);
%>
<form action="modifyPro.jsp" method="post">
</body> 
	id : <%=id%> 
		<input type="hidden" name="id" value="<%=id%>" /> <br />
		<input type="hidden" name="msg" value="hello" />
	email : <input type="text"         name="email" value="<%=dto.getEmail()%>"/> <br />	
	pw : <input type="password"       name="pw" value="<%=dto.getPw()%>" /> <br />
	가입날짜 : <%=dto.getReg() %> <br />
		 <input type="submit" value="정보 수정" /> 
</form>
	<%}%>
희원수정




