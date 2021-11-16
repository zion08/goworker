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
	
	int count = cdao.getCommentCount(cdto);
	
	if(count == 1) {
		String result = cdao.deleteComment(cdto.getComment_num());
	%>
		<script>
			alert("댓글이 삭제되었습니다.");
			window.location='/goworker/makeproject/project_detail.jsp?num=<%=cdto.getBoard_num()%>&pageNum=<%=pageNum%>';
		</script>

	<%}else{%>
		<script>
			alert("댓글이 있는 게시물은 삭제 할 수 없습니다.")
			history.go(-1);
		</script>
	<%}%>