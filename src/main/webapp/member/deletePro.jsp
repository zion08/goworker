<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.MemberDAO" %>
<jsp:useBean class="bean.MemberDTO" id="dto" />
<jsp:setProperty property="*" name="dto"/>
<%
    MemberDAO dao = new MemberDAO();
	int result = dao.memberDelete(dto);
	if(result == 1){
		session.invalidate();  // 세션 삭제
	%>		
		<script>
			alert("탈퇴 되었습니다..");
			window.location='../main/index.jsp';
		</script>
	<%}else{ %>
		<script>
			alert("비밀번호를 확인하세요..");
			history.go(-1);
		</script>
	<%}%>
