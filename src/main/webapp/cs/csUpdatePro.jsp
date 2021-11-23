<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"  %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="bean.CsDTO" %>
<%@ page import="bean.CsDAO" %>
<%@ page import="java.io.File" %>

<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getRealPath("fileSave");  // 저장 경로 
	String enc = "UTF-8";			
	int size = 1024*1024*10;  
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy(); 
	MultipartRequest mr = new MultipartRequest(request,path,size,enc,dp); 
	
	String num = mr.getParameter("num");
	String pageNum = mr.getParameter("pageNum");
	String subject = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String org = mr.getParameter("org");	
	String filename = mr.getFilesystemName("filename");
	
	CsDTO dto = new CsDTO();
	dto.setNum(Integer.parseInt(num));  //  Integer.parseInt() 문자->숫자 변환 
	dto.setSubject(subject);
	dto.setContent(content);
	if(filename == null){ // 첨부파일 없을때..
		dto.setFilename(org);
	}else{
		dto.setFilename(filename);
	}
	
	CsDAO dao = new CsDAO();
	int result = dao.updateCs(dto);
	if(result == 1){
		if(filename != null && org != null){
			File f = new File(path+"//"+org);
			f.delete();
		}
%>
	<script>
		alert("수정되었습니다.");
		window.location="cs.jsp?num=<%=num%>&pageNum=<%=pageNum%>";
	</script>
<%}%>