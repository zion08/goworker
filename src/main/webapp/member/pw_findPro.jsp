<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>pw_findPro.jsp 이메일 가입된 여부확인</title>
<%@ page import="member.bean.DAO" %>

<jsp:useBean id="dto" class="member.bean.DTO"/>
<jsp:setProperty property="email" name="dto" />

<%
	DAO dao = new DAO();
	boolean result = dao.emailCheck(dto);
	if(result==true){%>
		<jsp:forward page="pw_find_done.jsp" ></jsp:forward>
<%  }else{%>
		<script>
			alert("가입된 이메일정보가 아닙니다.");
			history.go(-1);
		</script>	
  <%}
%>

