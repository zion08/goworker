<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>pw_findPro.jsp 이메일 가입된 여부확인</title>
<%@ page import="bean.MemberDAO" %>

<jsp:useBean id="dto" class="bean.MemberDTO"/>
<jsp:setProperty property="email" name="dto" /> 
// dto객체에 email프로퍼티 가져옴
<%
 MemberDAO dao = new MemberDAO();
	boolean result = dao.emailCheck(dto);  // 입력된 email, db에 등록된 데이터와 비교
	String forwardPage = null; // 이동할 페이지 저장할 변수
	if(result==true) // 데이터가 존재하면 true
	{
		forwardPage = "pw_find_done.jsp";
	}else 
	{
		forwardPage = "pw_find_fail.jsp";
	}
%>
<jsp:forward page="<%=forwardPage%>" /> 
//해당페이지로 이동 정보가지고

