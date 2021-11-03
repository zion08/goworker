<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="bean.SprojectDTO" %>     
<%@ page import = "bean.Comment_SprojectDAO"%>
<%@ page import = "java.sql.Timestamp"%>

<%request.setCharacterEncoding("UTF-8"); %>


<jsp:useBean id ="cdto" class="bean.Comment_SprojectDTO"/>
<jsp:setProperty property="*" name="cdto" />

<% 
	String pageNum = request.getParameter("pageNum");
	
	Comment_SprojectDAO dao = new Comment_SprojectDAO();
	int result = dao.insertComment(cdto);
	
	if(result == 1){%>
		<script>
			alert("댓글이 등록되었습니다.");
			window.location='/goworker/s-project/s-project_detail.jsp?num=<%=cdto.getBoard_num()%>&pageNum=<%=pageNum%>';
		</script>
	<%}else{ %>	
		<script>
			alert("입력이 잘못 되었습니다. 확인부탁드립니다.");
			history.go(-1);
		</script>
	<%} %>
}