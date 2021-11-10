<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%@ page import= "bean.MakeProjectDTO" %>    
<%@ page import = "bean.MakeProjectDAO"%>

<%request.setCharacterEncoding("UTF-8"); %>



<% 	
	String path = request.getRealPath("project"); //실제 경로
	
	String encoding = "UTF-8"; //한글 파일명 인코딩
	int size = 1024*1024*10; //파일 사이즈
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();	//파일명 중복방지 클래스
	MultipartRequest mr = new MultipartRequest(request,path,size,encoding,dp); //파라미터 받기 및 파일 업로드
	
	String num = mr.getParameter("num");
	String pageNum = mr.getParameter("pageNum");
	String id = mr.getParameter("id");
	String subject = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String projectfile = mr.getFilesystemName("projectfile");
	
	MakeProjectDTO dto = new MakeProjectDTO();
	dto.setNum(Integer.parseInt(num)); // Integer.parseInt()  문자 → 숫자로 변환
	dto.setId(id);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setProjectfile(projectfile);

	
	MakeProjectDAO dao = new MakeProjectDAO();
	int result = dao.makeProjectUpdate(dto);
	
	if(result == 1){%>
		<script>
			alert("수정되었습니다.");
			window.location = "/goworker/project/project_detail.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>";
		</script>
	<%}else{%>
		<script>
			alert('정보가 잘못 입력되었습니다. 확인부탁드립니다.');
			history.go(-1);
		</script>
		<%}%>