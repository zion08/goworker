<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDTO" %>    
<%@ page import = "smember.comment.bean.Comment_SmemberDAO"%>
<%@ page import = "java.sql.Timestamp"%>

<jsp:useBean id="cdto"  class="smember.comment.bean.Comment_SmemberDTO"/>
<jsp:setProperty property="*" name="cdto" />

<% request.setCharacterEncoding("UTF-8");
	
	String comment_writerid = request.getParameter("comment_writerid");
	String comment_content = request.getParameter("comment_content");
	String num = request.getParameter("num");
	int board_num = Integer.parseInt(num);
	
	cdto.setComment_writerid(comment_writerid);
	cdto.setComment_content(comment_content);
	cdto.setBoard_num(board_num);

	
	Comment_SmemberDAO dao = new Comment_SmemberDAO();
	int result = dao.insertComment(cdto);
	
	
if(result == 1){%>
	<script >
			alert("댓글이 등록되었습니다.");
			window.location ='/goworker/s-member/s-member_detail.jsp?num=<%=num%>';
	</script>
<%}else{%>
<script >
	alert("입력이 잘못 되었습니다. 확인부탁드립니다.");
	history.go(-1);
</script> 
	<%}%> 

	
	