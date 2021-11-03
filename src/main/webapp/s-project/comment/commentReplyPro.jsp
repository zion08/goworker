<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.Comment_SprojectDAO" %>
<%@ page import = "bean.Comment_SprojectDTO" %>
    
<%request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean class= "bean.Comment_SprojectDTO"  id="cdto" />
<jsp:setProperty property="*" name="cdto" />   


<%
	String pageNum = request.getParameter("pageNum");

	Comment_SprojectDAO dao = new Comment_SprojectDAO();
	int result  = dao.insertComment(cdto);
%>

	<script>
		alert("답글이 작성되었습니다.");
		window.location="/goworker/s-project/s-project_detail.jsp?num=<%=cdto.getBoard_num()%>&pageNum=<%=pageNum%>";
	</script>