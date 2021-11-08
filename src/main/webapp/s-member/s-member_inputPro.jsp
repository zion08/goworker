<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="bean.SmemberDAO" %>
<%@ page import="bean.SmemberDTO" %>
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
	String path = request.getRealPath("portfolioFile"); //실제 경로
	String encoding = "UTF-8"; //한글 파일명 인코딩
	int size = 1024*1024*10; //파일 사이즈
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();	//파일명 중복방지 클래스
	MultipartRequest mr = new MultipartRequest(request,path,size,encoding,dp); //파라미터 받기 및 파일 업로드

	String id = mr.getParameter("id");
	String phone = mr.getParameter("phone");
	String email = mr.getParameter("email");
	String kakao = mr.getParameter("kakao");
	String field = mr.getParameter("field");
	String career = mr.getParameter("career");
	String lang[] = mr.getParameterValues("lang");
	String portfolio = mr.getFilesystemName("portfolio");
	String pfdetail = mr.getParameter("pfdetail");
	String employtype = mr.getParameter("employtype");
	String projecttype[] = mr.getParameterValues("projecttype");
	String worktype[] = mr.getParameterValues("worktype");
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
	

	SmemberDTO dto = new SmemberDTO();
	dto.setId(id);	
	dto.setPhone(phone);
	dto.setEmail(email);
	dto.setKakao(kakao);
	dto.setField(field);
	dto.setCareer(career);
	dto.setLang(langStr);
	dto.setPortfolio(portfolio);
	dto.setPfdetail(pfdetail);
	dto.setEmploytype(employtype);
	dto.setProjecttype(projecttypeStr);
	dto.setWorktype(worktypeStr);
	dto.setLocation(location);
	dto.setPay(payi);
	dto.setPeriod(period);
	dto.setAvailable(avail);
	dto.setIntroduce(introduce);
	
	SmemberDAO dao = new SmemberDAO();
	int result = dao.smemberInsert(dto);
	
	
	if(result == 1) {
%>		<script type="text/javascript">
			alert("등록되었습니다.");
			window.location = 's-member.jsp';
		</script>
<%	} else {
%>		<script type="text/javascript">
			alert("잘못된 입력이 있습니다, 확인하세요.");
			history.go(-1);
		</script>
<%	}
%> 
