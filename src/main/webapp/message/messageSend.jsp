<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<% 
	String message = request.getParameter("message");
	String riceiver = request.getParameter("riceiver");
	String sender = request.getParameter("sender");
%>
<%= message %>
<%= riceiver %>
<%= sender %>

<a href="message.jsp">back</a>