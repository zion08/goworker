<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "smember.comment.bean.Comment_SmemberDAO" %>
<%@ page import = "smember.comment.bean.Comment_SmemberDTO" %>
  
  <% request.setCharacterEncoding("UTF-8"); %>
  
<jsp:useBean class= "smember.comment.bean.Comment_SmemberDTO"  id="cdto" />
<jsp:setProperty property="*" name="cdto" />


 <%
 
	String pageNum = request.getParameter("pageNum");

 	Comment_SmemberDAO cdao = new Comment_SmemberDAO();
 	int result = cdao.updateComment(cdto);
 	 
 
 if(result == 1){%>
 <script>
 	alert("수정되었습니다.");
 	window.location="/goworker/s-member/s-member_detail.jsp?num=<%=cdto.getBoard_num()%>&pageNum=<%=pageNum%>";
 </script>
 <%}else{ %>
 <script>
 	alert("글이 입력되지 않았습니다. 확인부탁드립니다.");
 	history.go(-1);
 </script>
 
 <%}%>