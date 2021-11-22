<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File" %>
<%@ page import = "bean.BoardDAO" %>
<title>게시물 삭제</title>


<jsp:useBean class="bean.BoardDTO" id="dto" />
<jsp:setProperty property="num" name="dto" />
<%
	String pageNum=request.getParameter("pageNum");
	BoardDAO dao=new BoardDAO();
	String result = dao.deleteBoard(dto.getNum()); // 삭제 함수 호출
	if(result!=null){ // 첨부 파일이 있으면 첨부파일 삭제.
		String path =request.getRealPath("uploadFile/boardFile");
		File f = new File(path+"//"+result);
		f.delete();
	}
%>
<script>
	alert("삭제 되었습니다.");
	window.location="board.jsp?pageNum=<%=pageNum%>";
</script>