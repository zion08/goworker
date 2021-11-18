<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "bean.MakeProjectDTO" %>
<%@ page import = "bean.MakeProjectDAO" %>

<%@ page import = "bean.MakeProject_CommentDTO" %>
<%@ page import = "bean.MakeProject_CommentDAO" %>

<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %> 

<%@ page import = "bean.MemberDAO" %>

<%@ include file = "../include/header.jsp" %>



<jsp:useBean class = "bean.MakeProjectDTO" id= "dto" />
<jsp:setProperty property="*" name="dto" />  

<style>
	textarea {
		font-size:17px;
}
</style>


<%
 	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	
	MakeProjectDAO dao = new MakeProjectDAO();
	dao.readCountUp(dto);
	dto = dao.getContent(dto);
		
	
	
	MakeProject_CommentDAO cd = new MakeProject_CommentDAO();	
	int comment_count = 0;
	int board_num = dto.getNum();
	
	comment_count = cd.getCommentCount(board_num);

	MemberDAO mdao = new MemberDAO();
	String result = mdao.getRank(dto.getId());
	
%>
<section class="section1" >

	<title>프로젝트 detail 페이지</title>


		<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
		<input type="hidden" name='pageNum' value="<%=pageNum %>"/>


	<table border=1  align="center" >
			<tr>
				<td align="center" colspan="3" width="700px" ><b>Make Project invitation</b></td>
			</tr>
			<tr>
				<td align="center" width="50px" height="70px"   align="center">
				
<%			if(result != null){ %>
<%				if(result.equals("admin")){%>	
				<img src="/goworker/makeproject/image/admin.jpg"  width="40px" height="40px" /></br>	
				<%} %>
<%				if(result.equals("manager")){%>				
				<img src="/goworker/makeproject/image/manager.jpg"  width="40px" height="40px" /></br/>
					<%} %>
<%		  		if(result.equals("member")){ %>
				<img src="/goworker/makeproject/image/image.jpg" width="40px" height="40px"/><br/>
					<% }
        		}%>
						<%=dto.getId() %><input type="hidden" name="id" value="<%=dto.getId()%>">
				</td>
				<td align="center" width="150px">
					<%=sdf.format(dto.getReg_date()) %>
				</td>
				<td align="center" width="110px">
						<img src="/goworker/makeproject/image/view.png" width="25px" height="25x"/><%=dto.getReadcount()%> &emsp;
						<img src="/goworker/makeproject/image/comment.png" width="25px" height="25px" /><%=comment_count %> &emsp;
        				<img src ="/goworker/makeproject/image/thumbs.png" width="25px" height="25px" /><%=dto.getGood() %>&emsp;
        				<img src ="/goworker/makeproject/image/thumbs_down.png" width="25px" height="25px" /><%=dto.getDown() %>
        		</td>
			</tr>
			<tr>
				<td align="center"  width="90px" height="4">제목</td>
				<td  colspan="2" align="center" style="font-size:18px"><b><%=dto.getSubject() %></b></td>
			</tr>
			<tr>
				<td align="center" width="90px">내 용</td>
				<td colspan="2" >
				<textarea name="content" id="contenet"  maxlength="2000px"  cols="67" rows="20"  style="resize: none;"  readonly><%=dto.getContent() %></textarea>
		
				</td>
			</tr>
			<tr>
				<td align="center" width="90px">첨부파일</td>
					<%if(dto.getProjectfile() != null){ %>
						<td colspan="2" align="center">
						<img src="/goworker/makeproject/<%=dto.getProjectfile() %>"width="600px"height="600px">

					<%}else{ %>
				<td colspan="2">등록된 첨부파일이 없습니다.</td>
					<%} %>
			</tr>
	
