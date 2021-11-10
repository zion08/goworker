<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 로그인 프로세스 -->
<!-- id, pw 확인 > t: 세션 생성, main페이지 이동 > f: id/pw 재확인 요청 메세지(팝업) -->
<!-- id, pw 확인 > DAO 메소드 사용(loginCheck) -->

<!-- dao, dto 객체 생성 -->
<jsp:useBean id="dao" class="bean.MemberDAO"></jsp:useBean>
<jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
<!-- dto 변수 set -->
<jsp:setProperty property="*" name="dto"/>

<% 
	boolean result = dao.loginCheck(dto);
	if (result == true) {
		session.setAttribute("sid", dto.getId());	//로그인 성공 > 세션 생성(key=sid, value=dto.getId())
		response.sendRedirect("main/index.jsp");
	} else {
%>		<script>
			alert("ID 또는 PW를 확인하세요");
			history.go(-1);
		</script>
<%	}
%>
