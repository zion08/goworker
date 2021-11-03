<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bean.DAO" %>
<title>로그인확인</title>

<jsp:useBean id="dto" class="bean.DTO"/>
<jsp:setProperty property="*" name="dto" />

<%
	DAO dao = new DAO();
	boolean result = dao.loginCheck(dto);
	String chkbox=request.getParameter("logining");
	if(result==true)
	{	
		if(chkbox!=null)
		{
			session.setAttribute("email", dto.getEmail());
			response.sendRedirect("main.jsp");
			System.out.println(chkbox);
		}
    }else
  	{%>
		<script>
			alert("아이디/비밀번호 다시 입력해주세요.");
			history.go(-1);
		</script>  
  <%}%>