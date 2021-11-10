<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "bean.MakeProjectDAO" %>
<%@ page import = "bean.MakeProjectDTO" %>
    
<%request.setCharacterEncoding("UTF-8"); %> 
   
   
<jsp:useBean class= "bean.MakeProjectDTO"  id="dto" />
<jsp:setProperty property="*" name="dto" />   
    
<%
	String pageNum = request.getParameter("pageNum");

	MakeProjectDAO dao = new MakeProjectDAO();
	String result  = dao.deleteProject(dto.getNum());
%>
	<script>
		alert("삭제되었습니다.");
		window.location='/goworker/makeproject/project_list.jsp?num=<%=dto.getNum()%>&pageNum<%=pageNum%>';
	</script>
