<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="bean.SprojectDAO" %>
<%@ page import="bean.SprojectDTO" %>
<%@ page import="java.io.File" %>

<%		
	request.setCharacterEncoding("UTF-8");
	
	String path = request.getRealPath("s-project_file"); 
	String enc = "UTF-8";			
	int size = 1024*1024*10; //
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,path,size,enc,dp);
	
	String num = mr.getParameter("num");
	String id = mr.getParameter("id");
	String phone = mr.getParameter("phone");
	String email = mr.getParameter("email");
	String kakao = mr.getParameter("kakao");
	String field = mr.getParameter("field");
	String career = mr.getParameter("career");
	String lang[] = mr.getParameterValues("lang");
	String projectimg = mr.getFilesystemName("projectimg");
	String projectdetail = mr.getParameter("projectdetail");
	String employtype = mr.getParameter("employtype");
	String projecttype[] = mr.getParameterValues("projecttype");
	String worktype[] = mr.getParameterValues("worktype");
	String location = mr.getParameter("location");
	String pay = mr.getParameter("pay");
	String period = mr.getParameter("period");
	String available =mr.getParameter("available");
	String introduce = mr.getParameter("introduce");
	String filename = mr.getParameter("filename");
	String org = mr.getParameter("org");
	String pageNum = mr.getParameter("pageNum");
	
	SprojectDTO dto = new SprojectDTO();
	dto.setNum(Integer.parseInt(num));
	
	if (pay.isEmpty()) {
		pay = String.valueOf('0');
	}
	int payi = Integer.parseInt(pay);
	int avail = Integer.parseInt(available);
	
	String langStr = new String();
	String projecttypeStr = new String();
	String worktypeStr = new String();
	
	if (lang == null) {
		langStr = null;
	} else {
		for ( String langName : lang) {
			langStr += langName +" ";
		}
	}
	
	if(projecttype == null) {
		projecttypeStr = null;
	} else {
		for ( String projecttypeName : projecttype) {
			projecttypeStr += projecttypeName +" ";
		}
	}
	
	if (worktype == null) {
		worktypeStr = null;
	} else {
		for ( String worktypeName : worktype) {
			worktypeStr += worktypeName +" ";
		}
	}
	
	if(filename == null){
		dto.setFilename(org);
	}else{
		dto.setFilename(filename);
	}
	
	SprojectDAO dao = new SprojectDAO();
	int result = dao.updateBoard(dto);
	if(result == 1){
		if(filename != null && org != null){
			File f =new File(path+"//"+org);
			f.delete();
		}
%>
	<script>
		alert("수정되었습니다");
		window.location="s-project_detail.jsp?num=<%=num%>&pageNum=<%=pageNum%>";
	</script>
<% } %>	
	
	
	
	
	
	