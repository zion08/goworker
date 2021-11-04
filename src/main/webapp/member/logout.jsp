<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.bean.Cookies" %>
	<%
		response.addCookie(Cookies.createCookie("AUTH","","/", 0)); //捻虐 昏力
		session.invalidate();  //技记 昏力
		response.sendRedirect("main.jsp");
	%>