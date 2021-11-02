<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "smember.comment.bean.Comment_SmemberDAO" %>
<%@ page import = "smember.comment.bean.Comment_SmemberDTO" %>
    
<%request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean class= "smember.comment.bean.Comment_SmemberDTO"  id="cdto" />
<jsp:setProperty property="*" name="cdto" />


 <%	
	String pageNum = request.getParameter("pageNum");
   
	
	Comment_SmemberDAO dao = new Comment_SmemberDAO();
	cdto = dao.getComment(cdto);
	
	
%>
<h3>댓글 수정창</h3>
<form action="commentUpdatePro.jsp" method="post">
		<input type="hidden" name="comment_num" value="<%=cdto.getComment_num()%>"/>
		<input type="hidden" name="board_num" value="<%=cdto.getBoard_num() %>"/>
		<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
		<label for="comment_writerid">작성자: </label> 	
		<input type="text" size="20"  name="comment_writerid" id="comment_writerid" value="<%=cdto.getComment_writerid() %>" > <br/><br/>
 	 	<label for="comment_content">내용: </label>
		<input type="text" size="100" name="comment_content" id="comment_content" style="width:500px;height:100px;"  value="<%=cdto.getComment_content() %>"><br/><br/>	

			<input type="submit" value="수정완료"/>
</form>