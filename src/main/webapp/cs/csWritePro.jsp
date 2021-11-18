<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"  %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="bean.CsDTO" %>
<%@ page import="bean.CsDAO" %>

<%
	request.setCharacterEncoding("UTF-8");

	String path = request.getRealPath("fileSave");
	String enc = "UTF-8";			//한글명 파일업로드시 적용된다.
	int size = 1024*1024*10;  // 10MB (업로드 최대크기 10MB 설정)
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy(); // 파일명 중복방지
	MultipartRequest mr = new MultipartRequest(request,path,size,enc,dp); //업로드
	
	String writer = mr.getParameter("writer");
	String subject= mr.getParameter("subject");
	String content= mr.getParameter("content");
	String filename = mr.getFilesystemName("filename");
	
	CsDTO dto = new CsDTO();
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setFilename(filename);
	
	CsDAO dao = new CsDAO();
	int result = dao.CsInsert(dto);
	if(result == 1){
%>		<script>
			alert("작성되었습니다.!");
			window.location="cs.jsp";
		</script>
  <%}else { %>
  		<script>
			alert("제목과 내용을 확인해주세요.!");
			history.go(-1);
		</script>
  <%} %>
	







