<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="bean.BoardDTO" %>
<%@ page import="bean.BoardDAO" %>
<title>write등록중</title>
<%
	request.setCharacterEncoding("UTF-8");

	String path = request.getRealPath("uploadFile/boardFile");
	String enc = "UTF-8";
	int size = 1024*1024*10;
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request, path, size, enc, dp);

	String writer = mr.getParameter("writer");
	String category = mr.getParameter("category");
	if(category.equals("tab")){
%>		<script>
			alert("카테고리를 선택하세요");
			history.go(-1);
		</script>
<%	}else{
	String subject = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String filename = mr.getFilesystemName("filename");

	BoardDTO dto = new BoardDTO();
	dto.setWriter(writer);
	dto.setCategory(category);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setFilename(filename);
	
	BoardDAO dao = new BoardDAO();
	int result = dao.BoardInput(dto);
	if(result==1)
	{
%>		<script>
			alert("등록되었습니다.");
			window.location="board.jsp";
		</script>
<%	}
}
%>
