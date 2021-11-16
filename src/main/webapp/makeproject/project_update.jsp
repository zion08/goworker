<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.MakeProjectDTO" %>
<%@ page import = "bean.MakeProjectDAO" %>

<%@ page import = "bean.MakeProject_CommentDTO" %>
<%@ page import = "bean.MakeProject_CommentDAO" %>

<%@ include file = "../include/header.jsp" %>

<%@ page import = "java.text.SimpleDateFormat" %>

<%request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean class= "bean.MakeProjectDTO"  id="dto" />
<jsp:setProperty property="*" name="dto" />


<style>
	textarea {
		font-size:17px;
}
</style>



<%	
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	MakeProjectDAO dao = new MakeProjectDAO();
	dto = dao.getMakeProject(dto);
	
	
	MakeProject_CommentDAO cd = new MakeProject_CommentDAO();	
	int comment_count = 0;
	int board_num = dto.getNum();
	comment_count = cd.getCommentCount(board_num);
%>    
	<form action="project_updatePro.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
		<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
		
<center>	
	<table border = "1" align="center">
		<tr>
			<td colspan="3" align="center"  width="700px"><b>프로젝트 신청 글 수정</b></td>
		</tr>
		<tr>
			<td align="center" width="50px"><img src="/goworker/s-member/image/image.jpg" width="40px" height="40px"/><br/>
						<%=dto.getId() %><input type="hidden" name="id" value="<%=dto.getId()%>"> 
			</td>
			<td align="center" width="150px">
				<%=sdf.format(dto.getReg_date())%>
			</td>
			<td align="right" width="100px">
					<img src="/goworker/makeproject/image/view.png" width="20px" height="20px" /><%=dto.getReadcount()%>&emsp;
        			<img src="/goworker/makeproject/image/comment.png" width="20px" height="20px" /><%=comment_count %>&emsp;
        			<img src ="/goworker/makeproject/image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>&emsp;
        			<img src ="/goworker/makeproject/image/thumbs_down.png" width="20px" height="20px"/><%=dto.getDown() %>
        	</td>
		</tr>
		<tr>
			<td align="center" width="150px">제목</td>
			<td colspan="2"><input type="text" size="80px" name="subject" value="<%=dto.getSubject() %>"/></td>
		</tr>
		<tr>	
			<td align="center" width="150px">내 용</td>
			<td colspan="2">
			<textarea name="content" id="contenet"  maxlength="2000px" cols="60px" rows="20px" style="resize: none;" ><%=dto.getContent() %></textarea></td>
		</tr>
				<td align="center" width="150px">첨부파일</td>
			<%if(dto.getProjectfile() != null){ %>
				<td colspan="2">
					<img src="/goworker/makeproject/<%=dto.getProjectfile() %>"width="500px"height="500px"/><br/>
					<input type="file" name="projectfile"/>
				</td>
			<%}else{ %>
				<td colspan="2">등록된 첨부파일이 없습니다. 파일을 첨부해주세요.<br/>
								<input type="file" name="projectfile"/></td>
				<%} %>
		</tr>
			<td colspan="3" align="center">
				<input type="submit" value="수정하기" />
				<input type="reset" value="다시작성" />
			</td>
		<tr>
		</tr>
	</table>
</center>
	
	
</form>
