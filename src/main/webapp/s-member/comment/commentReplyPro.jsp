<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "smember.comment.bean.Comment_SmemberDAO" %>
<%@ page import = "smember.comment.bean.Comment_SmemberDTO" %>
  
  <% request.setCharacterEncoding("UTF-8"); %>
  
<jsp:useBean class= "smember.comment.bean.Comment_SmemberDTO"  id="cdto" />
<jsp:setProperty property="*" name="cdto" />


 <%
	String pageNum = request.getParameter("pageNum");

	Comment_SmemberDAO dao = new Comment_SmemberDAO();
	int result = dao.insertComment(cdto);
 %>
<script>
	alert("댓글이 작성되었습니다.");
	window.location="/goworker/s-member/s-member_detail.jsp?num=<%=cdto.getBoard_num()%>&pageNum=<%=pageNum%>";
</script>
