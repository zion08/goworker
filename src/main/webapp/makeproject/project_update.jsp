<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.MakeProjectDTO" %>
<%@ page import = "bean.MakeProjectDAO" %>

<%@ page import = "java.text.SimpleDateFormat" %>

<%request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean class= "bean.MakeProjectDTO"  id="dto" />
<jsp:setProperty property="*" name="dto" />

<%	
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	MakeProjectDAO dao = new MakeProjectDAO();
	dto = dao.getMakeProject(dto);
%>    

	<form action="project_updatePro.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
		<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
		
	<table border = "1" align="center">
		<tr>
			<th colspan="3" align="center" >프로젝트 신청 글 수정</th>
		</tr>
		<tr>
			<td align="center" width="70px"><img src="/goworker/s-member/image/image.jpg" width="30px" height="30px"/><br/>
						<%=dto.getId() %> 
			</td>
			<td align="center" width="150px">
				<%=sdf.format(dto.getReg_date())%>
			</td>
			<td align="right" width="100px">
				<img src="/goworker/makeproject/image/view.png" width="20px" height="20px"/><%=dto.getReadcount()%> &emsp;
        		<img src ="/goworker/makeproject/image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>
        	</td>
		</tr>
		<tr>
			<td align="center">제목</td>
			<td colspan="2"><input type="text" size="70" name="subject" value="<%=dto.getSubject() %>"/></td>
		</tr>
		<tr>	
			<td align="center">내 용</td>
			<td colspan="2"><input type="text" maxlength="2000px" style="width:500px;height:200px" name="content"  value="<%=dto.getContent() %>"></td>
		</tr>
		<tr>
				<td align="center">첨부파일</td>
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
</form>