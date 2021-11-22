<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="bean.SprojectDAO" %>
<%@ page import="bean.SprojectDTO" %>
<%@ page import="java.io.File" %>

<%		
	request.setCharacterEncoding("UTF-8");
	
	String path = request.getRealPath("uploadFile/projectFile"); 
	String enc = "UTF-8";			
	int size = 1024*1024*10; //
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,path,size,enc,dp);
	
	String num = mr.getParameter("num");
	String id = mr.getParameter("id");
	String subject = mr.getParameter("subject");
	String phone = mr.getParameter("phone");
	String email = mr.getParameter("email");
	String kakao = mr.getParameter("kakao");
	String field = mr.getParameter("field");
	String career = mr.getParameter("career");
	String lang[] = mr.getParameterValues("lang");
	String projectimg = mr.getFilesystemName("projectimg");
	String projectdetail = mr.getParameter("projectdetail");
	String employtype = mr.getParameter("employtype");
	String projecttype = mr.getParameter("projecttype");
	String worktype = mr.getParameter("worktype");
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
	
	int avail = Integer.parseInt(available);

	String langStr = new String();
	if (lang == null) {
		langStr = null;
	} else {
		for ( String langName : lang) {
			langStr += langName +" ";
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
	<script type="text/javascript">
		alert("수정되었습니다");
		window.location= "s-project_detail.jsp?num=<%=num%>&pageNum=<%=pageNum%>";
	</script>
<% } else{%>	
	<script type="text/javascript">
			alert("잘못된 입력이 있습니다 , 확인하세요.");
			history.go(-1);
			</script>
	<%} %> 
	
	
	
	
	