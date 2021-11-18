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
 	int result = dao.updateComment(cdto);
 	 
 
 if(result == 1){%>
 <script>
 	alert("수정되었습니다.");
 	opener.document.location.reload();
	self.close();
</script>
 <%}else{ %>
 <script>
 	alert("입력이 잘못 되었습니다. 확인부탁드립니다.");
 	history.go(-1);
 </script>
 
 <%}%>