<% if(sid !=null) {
	
if(sid.equals(dto.getId())) { %>
            <tr>
            	<td align="center" colspan="3">
               	 <form action="/goworker/makeproject/project_delete.jsp?num=<%=dto.getNum()%>"  method="post" >
                   	 <input type="hidden" name="num" value="<%=dto.getNum() %>"/>
                   	 <input type="button" value="수정" onclick="window.location='/goworker/makeproject/project_update.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum %>'"/>
                     <input type="submit" value="삭제" onclick="project_removeCheck()"/>
                     <input type="button" value="목록" onclick="window.location='/goworker/makeproject/project_list.jsp'"/>
                </form>
                </td>
            </tr>
<%} else { %>
    <tr>
    	 <td align="center" colspan="3">
                    <input type="button" value="추천!" onclick="window.open('project_Good.jsp?num=<%=dto.getNum()%>','Good','width=300,height=150');window.location.reload();"/>
                    <input type="button" value="비추천!" onclick="window.open('project_Down.jsp?num=<%=dto.getNum()%>','Down','width=300,height=150');window.location.reload();"/><br/>
       				<input type="button" value="목록" onclick="window.location='/goworker/makeproject/project_list.jsp'"/>
       	</td>
    </tr>
    <%} 
}  %>
    </table><br/>
</section>



<!-- 댓글 작성 폼 -->
<%
	int comment_num=0, comment_ref=1, comment_step=0, comment_level=0;
	if(request.getParameter("comment_num") != null){
		comment_num=Integer.parseInt(request.getParameter("comment_num"));
		comment_ref=Integer.parseInt(request.getParameter("comment_ref"));
		comment_step=Integer.parseInt(request.getParameter("comment_step"));
		comment_level=Integer.parseInt(request.getParameter("comment_level"));
	}
	
%>
	

<section class="section1" >


	<table   align="center">
			<tr>
				<td align="left" colspan="3" width="700px">
				<h3>▶ 관심있어요</h3>
				위 프로젝트에 관심있는 분은 댓글을 남겨주세요.</td>
			</tr>
			
		</table>

	
	<form action="/goworker/makeproject/comment/commentPro.jsp" name="commentform" method="post">
		<input type="hidden" name="board_num" value="<%=dto.getNum()%>"/>
		<input type="hidden" name="comment_num" value="<%=comment_num %>"/>
		<input type="hidden" name="comment_ref" value="<%=comment_ref %>" />
		<input type="hidden" name="comment__step" value="<%=comment_step %>" />
		<input type="hidden" name="comment_level" value="<%=comment_level %>" />
		<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
		
		
		<table class="comments" width="700px" align="center" border="1">
