<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="bean.SmemberDAO" %>
<%@ page import="bean.SmemberDTO" %>
<%@ page import="java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>

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
	String lang = mr.getParameter("lang");
	String portfolio = mr.getFilesystemName("portfolio");
	String pfdetail = mr.getParameter("pfdetail");
	String employtype = mr.getParameter("employtype");
	String projecttype = mr.getParameter("projecttype");
	String worktype = mr.getParameter("worktype");
	String location = mr.getParameter("location");
	String pay = mr.getParameter("pay");
	String period = mr.getParameter("period");
	String available =mr.getParameter("available");
	String introduce = mr.getParameter("introduce");
		
	int payi = Integer.parseInt(pay);
	int avail = Integer.parseInt(available);

	SmemberDTO dto = new SmemberDTO();
	dto.setId(id);	
	dto.setPhone(phone);
	dto.setEmail(email);
	dto.setKakao(kakao);
	dto.setField(field);
	dto.setCareer(career);
	dto.setLang(lang);
	dto.setPortfolio(portfolio);
	dto.setPfdetail(pfdetail);
	dto.setEmploytype(employtype);
	dto.setProjecttype(projecttype);
	dto.setWorktype(worktype);
	dto.setLocation(location);
	dto.setPay(payi);
	dto.setPeriod(period);
	dto.setAvailable(avail);
	dto.setIntroduce(introduce);
	
	
	SmemberDAO dao = new SmemberDAO();
	int result = dao.smemberInsert(dto);
	
	System.out.println(lang);
	
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