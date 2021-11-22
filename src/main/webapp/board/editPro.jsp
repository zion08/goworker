<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="bean.BoardDTO" %>
<%@ page import="bean.BoardDAO" %>
<%@ page import="java.io.File" %>
<title>수정중</title>
<%
	request.setCharacterEncoding("UTF-8");

	String path = request.getRealPath("uploadFile/boardFile");
	String enc = "UTF-8";
	int size = 1024*1024*10;
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request, path, size, enc, dp);

	String writer = mr.getParameter("writer");
	String category = mr.getParameter("category");
	/* 수정시 카테고리 필수 선태 */
	if(category.equals("tab")){
%>		<script>
			alert("카테고리를 선택하세요");
			history.go(-1);
		</script>
<%	}else{
	String num = mr.getParameter("num");
	String pageNum = mr.getParameter("pageNum");
	category = mr.getParameter("category");
	String subject = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String org = mr.getFilesystemName("org");
	String filename = mr.getFilesystemName("filename");

	BoardDTO dto = new BoardDTO();
	dto.setNum(Integer.parseInt(num));
	dto.setCategory(category);
	dto.setSubject(subject);
	dto.setContent(content);
	
	if(filename==null){
		dto.setFilename(org); // 원본 파일 있으면 이름 가져오기.
	}else{
		dto.setFilename(filename);
	}
	
	BoardDAO dao = new BoardDAO();
	int result = dao.editBoard(dto); // 게시글 수정 결과 저장
	if(result==1)
	{
		if(filename!=null && org != null)
		{
			File f = new File(path+"//"+org);
			f.delete();
			
		}%>
		<script>
		alert("등록되었습니다.");
		window.location="board.jsp?num=<%=num%>&pageNum=<%=pageNum%>";
		</script>
<%}
}	%>	
		