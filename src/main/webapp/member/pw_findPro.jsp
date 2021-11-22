<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>pw_findPro.jsp 이메일 가입된 여부확인</title>
<%@ page import="bean.MemberDAO" %>

<jsp:useBean id="dto" class="bean.MemberDTO"/> 
<jsp:setProperty property="*" name="dto" /> 
<%
 MemberDAO dao = new MemberDAO();
	boolean result = dao.emailCheck(dto);  // 입력된 email, db에 등록된 데이터와 비교
	String forwardPage = null; // 이동할 페이지 저장할 변수
	if(result==true) // 데이터가 존재하면 true
	{
		session.setAttribute("email", dto.getEmail()); // 세션에 이메일 등록 
		String em=dto.getEmail(); // 이메일 임시 변수에 저장
		dao.newPassword(dto); // 새로운 비번생성과 동시에 db에 새비번 저장
		dto = dao.getUserPassword(em); // 바뀐 암호 dto에 저장
		session.setAttribute("password", dto.getPassword()); // 세션 등록
	%>
		<%@ include file="autoMailSending.jsp"%> <%-- 이메일 전송 --%> 
	<%
		forwardPage = "pw_find_done.jsp";
	}else 
	{
		forwardPage = "pw_find_fail.jsp";
	}	
%><%--해당페이지로 이동 정보가지고--%>
<jsp:forward page="<%=forwardPage%>" /> 


