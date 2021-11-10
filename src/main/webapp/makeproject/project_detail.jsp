<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "bean.MakeProjectDTO" %>
<%@ page import = "bean.MakeProjectDAO" %>

<%@ page import = "bean.MakeProject_CommentDTO" %>
<%@ page import = "bean.MakeProject_CommentDAO" %>

<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %> 



<jsp:useBean class = "bean.MakeProjectDTO" id= "dto" />
<jsp:setProperty property="num" name="dto" />  

<%
 	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
	
	MakeProjectDAO dao = new MakeProjectDAO();
	dao.readCountUp(dto);
	dto = dao.getContent(dto);
%>

<title>프로젝트 detail 페이지</title>


<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
<input type="hidden" name='pageNum' value="<%=pageNum %>"/>


<table border=1  align="center">
	<tr>
		<th align="center" colspan="3" width="700px">Project 초대</th>
	</tr>
	<tr>
		<td align="center" width="70px"><img src="/goworker/s-member/image/image.jpg" width="30px" height="30px"/><br/>
						<%=dto.getId() %> 
		</td>
		<td align="center" width="150px">
			<%=dto.getReg_date() %>
		</td>
		<td align="right" width="100px">
				<img src="/goworker/s-member/image/view.png" width="20px" height="20px"/><%=dto.getReadcount()%> &emsp;
        		<img src ="/goworker/s-member/image/thumbs.png" width="20px" height="20px" /><%=dto.getGood() %>
        </td>
	</tr>
	<tr>
		<td align="center">제목</td>
		<td  colspan="2"><%=dto.getSubject() %></td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td colspan="2" width ="180px" height="200px"><%=dto.getContent() %></td>
	</tr>
	<tr>
		<td align="center">첨부파일</td>
		<%if(dto.getProjectfile() != null){ %>
			<td colspan="2" align="center">
			<img src="/goworker/makeproject/<%=dto.getProjectfile() %>"width="500px"height="500px">
		<%}else{ %>
			<td colspan="2">등록된 첨부파일이 없습니다.</td>
		<%} %>
	</tr>
	<tr>
		<td align="center" colspan="3">
			<input type="button" value="추천합니다!" onclick="window.open('project_Good.jsp?num=<%=dto.getNum()%>','Good','width=300,height=150');window.location.reload();"/>
			<input type="button" value="메일보내기" onclick="window.location='/goworker/s-member/email/mail.jsp?pageNum=<%=pageNum%>'"/>
			<input type="button" value="수정" onclick="window.location='/goworker/makeproject/project_update.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum %>'"/>
			<input type="button" value="삭제" onclick="window.location='/goworker/makeproject/project_delete.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum %>'"/>
			<input type="button" value="목록" onclick="window.location='/goworker/makeproject/project_list.jsp'"/>
		</td>
		
	</tr>
</table><br/>



<!-- 댓글 작성 폼 -->
<%
	int comment_num=0, ref=1, re_step=0, re_level=0;
	if(request.getParameter("comment_num") != null){
		comment_num=Integer.parseInt(request.getParameter("comment_num"));
		ref=Integer.parseInt(request.getParameter("ref"));
		re_step=Integer.parseInt(request.getParameter("re_step"));
		re_level=Integer.parseInt(request.getParameter("re_level"));
	}
	
	String id = (String)session.getAttribute("id");


%>

<section class="section1" align="center">
	<div class="titletext">
		<h3>관심있어요</h3>
	</div>
	
	<div class="smalltext">
		위 프로젝트에 관심있는 분은 댓글을 남겨주세요.<br/>
	</div>
	
	<form action="/goworker/makeproject/comment/commentPro.jsp" name="commentform" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
		<input type="hidden" name="comment_num" value="<%=comment_num %>"/>
		<input type="hidden" name="ref" value="<%=ref %>" />
		<input type="hidden" name="re_step" value="<%=re_step %>" />
		<input type="hidden" name="re_level" value="<%=re_level %>" />
		<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
		
		
		<table class="comments" width="700px" align="center" border="1">
			<tr>
				<td width="150px" align="center">아이디</td>
				<td width="400px" colspan="3">
					<%=id %>
				</td>	
			</tr>
			<tr>
				<td width="150px" align="center">내 용</td>
				<td width="400px" colspan="3" >
					<input type="text" size="120" name="comment_content" style="width:570px;height:100px;" placeholder="댓글을 입력해주세요."></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="댓글 작성"/>
					<input type="reset" value="다시 작성" />
			</tr>
		</table>
		
	</form> 
</section>



<!-- 댓글 리스트 -->
<%	
	MakeProject_CommentDAO cdao = new MakeProject_CommentDAO();
	int count = 0;
	List<MakeProject_CommentDTO> list = null;
		count = cdao.getCount(); // 전체 글의 갯수
		if(count > 0){
			list = cdao.getComment(dto.getNum());
		}
	
 %>
 
 <table class="comments" border="1" width="700px" align="center">
 	<tr>
 		<td width="30px" align="center"><img src="/goworker/makeprojet/image/bestcomment.png" ></td>
 		<td width="100px" align="center">아이디</td>
 		<td width="300px" align="center">내용</td>
 		<td width="80px" align="center">작성일</td>
 		<td width="50px" align="center">버튼</td>
 	</tr>
 	
<%
	if(count > 0){
		for(MakeProject_CommentDTO cdto : list) {
%>	

	<tr>
		<td align="center">
			<img src="/goworker/s-member/image/image.jpg" width="50" height="50"><br/>
				<%=id %>
		</td>
		
		<td>
<%
		int wid=0;
		if(cdto.getRe_level() > 0){
			wid=10*(cdto.getRe_level());
%>			<img src="/goworker/s-member/image/white.jpg" width="<%=wid %>" height="16">
			<img src="/goworker/s-member/image/re.gif">
<%		}else{
%>			<img src="/goworker/s-member/image/white.jpg" width="<%=wid %>" height="16">
<%		}
%>			<%=cdto.getComment_content() %>	
		</td>
		
		<td align="center">
			<%=sdf.format(cdto.getComment_regdate()) %>
		</td>
		<td align="center">
			<input type="button" value="수정" onclick="window.location='/goworker/makeproject/comment/commentUpdate.jsp?comment_num=<%=cdto.getComment_num() %>&num=<%=dto.getNum() %>&pageNum=<%=pageNum %>'" />
			<input type="button" value="삭제" onclick="window.location='/goworker/makeproject/comment/commentDelete.jsp?comment_num=<%=cdto.getComment_num() %>&num=<%=dto.getNum() %>&pageNum=<%=pageNum %>'" /> 
			<input type="button" value="답글" onclick="window.location='/goworker/makeproject/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&num=<%=dto.getNum() %>&Ref=<%=cdto.getRef()%>&re_step=<%=cdto.getRe_step()%>&re_level=<%=cdto.getRe_level()%>&pageNum=<%=pageNum%>'" />
		</td>
	</tr>
	<%}
}%>
 </table>
 
 