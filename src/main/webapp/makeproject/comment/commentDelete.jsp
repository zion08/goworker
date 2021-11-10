<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.MakeProject_CommentDAO" %>
<%@ page import = "bean.MakeProject_CommentDTO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="bean.MakeProject_CommentDTO" id="cdto" />
<jsp:setProperty property="*" name="cdto" />


<%
	String pageNum = request.getParameter("pageNum");
%>

<form action="/goworker/makeproject/comment/commentDeletePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=cdto.getNum() %>" />
	<input type="hidden" name="comment_num" value="<%=cdto.getComment_num() %>" />
	<input type="hidden" name="pageNum" value="<%=pageNum %>" />
	<input type="submit" value="삭제" />
</form>