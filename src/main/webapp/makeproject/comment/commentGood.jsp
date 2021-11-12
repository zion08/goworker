<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="bean.MakeProject_CommentDAO" %>    

<jsp:useBean class="bean.MakeProject_CommentDTO" id="cdto" />
<jsp:setProperty property="*" name="cdto" />  

<h3>댓글을 추천해주셔서 감사합니다!</h3>


<%
	MakeProject_CommentDAO cdao = new MakeProject_CommentDAO();
	cdao.commentGood(cdto);
%>

<center>
	<input type="button" value="닫기" onclick="window.close()"/>
</center>