<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "smember.comment.bean.Comment_SmemberDAO" %>
    <%@ page import = "smember.comment.bean.Comment_SmemberDTO" %>
    
<%request.setCharacterEncoding("UTF-8"); %>    
    
<jsp:useBean class= "smember.comment.bean.Comment_SmemberDTO"  id="cdto" />
<jsp:setProperty property="*" name="cdto" />

<%

	String pageNum = request.getParameter("pageNum");
	
%>

<form action="commentDeletePro.jsp" method="post">
	<input type="hidden" name="comment_num" value="<%=cdto.getComment_num() %>" />
	<input type="hidden" name="pageNum" value="<%=pageNum%>" />
	<input type="submit" value="삭 제" />
</form>