<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="bean.SprojectDTO" %>
<%@ page import="bean.SprojectDAO" %>
<%@ page import="java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- 
	multipart/form-data 전송  
		> 액션태그 사용 못함
		> request.getParameter() 사용 못함  
		> MultipartRequest를 대신 사용
	DefaultFileRenamePolicy > 파일이름 중복 방지
-->

<% 	
	String path = request.getRealPath("projectFile"); //실제 경로
	String encoding = "UTF-8"; //한글 파일명 인코딩
	int size = 1024*1024*10; //파일 사이즈
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();	//파일명 중복방지 클래스
	MultipartRequest mr = new MultipartRequest(request,path,size,encoding,dp); //파라미터 받기 및 파일 업로드

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
		
	if (pay.isEmpty()) {
		pay = String.valueOf('0');
	}
	int payi = Integer.parseInt(pay);
	
	int avail = Integer.parseInt(available);
	
	String langStr = new String();
	if (lang == null) {
		langStr = null;
	} else {
		for ( String langName : lang) {
			langStr += langName +" ";
		}
	}
	
	
	SprojectDTO dto = new SprojectDTO();
	dto.setId(id);	
	dto.setSubject(subject);
	dto.setPhone(phone);
	dto.setEmail(email);
	dto.setKakao(kakao);
	dto.setField(field);
	dto.setCareer(career);
	dto.setLang(langStr);
	dto.setProjectimg(projectimg);
	dto.setProjectdetail(projectdetail);
	dto.setEmploytype(employtype);
	dto.setProjecttype(projecttype);
	dto.setWorktype(worktype);
	dto.setLocation(location);
	dto.setPay(payi);
	dto.setPeriod(period);
	dto.setAvailable(avail);
	dto.setIntroduce(introduce);
	
	SprojectDAO dao = new SprojectDAO();
	int result = dao.sprojectInsert(dto);
	
	
	if(result == 1) {
%>		<script type="text/javascript">
			alert("등록되었습니다.");
			window.location = 's-project_list.jsp';
		</script>
<%	} else {
%>		<script type="text/javascript">
			alert("잘못된 입력이 있습니다, 확인하세요.");
			history.go(-1);
		</script>
<%	}
%> 