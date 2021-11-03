<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.Comment_SprojectDAO" %>
<%@ page import = "bean.Comment_SprojectDTO" %>


 <%request.setCharacterEncoding("UTF-8"); %>

 
<jsp:useBean class= "bean.Comment_SprojectDTO"  id="cdto" />
<jsp:setProperty property="*" name="cdto" /> 
 
<%
	String pageNum = request.getParameter("pageNum");
%>


<form action="commentDeletePro.jsp" method="post">
	<input type="hidden" name="comment_num" value="<%=cdto.getComment_num() %>" />
	<input type="hidden" name="board_num" value="<%=cdto.getBoard_num() %>"/>
	<input type="hidden" name="pageNum" value="<%=pageNum%>" />
	<input type="submit" value="삭 제" />
</form>