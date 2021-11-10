<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%@ page import = "bean.MakeProjectDTO" %>
<%@ page import = "bean.MakeProjectDAO" %>

<%@ page import="java.sql.Timestamp" %>


<%request.setCharacterEncoding("UTF-8"); %>
    
<%	

	String encoding = "UTF-8"; //한글 파일명 인코딩
	
	String path = request.getRealPath("makeproject"); //실제 경로
	int size = 1024*1024*10; //파일 사이즈
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();	//파일명 중복방지 클래스
	MultipartRequest mr = new MultipartRequest(request,path,size,encoding,dp); //파라미터 받기 및 파일 업로드
	
	String id = mr.getParameter("id");
	String subject = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String projectfile = mr.getFilesystemName("projectfile");
	
	MakeProjectDTO dto = new MakeProjectDTO();
	dto.setId(id);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setProjectfile(projectfile);
	
	
	MakeProjectDAO dao = new MakeProjectDAO();
	int result = dao.projectInsert(dto);
	
	
	if(result == 1){
%>
	<script type="text/javascript">
		alert=("작성하신 글이 등록되었습니다.");
		window.location='/goworker/makeproject/project_list.jsp';
	</script>
<%}else{%>
	<script>
		alert("입력이 잘못 되었습니다. 확인 부탁드립니다.");
		history.go(-1);
	</script>
	<%}%>