<%
		if(sid == null){
%>
		<tr>
			<td width="400px" colspan="3" align="center">
			댓글은 회원만 작성이 가능합니다.<br/>
			로그인 후, 이용 부탁드립니다.</td>
		</tr>
		<%}else{%>
			<tr>
				<td width="90px" align="center">작성자</td>
				<td width="400px" colspan="3" align="center">
					<%=sid %><input type="hidden" name="comment_writerid" value="<%=sid%>"/>
				</td>	
			</tr>
			<tr>
				<td width="90px" align="center">내 용</td>
				<td width="400px" colspan="3" >
					<input type="text" size="120" name="comment_content" style="width:618px;height:100px;" placeholder="댓글을 입력해주세요." required></td>
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
 
 
 <section class="section1" >
 
 <table class="comments" border="1" width="705px" align="center">
 
 	
 	<tr>
 		<td width="60px" align="center">작성자</td>
 		<td width="300px" align="center">내용</td>
 		<td width="80px" align="center">작성일</td>
 		<td width="40px" align="center">버튼</td>
 	</tr>
 	
<%
		if(count > 0){
			for(MakeProject_CommentDTO cdto : list) {
%>	
	
	<tr>
		<td align="center">
<%			if(result != null){ %>
<%			if(result.equals("admin")){%>	
				<img src="/goworker/makeproject/image/admin.jpg"  width="40px" height="40px" /></br>	
				<%} %>
<%			if(result.equals("manager")){%>				
				<img src="/goworker/makeproject/image/manager.jpg"  width="40px" height="40px" /></br/>
				<%} %>
<%		  	if(result.equals("member")){ %>
				<img src="/goworker/makeproject/image/image.jpg" width="40px" height="40px"><br/>
				<% }
        	}%>
				<%=cdto.getComment_writerid()%><input type="hidden" name="comment_writerid" value="<%=cdto.getComment_writerid() %>" />
		</td>
		
		<td>
<%
		int wid=0;
		if(cdto.getComment_level() > 0){
			wid=10*(cdto.getComment_level());
%>			<img src="/goworker/makeproject/image/white.jpg" width="<%=wid %>" height="16">
			<img src="/goworker/makeproject/image/re.gif">
<%		}else{
%>			<img src="/goworker/makeproject/image/white.jpg" width="<%=wid %>" height="16">
<%		}
%>			<%=cdto.getComment_content() %>	
		</td>
		
		<td align="center" >
			<%=sdf.format(cdto.getComment_regdate()) %>
		</td>		
		
		
<% if(sid !=null) {
if(sid.equals(cdto.getComment_writerid())) { %>			
				
		<td align="center" >	

	
			<form action="/goworker/makeproject/comment/commentDelete.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref() %>"  method="post" >
				<input type="button" value="수정" onclick="window.open('/goworker/makeproject/comment/commentUpdate.jsp?comment_num=<%=cdto.getComment_num()%>','update','width=800,height=300');"/>
				<input type="submit" value="삭제" onclick="comment_removeCheck()" /> 
				<input type="button" value="답글" onclick="window.open('/goworker/makeproject/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&page=<%=pageNum %>','reply','width=600,height=300');" />
				
				<%}else{%>
				
				<td align="center">
				<input type="button" value="답글" onclick="window.open('/goworker/makeproject/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&page=<%=pageNum %>','reply','width=600,height=300');" />
				</td>
			</form>
		</td>
	</tr>
	<tr>
 		<td width="30px" align="center" colspan="4" style="font-size: 12px">
 			<img src="/goworker/makeproject/image/bestcomment.png" width="30" height="30" onclick="window.open('/goworker/makeproject/comment/commentGood.jsp?comment_num=<%=cdto.getComment_num() %>','Good','width=300,height=150'); window.location.reload();" align="center"/>
 			를 꾸~욱! 눌러주세요!  <b style="font-size:15px"> [<%=cdto.getComment_good() %>]</b>
 		</td>
 	</tr>
 	<%}
}%>

	<%}
	}
}%>
 </table><br/>
 
</section> 
 
 
 
 <footer>
	<hr color="skyblue" size="2"  align="center" />





<table width="500" align="right">
      
      <thead align="center">
        <tr>
          <th></th>
          <th>메인</th>
          <th>회원</th>
          <th>고객센터</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>사이트소개</td>
          <td><a href="/goworker/s-member/s-member.jsp">팀원찾기</a></td>
          <td>회원가입</td>
          <td>공지사항</td>
          
        </tr>
        <tr>
          <td>이용방법</td>
          <td>프로젝트찾기</td>
          <td>회원정보수정</td>
          <td>Q&A</td>
        </tr>
        <tr>
          <td></td>
          <td>프로젝트만들기</td>
          <td>회원탈퇴</td>
          <td></td>
        </tr>
        <tr>
            <td></td>
            <td>취업정보</td>
            <td></td>
            <td></td>
          </tr>
        <tr>
          <td></td>
          <td>커뮤니티</td>
          <td></td>
          <td></td>
        </tr>
      </tbody>
      
    </table>
</footer>
 

 <script>
 	function project_removeCheck(){
 		if(confirm("삭제 시, 복구가 되지 않습니다. \n 정말로 삭제하시겠습니까??") == true){
 			document.form.submit();
 			window.location='/goworker/makeproject/project_delete.jsp';
 		}
 	}
 	
 	function comment_removeCheck(){
 		if(confirm("삭제 시, 복구가 되지 않습니다. \n 정말로 삭제하시겠습니까??") == true) {
 			document.form.submit;
 			window.location='/goworker/makeproject/comment/commentDelete.jsp';
 			}
 	}
 	

 </script>

 
 
 
 