<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.Comment_SmemberDAO" %>
<%@ page import = "bean.Comment_SmemberDTO" %>
    
<%request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean class= "bean.Comment_SmemberDTO"  id="cdto" />
<jsp:setProperty property="*" name="cdto" />   
    
<%	
	String pageNum = request.getParameter("pageNum");

%>

    
<form action="commentReplyPro.jsp" name="commentreplyform" method="post">
	<input type="hidden" name="board_num" value="<%=cdto.getBoard_num() %>"/>
	<input type="hidden" name="comment_num" value="<%=cdto.getComment_num()%>"/>
	<input type="hidden" name="comment_ref" value="<%=cdto.getComment_ref()%>">
	<input type="hidden" name="comment_step" value="<%=cdto.getComment_step()%>">
	<input type="hidden" name="comment_level" value="<%=cdto.getComment_level()%>">
	<input type="hidden" name="pageNum" value="<%=pageNum %>"/>

<table class="comments" border=1>
		<tr>
			<th width="50" align="center">작성자</th>
			<th width="300px" colspan=3 align="center">
			<input type="text" size="70"  name="comment_writerid" id="comment_writerid"  > </th>
		
		</tr>
		<tr>	
			<td width="50px" align="center">내 용</td>
			<td width="300px" colspan=3 align="center">
			<input type="text" size="100" name="comment_content" id="comment_content" style="width:500px;height:100px;"  placeholder="답글을 작성해주세요."></td>
			
		</tr>
		<tr>
			<td colspan=2 align="center">
				<input type="submit" value="답글작성"/>
				<input type="reset" value="다시작성" />
			</td>
		</tr>
		</table><br/>
		
	
		
</form>


