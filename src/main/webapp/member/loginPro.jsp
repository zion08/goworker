<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.bean.DAO" %>
<%@ page import="member.bean.Cookies" %>
<title>로그인확인</title>

<jsp:useBean id="dto" class="member.bean.DTO"/>
<jsp:setProperty property="*" name="dto" />

<%
	String chkbox=request.getParameter("logining"); // 폼페이지 체크박스로부터 전달 받은 값을 저장.
	
	DAO dao = new DAO();
	boolean result = dao.loginCheck(dto); // 로그인 확인 객체 생성.
	if(result==true) // 로그인 되었을 시.
	{	
		if(chkbox==null)
		{
			session.setAttribute("email", dto.getEmail()); // 세션 이름=값 생성
			session.setMaxInactiveInterval(60*60*3); // 세션 유지시간 3시간
			response.sendRedirect("main.jsp");
		}
		else if(chkbox.equals("yes")) // 로그인 상태 유지 체크되어 있으면 실행. (내용비교)
		{
			
			response.addCookie(Cookies.createCookie("AUTH", dto.getEmail(), "/", 60*60*24*30)); // 이름이 AUTH이고 값이 입력한 이메일인 쿠키를 생성.->로그인여부판단시 사용
			response.sendRedirect("main.jsp");
		}
	}else
  	{%>
		<script>
			alert("아이디/비밀번호 다시 입력해주세요.");
			history.go(-1);
		</script>  
  <%}%>
  