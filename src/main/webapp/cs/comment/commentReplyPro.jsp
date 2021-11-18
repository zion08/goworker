<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.Comment_CsDAO" %>
<%@ page import = "bean.Comment_CsDTO" %>
  
  <% request.setCharacterEncoding("UTF-8"); %>
  
<jsp:useBean class= "bean.Comment_CsDTO"  id="cdto" />
<jsp:setProperty property="*" name="cdto" />


 <%
	String pageNum = request.getParameter("pageNum");

	Comment_CsDAO dao = new Comment_CsDAO();
	int result = dao.insertComment(cdto);
 %>
<script>
	alert("답글이 작성되었습니다.");
	opener.document.location.reload();
	self.close();
</script>
