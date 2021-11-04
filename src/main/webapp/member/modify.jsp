<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.MemberDTO" %>
<%
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
    <form action="fileup.jsp" enctype="multipart/form-data" method="post">
      프로필 : <input type="file" name="upfile">
      <input type="submit" value="Upload">
    </form> 
<form action="modifyPro.jsp" method="post">
</body>
	아이디 : <%=id%> 
		<input type="hidden" name="id" value="<%=id%>" /> <br />
		<input type="hidden" name="msg" value="hello" />
	email : <input type="text"         name="email" value="<%=dto.getEmail()%>"/> <br />	
	비밀번호 : <input type="password"       name="pw" value="<%=dto.getPw()%>" /> <br />
		 <input type="submit" value="정보 수정" /> 
</form>
	<%}%>





