<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.MakeProjectDAO" %>
<%@ page import = "bean.MakeProjectDTO" %>
    
<%request.setCharacterEncoding("UTF-8"); %> 
   
   
<jsp:useBean class= "bean.MakeProjectDTO"  id="dto" />
<jsp:setProperty property="*" name="dto" />   
    
<%
	String pageNum = request.getParameter("pageNum");
%>

<form action="project_deletePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
	<input type="hidden" name="pageNum" value="<%=pageNum %>" />
	
	<input type="submit" value="삭제"/>
</form>