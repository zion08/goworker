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

<form action="commentUpdatePro.jsp" method="post">
		<input type="hidden" name="comment_num" value="<%=cdto.getComment_num()%>"/>
		<input type="hidden" name="board_num" value="<%=cdto.getBoard_num() %>"/>
		<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
		
	  작성자: <input type="text" size="20"  name="comment_writerid" value="<%=cdto.getComment_writerid() %>" > <br/><br/>
	  내 용: <input type="text" size="150" name="comment_content" value="<%=cdto.getComment_content() %>" required><br/>
			<input type="submit" value="수정완료"/>
</form>