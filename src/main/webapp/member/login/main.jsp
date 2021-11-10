<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="bean.Cookies" %>
<title>Main.jsp</title>
<%
	Cookies cookies= new Cookies(request);
	String sid = (String)session.getAttribute("sid");
%>	
<%  /*세션 로그인*/
	if(sid!=null)
	{
%>
	이메일 "<%= sid %>"로 로그인 한 상태 <br/>
	세션id "<%= session.getId() %>"<br/>
	<a class="button success" href="/member/apply/apply.jsp">회원가입</a>
	<a class="button success" href="logout.jsp">로그아웃</a>
<%
	}/*쿠키 로그인*/
	else if(cookies.exists("cid"))
	{	// 쿠키id에 세션id를 저장한 상태
%>		
		이메일 "<%= sid %>"로 로그인 한 상태 <br/>
		세션쿠키id "<%= cookies.getValue("cid") %>"로 로그인 한 상태(쿠키) <br/> 
		jsessionid "<%= session.getId() %>"<br/>
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

