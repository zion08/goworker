<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.Comment_SprojectDAO" %>

<jsp:useBean class = "bean.Comment_SprojectDTO" id="cdto" />
<jsp:setProperty property="*" name="cdto"/>

<center><h3>추천을 누르셨습니다!</h3>
			추천해주셔서 감사합니다!</center><br/>
			

<%
	Comment_SprojectDAO cdao = new Comment_SprojectDAO();
		cdao.commentGood(cdto);
%>

<center>
	<input type="button" value="닫기" onclick="window.close()" />	
</center>