<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.MakeProjectDTO" %>
<%@ page import = "bean.MakeProjectDAO" %>
<%@ page import = "bean.MakeProject_CommentDTO" %>
<%@ page import = "bean.MakeProject_CommentDAO" %>
<%@ page import = "bean.MemberDAO" %>

<%@ include file = "../include/header.jsp" %>

<%@ page import = "java.text.SimpleDateFormat" %>

<%request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean class= "bean.MakeProjectDTO"  id="dto" />
<jsp:setProperty property="*" name="dto" />


<style>
	textarea {
		font-size:15px;
	}
</style>



<%	
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	MakeProjectDAO dao = new MakeProjectDAO();
	dto = dao.getMakeProject(dto);
	
	
	// 댓글 수 관련
	MakeProject_CommentDAO cd = new MakeProject_CommentDAO();	
	int comment_count = 0;
	int board_num = dto.getNum();
	comment_count = cd.getCommentCount(board_num);
	
	
	// rank에 따른 프로필 사진 변경 메서드
	MemberDAO mdao = new MemberDAO();
	String result = mdao.getRank(dto.getId());
	
%>    



<title>프로젝트 수정 페이지</title>


<center>
	<br/>
	<h3>프로젝트 수정 페이지</h3>
	<br/>
	
	<form action="project_updatePro.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
			<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
			
		<table border = "1" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td align="center" width="50px" height="70px" align="center">
<%				if(result != null){ %>
<%					if(result.equals("admin")){%>	
						<img src="image/admin.jpg"  width="40px" height="40px" /><br/>	
					<%} %>
<%					if(result.equals("manager")){%>				
						<img src="image/manager.jpg"  width="40px" height="40px" /><br/>
					<%} %>
<%		  			if(result.equals("member")){ %>
						<img src="image/image.jpg" width="40px" height="40px" /><br/>
					<%}
				}%>
						<%=dto.getId() %><input type="hidden" name="id" value="<%=dto.getId()%>"> 
				</td>
				<td align="center" width="150px">
					<%=sdf.format(dto.getReg_date())%>
				</td>
				<td align="right" width="90px" align="center">
						<img src="/goworker/makeproject/image/view.png" width="20px" height="20px" /><%=dto.getReadcount()%>&emsp;
        				<img src="/goworker/makeproject/image/comment.png" width="20px" height="20px" /><%=comment_count %>&emsp;
        				<img src ="/goworker/makeproject/image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>&emsp;
        				<img src ="/goworker/makeproject/image/thumbs_down.png" width="20px" height="20px"/><%=dto.getDown() %>
        		</td>
			</tr>
			<tr>
				<td align="center" width="90px">제 목</td>
				<th colspan="2"><input type="text"  style="width:605px;height:30px;font-size:15px;" name="subject" value="<%=dto.getSubject() %>"/></th>
			</tr>
			<tr>	
				<td align="center" width="90px">내 용</td>
				<td colspan="2"><textarea name="content" id="contenet"  maxlength="2000px" cols="73px" rows="33px" style="resize: none;" ><%=dto.getContent() %></textarea>
				</td>
			</tr>
			<tr>
					<td align="center" width="90px">첨부파일</td>
				<%if(dto.getProjectfile() != null){ %>
					<td colspan="2">
						<img src="/goworker/makeproject/<%=dto.getProjectfile() %>"width="600px"height="500px"/><br/>
						<input type="file" name="projectfile"/>
					</td>
				<%}else{ %>
					<td colspan="2" style="font-size:13px">
						<input type="file" name="projectfile"/><br/>
						등록된 첨부파일이 없습니다. 파일을 첨부해주세요.
					</td>
				<%} %>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="submit" value="수정하기" />
					<input type="reset" value="다시작성" />
				</td>
			</tr>
		</table>
	</form>
</center><br/>

<%@ include file = "/include/footer.jsp" %>
