<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "bean.Comment_SprojectDAO" %>
<%@ page import = "bean.Comment_SprojectDTO" %>

<%request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class= "bean.Comment_SprojectDTO"  id="cdto" />
<jsp:setProperty property="*" name="cdto" />

<%
	String pageNum = request.getParameter("pageNum");
	
	Comment_SprojectDAO dao = new Comment_SprojectDAO();
	cdto = dao.getComment(cdto);
	

%>

<form action="commentUpdatePro.jsp" method="post" >
	<input type="hidden" name="comment_num" value="<%=cdto.getComment_num()%>"/>
		<input type="hidden" name="board_num" value="<%=cdto.getBoard_num() %>"/>
		<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
		
			<table class="comments" border=1>
		<tr>
			<th width="50" align="center">작성자</th>
			<th width="300px" colspan=3 align="center">
				<%=cdto.getComment_writerid() %><input type="hidden" name="comment_writerid" value="<%=cdto.getComment_writerid() %>" />
			</th>
		
		</tr>
		<tr>	
			<td width="50px" align="center">내 용</td>
			<td width="300px" colspan=3 align="center">
			<input type="text" size="100" name="comment_content" id="comment_content" style="width:500px;height:100px;" value="<%=cdto.getComment_content() %>"></td>
		</tr>
		<tr>
			<td colspan=2 align="center">
				<input type="submit" value="수정완료"/>
				<input type="reset" value="다시 작성"/>
			</td>
		</tr>
		</table><br/>
		
</form>