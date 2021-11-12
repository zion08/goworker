<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDAO" %>
<%@ page import="bean.SmemberDTO" %>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.MemberDTO" %>
    
<h1> warn.jsp</h1>    

<jsp:useBean class="bean.SmemberDTO" id="dto" />
<jsp:useBean class="bean.MemberDTO" id="mdto" />
<jsp:setProperty property="*" name="dto" /> 

<%	
	String id = request.getParameter("id");
	mdto.setId(id);
	SmemberDAO dao = new SmemberDAO();
	MemberDAO mdao = new MemberDAO();
	
	int result = dao.sMemberDelete(dto);
	int warn = mdao.memberWarn(id);
	if(result ==1) { 
	%>
		 <script type="text/javascript">
			alert("삭제 및 경고 되었습니다.");
			window.location = "/goworker/admin/admin_smember.jsp";
			
	</script>
	<% }else{%>
		 <script type="text/javascript">
			alert("오류 발생");
			window.location = "/goworker/admin/admin_smember.jsp";
			
	</script>

	<%} %>