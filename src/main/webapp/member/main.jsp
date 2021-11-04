<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<<<<<<< HEAD
<%@ page import="java.net.URLDecoder" %>
<%@ page import="member.bean.Cookies" %>
<title>Main.jsp</title>
<%
	Cookies cookies= new Cookies(request);
	if(cookies.exists("AUTH"))
	{
%>
		이메일 "<%= cookies.getValue("AUTH") %>"로 로그인 한 상태 <br/>
		<a class="button success" href="/member/apply/apply.jsp">회원가입</a>
		<a class="button success" href="logout.jsp">로그아웃</a>
<%
	}
	else
	{
%>		
		<a class="button success" href="/member/apply/apply.jsp">회원가입</a>
		<a class="button success" href="login.jsp">로그인</a>
<%
	}
%>

=======
<title>Main.jsp</title>
<%
String e = (String)session.getAttribute("email");
%>

<%=e%> 로그인 중.
>>>>>>> parent of 31bd6ce (Delete main.jsp)
