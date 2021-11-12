<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDAO" %>
<%@ page import="bean.SmemberDTO" %>
    
<h1> delete.jsp</h1>    

<jsp:useBean class="bean.SmemberDTO" id="dto" />
<jsp:setProperty property="*" name="dto" /> 

<%	
	request.getParameter("num");
	SmemberDAO dao = new SmemberDAO();
	int result = dao.sMemberDelete(dto);
	if(result ==1) { %>
		 <script type="text/javascript">
			alert("삭제 되었습니다.");
			window.location = "/goworker/admin/admin_smember.jsp";
			
	</script>

	<%} %>
