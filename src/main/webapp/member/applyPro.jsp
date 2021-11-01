<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.bean.DAO" %>
<title>회원가입확인창</title>

<jsp:useBean id="dto" class="member.bean.DTO" />
<jsp:setProperty name="dto" property="*" />

<%
	DAO dao = new DAO();
	int result = dao.memberInput(dto);
%>

<%
	if(result==1){ %>
		<script>
			alert("회원가입 성공");
			window.location="/member/login/login.jsp";
		</script>
<%	}else{ %>
		<script>
			alert("잘못입력");
			history.go(-1);
		</script>
<%	} %>
