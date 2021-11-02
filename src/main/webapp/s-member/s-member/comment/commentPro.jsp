<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDTO" %>    
<%@ page import = "smember.comment.bean.Comment_SmemberDAO"%>
<%@ page import = "java.sql.Timestamp"%>

<%request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="cdto"  class="smember.comment.bean.Comment_SmemberDTO"/>
<jsp:setProperty property="*" name="cdto" />

<% 	
	String pageNum = request.getParameter("pageNum");

	Comment_SmemberDAO dao = new Comment_SmemberDAO();
	int result = dao.insertComment(cdto);
	
	
if(result == 1){%>
	<script >
			alert("댓글이 등록되었습니다.");
			window.location ='/goworker/s-member/s-member_detail.jsp?num=<%=cdto.getBoard_num()%>&pageNum=<%=pageNum%>';
	</script>
<%}else{%>
<script >
	alert("입력이 되지 않았습니다. 확인부탁드립니다.");
	history.go(-1);
</script> 
	<%}%> 

	
	