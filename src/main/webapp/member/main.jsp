<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>Main.jsp</title>
<%
String e = (String)session.getAttribute("email");
%>

<%=e%> 로그인 중.

