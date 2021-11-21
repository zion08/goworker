<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File" %>
<%@ page import = "bean.BoardDAO" %>
<title>게시물 삭제</title>


<jsp:useBean class="bean.BoardDTO" id="dto" />
<jsp:setProperty property="num" name="dto" />
<jsp:setProperty property="show" name="dto" />
<%
	String pageNum=request.getParameter("pageNum");
	BoardDAO dao=new BoardDAO();
	int result = dao.deleteBoard(dto);
%>
<script>
	alert("삭제 되었습니다.");
	window.location="board.jsp?pageNum=<%=pageNum%>";
</script>