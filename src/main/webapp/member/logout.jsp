<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//세션 삭제 
    	// session.invalidate(); 세션 전체 삭제
    	session.removeAttribute("id");
    	response.sendRedirect("main.jsp");
    %>