<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="bean.MakeProjectDAO" %>

<jsp:useBean class="bean.MakeProjectDTO" id="dto" />
<jsp:setProperty property="num" name="dto" />    

<h2>추천을 눌러주셔서 감사합니다!</h2>

<% 
	MakeProjectDAO dao = new MakeProjectDAO();
		dao.projectGood(dto);
%>

<center>
	<input type="button" value="닫기" onclick="window.close()" />	
</center>