<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.MemberDAO" %>

<% request.setCharacterEncoding("UTF-8"); %>    
<jsp:useBean class="bean.MemberDTO" id="dto" />
<jsp:setProperty property="*" name="dto"/>
<%
    MemberDAO dao = new MemberDAO();
	int result = dao.rankUpdate(dto);
	if(result == 1){%>		
		<script>
			alert("수정 되었습니다..");
			window.location='/goworker/admin/admin_member.jsp';
		</script>
	<%}else{ %>
		<script>
			alert("잘못된 입력이 있습니다. 확인하세요..");
			history.go(-1);
		</script>
	<%}%>