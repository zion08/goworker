<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.Cookies" %>
<%//<jsp:include page="kakao_login.html" /> %>
	<%
		response.addCookie(Cookies.createCookie("cid","","/", 0)); //쿠키 삭제
		session.invalidate();  //세션 삭제
		//카카오 토큰 삭제
		response.sendRedirect("/goworker/main/index.jsp");
	%>