<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"  %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="bean.NoticeDTO" %>
<%@ page import="bean.NoticeDAO" %>
<%@ page import="java.io.File" %>

<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getRealPath("fileSave");  // 저장 경로 
	String enc = "UTF-8";			
	int size = 1024*1024*10;  
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy(); 
	MultipartRequest mr = new MultipartRequest(request,path,size,enc,dp); 
	
	String num = mr.getParameter("num");
	String writer = "관리자";
	String pageNum = mr.getParameter("pageNum");
	String subject = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String org = mr.getParameter("org");	
	String filename = mr.getFilesystemName("filename");
	
	NoticeDTO dto = new NoticeDTO();
	dto.setNum(Integer.parseInt(num));  //  Integer.parseInt() 문자->숫자 변환 
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	if(filename == null){ // 첨부파일 없을때..
		dto.setFilename(org);
	}else{
		dto.setFilename(filename);
	}
	
	NoticeDAO dao = new NoticeDAO();
	int result = dao.updateNotice(dto);
	if(result == 1){
		if(filename != null && org != null){
			File f = new File(path+"//"+org);
			f.delete();
		}
%>
	<script>
		alert("수정되었습니다.");
		window.location="/goworker/admin/admin_noticeContent.jsp?num=<%=num%>&pageNum=<%=pageNum%>";
	</script>
<%}%>