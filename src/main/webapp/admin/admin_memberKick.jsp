<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.MemberDTO" %>
    
<h1> memberKick.jsp</h1>    

<jsp:useBean class="bean.MemberDTO" id="dto" />
<jsp:setProperty property="*" name="dto" /> 

<%	
	request.getParameter("id");
	MemberDAO dao = new MemberDAO();
	int result = dao.memberKick(dto);
	if(result ==1) { %>
		 <script type="text/javascript">
			alert("탈퇴처리 되었습니다.");
			window.location = "/goworker/admin/admin_member.jsp";
			
	</script>

	<%}else { %>
	<script type="text/javascript">
			alert("오류발생");
			window.location = "/goworker/admin/admin_member.jsp";
			
	</script>
	<%}%>