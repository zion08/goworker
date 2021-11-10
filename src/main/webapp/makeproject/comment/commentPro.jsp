<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.MakeProject_CommentDTO" %>
<%@ page import = "bean.MakeProject_CommentDAO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="bean.MakeProject_CommentDTO" id="cdto" />
<jsp:setProperty property="*" name="cdto" />

<%
	String pageNum = request.getParameter("pageNum");
	
	MakeProject_CommentDAO dao = new MakeProject_CommentDAO();
	int result = dao.insertComment(cdto);
	
	
	
	if(result == 1) {%>
		<script>
			alert("댓글이 등록되었습니다.");
			window.location='/goworker/makeproject/project_detail.jsp?num=<%=cdto.getNum()%>&pageNum=<%=pageNum%>';
		</script>
		<%}else{%>
			<script>
				alert("입력이 잘못 되었습니다. 확인부탁드립니다.");
				history.go(-1);
			</script>
			<%}%>