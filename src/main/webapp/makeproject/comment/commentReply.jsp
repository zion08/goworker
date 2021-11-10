<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.MakeProject_CommentDAO" %>
<%@ page import = "bean.MakeProject_CommentDTO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="bean.MakeProject_CommentDTO" id="cdto" />
<jsp:setProperty property="*" name="cdto" />


<%
	String pageNum = request.getParameter("pageNum");

	String id = (String)session.getAttribute("id");
%>

<form action ="commentReplyPro.jsp" name="commentreplyform" method="post">
	<input type="hidden" name="num" value="<%=cdto.getNum() %>" />
	<input type="hidden" name="comment_num" value="<%=cdto.getComment_num() %>" />
	<input type="hidden" name="ref" value="<%=cdto.getRef() %>" />
	<input type="hidden" name="re_step" value="<%=cdto.getRe_step() %>" >
	<input type="hidden" name="re_level" value="<%=cdto.getRe_level() %>" />
	
	<table class="comments" border="1" align="center">
		<tr>
			<th colspan="2">대댓글 작성</th>
		</tr>
		<tr>
			<td width="50" align="center">아이디</td>
			<td width="300px" colspan="2" >
				<%=id %>
			</td>
		
		</tr>
		<tr>	
			<td width="50px" align="center">내 용</td>
			<td width="300px" colspan=3 align="center">
			<input type="text" size="100" name="comment_content" id="comment_content" style="width:500px;height:100px;" placeholder="댓글을 입력해주세요."></td>
		</tr>
		<tr>
			<td colspan=2 align="center">
				<input type="submit" value="답글작성완료"/>
				<input type="reset" value="다시 작성"/>
			</td>
		</tr>
		</table><br/>
</form>