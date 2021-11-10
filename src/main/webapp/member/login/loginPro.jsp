<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.Cookies" %>
<title>로그인확인</title>

<jsp:useBean id="dto" class="bean.MemberDTO"/>
<jsp:setProperty property="*" name="dto" />

<%
	if(session.getAttribute("sid")!=null)
	{
		session.removeAttribute("sid"); // 기존 세션 값이 존재하면 삭제해준다.
	}

	String chkbox=request.getParameter("logining"); // 폼페이지 체크박스로부터 전달 받은 값을 저장.
	
	MemberDAO dao = new MemberDAO();
	boolean result = dao.loginCheck(dto); // 로그인 확인되면 맴버dao 객체 true 값 반환=>변수 result에 대입
	
	if(result==true) // 로그인 되었을 시.
	{	
		if(chkbox==null)
		{
			session.setAttribute("sid", dto.getId()); // 세션 이름=값 생성
			session.setMaxInactiveInterval(60*60*3); // 세션 유지시간 3시간
			response.sendRedirect("main.jsp");
		}
		else if(chkbox.equals("yes")) // 로그인 상태 유지 체크되어 있으면 실행. (내용비교)
		{
			response.addCookie(Cookies.createCookie("cid", session.getId(), "/", 60*60*24*30)); //쿠키에 기본쿠키세션id 저장
			response.sendRedirect("main.jsp");
			
		}
	}else
  	{%>
		<script>
			alert("아이디/비밀번호 다시 입력해주세요.");
			history.go(-1);
		</script>  
  <%}%>
