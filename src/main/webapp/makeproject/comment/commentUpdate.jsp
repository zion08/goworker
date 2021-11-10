<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ page import = "bean.MakeProject_CommentDAO" %>
<%@ page import = "bean.MakeProject_CommentDTO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="bean.MakeProject_CommentDTO" id="cdto" />
<jsp:setProperty property="*" name="cdto" />


<%
	String pageNum = request.getParameter("pageNum");

	MakeProject_CommentDAO cdao = new MakeProject_CommentDAO();
	cdto = cdao.getComment(cdto);
	
	String id = (String)session.getAttribute("id");

%>

<form action="/goworker/makeproject/comment/commentUpdatePro.jsp" method="post" >
	<input type="hidden" name="num" value="<%=cdto.getNum() %>" />
	<input type="hidden" name="comment_num" value="<%=cdto.getComment_num() %>" />
	<input type="hidden" name="pageNum" value="<%=pageNum %>" />
	
		<table class="comments" width="700px" align="center" border="1">
			<tr>
				<th colspan="2">댓글 수정</th>
			</tr>
			<tr>
				<td width="150px" align="center">아이디</td>
				<td width="400px" colspan="2">
					<%=id %>
				</td>	
			</tr>
			<tr>
				<td width="150px" align="center">내 용</td>
				<td width="400px" colspan="3" >
					<input type="text" size="120" name="comment_content" style="width:570px;height:100px;" value="<%=cdto.getComment_content() %>">
				</td>		
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정완료"/>
					<input type="reset" value="다시 작성" />
				</td>
			</tr>	
	</table>
</form>