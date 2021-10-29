<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="bean.SmemberDAO" %>
<%@ page import="java.sql.Timestamp" %>
    
<jsp:useBean id="dto"  class="bean.SmemberDTO" />
   
<% 

	request.setCharacterEncoding("UTF-8");

	
	
	String id = request.getParameter("id");
	String career = request.getParameter("career");
	String lang = request.getParameter("lang");
	String field = request.getParameter("field");
	String worktype = request.getParameter("worktype");
	String location = request.getParameter("location");
	String employtype = request.getParameter("employtype");
	String projecttype = request.getParameter("projecttype");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String kakao = request.getParameter("kakao");
	String portfolio = request.getParameter("portfolio");
	String period = request.getParameter("period");
	String introduce = request.getParameter("introduce");
	String pay = request.getParameter("pay");
	String available =request.getParameter("available");
	int payi = Integer.parseInt(pay);
	int avail = Integer.parseInt(available);

	dto.setId(id);
	dto.setCareer(career);
	dto.setLang(lang);
	dto.setField(field);
	dto.setWorktype(worktype);
	dto.setLocation(location);
	dto.setEmploytype(employtype);
	dto.setProjecttype(projecttype);
	dto.setEmail(email);
	dto.setPhone(phone);
	dto.setKakao(kakao);
	dto.setPortfolio(portfolio);
	dto.setPeriod(period);
	dto.setIntroduce(introduce);
	dto.setAvailable(avail);
	dto.setPay(payi);
	
	SmemberDAO dao = new SmemberDAO();
	
	int result = dao.smemberInsert(dto);
	
	System.out.println(result);
	if(result ==1) {%>
		 <script type="text/javascript">
			alert("등록되었습니다.");
			window.location = 's-member.jsp';
			
</script>
<%}else {%>
	<script type="text/javascript">
			alert("잘못된 입력이 있습니다 , 확인하세요.");
			history.go(-1);
			</script>
	<%} %> 
