<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SprojectDAO" %>
<%@ page import="bean.SprojectDTO" %>
    
<h1> delete.jsp</h1>    

<jsp:useBean class="bean.SprojectDTO" id="dto" />
<jsp:setProperty property="*" name="dto" /> 

<%	
	request.getParameter("num");
	SprojectDAO dao = new SprojectDAO();
	int result = dao.sProjectDelete(dto);
	if(result ==1) { %>
		 <script type="text/javascript">
			alert("삭제 되었습니다.");
			window.location ="/goworker/s-project/s-project.jsp";
			
	</script>

	<%} %>