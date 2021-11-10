<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.Comment_SmemberDAO" %>
<%@ page import = "bean.Comment_SmemberDTO" %>
    
 <%request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean class= "bean.Comment_SmemberDTO"  id="cdto" />
<jsp:setProperty property="*" name="cdto" /> 

<%
	String pageNum = request.getParameter("pageNum");
	Comment_SmemberDAO dao = new Comment_SmemberDAO();
	String result = dao.deleteComment(cdto.getComment_num());
	
	
%>

<script>
	alert("삭제되었습니다.");
	window.location='/goworker/s-member/s-member_detail.jsp?num=<%=cdto.getBoard_num()%>&pageNum=<%=pageNum%>';
</script>