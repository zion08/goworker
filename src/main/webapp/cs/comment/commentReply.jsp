<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.Comment_CsDAO" %>
<%@ page import = "bean.Comment_CsDTO" %>
    
<%request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean class= "bean.Comment_CsDTO"  id="cdto" />
<jsp:setProperty property="*" name="cdto" />   
    
<%	
	String pageNum = request.getParameter("pageNum");
	
	String sid = (String)session.getAttribute("sid");

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
			<td width="50" align="center">작성자</td>
			<td width="300px" colspan=3 align="center">
				<%=sid %><input type="hidden" name="comment_writerid" value="<%=sid%>"/>
			</td>
		</tr>
		<tr>	
			<td width="50px" align="center">내 용</td>
			<td width="300px" colspan=3 align="center">
			<input type="text" size="100" name="comment_content" id="comment_content" style="width:500px;height:100px;"  placeholder="답글을 작성해주세요."  required;></td>
			
		</tr>
		<tr>
			<td colspan=2 align="center">
				<input type="submit" value="답글작성"/>
				<input type="reset" value="다시작성" />
			</td>
		</tr>
		</table><br/>
		
	
		
</form>


