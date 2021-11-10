<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.MakeProject_CommentDAO" %>
<%@ page import = "bean.MakeProject_CommentDTO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="bean.MakeProject_CommentDTO" id="cdto" />
<jsp:setProperty property="*" name="cdto" />


<%
	String pageNum = request.getParameter("pageNum");
	
	MakeProject_CommentDAO cdao = new MakeProject_CommentDAO();
	int result = cdao.updateComment(cdto);

	if(result == 1){%>
		<script>
			alert("댓글이 수정되었습니다");
			opener.document.location.reload();
			self.close();
			
		</script>
	<%}else{%>
		<script>
			alert("입력이 잘못 되었습니다. 확인부탁드립니다.");
			history.go(-1);
		</script>
	<%}%>