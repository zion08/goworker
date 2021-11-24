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

<link href="style.css" rel="stylesheet" type="text/css">


<jsp:useBean class = "bean.MakeProjectDTO" id= "dto" />
<jsp:setProperty property="*" name="dto" />  

<% request.setCharacterEncoding("UTF-8"); %>


<title>프로젝트 페이지</title>
<h2>프로젝트 페이지</h2>



<%	if (sid == null) {
%>		<script>
			location.href="../member/login.jsp";
		</script> 
<%	} else {
	
		String pageNum = request.getParameter("pageNum");
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	
		MakeProjectDAO dao = new MakeProjectDAO();
		dao.readCountUp(dto);
		dto = dao.getContent(dto);
		
	
		// 댓글 수 관련
		MakeProject_CommentDAO cd = new MakeProject_CommentDAO();	
		int comment_count = 0;
		int board_num = dto.getNum();
		comment_count = cd.getCommentCount(board_num);
	
	
	
		// rank에 따른 프로필 사진 변경 메서드
		MemberDAO mdao = new MemberDAO();
		String result = mdao.getRank(dto.getId());
	
	
		// 코멘트 관련
		int comment_num=0, comment_ref=1, comment_step=0, comment_level=0;
		if(request.getParameter("comment_num") != null){
			comment_num=Integer.parseInt(request.getParameter("comment_num"));
			comment_ref=Integer.parseInt(request.getParameter("comment_ref"));
			comment_step=Integer.parseInt(request.getParameter("comment_step"));
			comment_level=Integer.parseInt(request.getParameter("comment_level"));
		}
	
	
		// 댓글 리스트
		MakeProject_CommentDAO cdao = new MakeProject_CommentDAO();
		int count = 0;
		List<MakeProject_CommentDTO> list = null;
	
		count = cdao.getCount(); // 전체 글의 갯수
		if(count > 0){
			list = cdao.getComment(dto.getNum());
		}
	
%>


<section class="section1" >
		<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
		<input type="hidden" name='pageNum' value="<%=pageNum %>"/>


	<table border=1 >
			<tr>
				<td align="center" width="50px" height="70px"   align="center">
				
<%			if(result != null){
				if(result.equals("admin")){
%>	
					<img src="image/admin.jpg"  width="40px" height="40px" /><br/>	
<%				}
%>
<%				if(result.equals("manager")){
%>				
					<img src="image/manager.jpg"  width="40px" height="40px" /><br/>
<%				}
%>
<%		  		if(result.equals("member")){
%>
					<img src="image/image.jpg" width="40px" height="40px" /><br/>
<%				}
        	}
%>
					<%=dto.getId() %><input type="hidden" name="id" value="<%=dto.getId()%>">
				</td>
				<td align="center" width="150px">
					<%=sdf.format(dto.getReg_date()) %>
				</td>
				<td align="center" width="110px" align="center">
						<img src="image/view.png" width="25px" height="25x"/><%=dto.getReadcount()%> &emsp;
        				<img src="image/thumbs.png" width="25px" height="25px" /><%=dto.getGood() %>&emsp;
        				<img src="image/thumbs_down.png" width="25px" height="25px" /><%=dto.getDown() %>
        		</td>
			</tr>
			<tr>
				<td align="center"  width="90px" height="30px">제목</td>
				<td  colspan="2" align="center" style="font-size:15px"><b><%=dto.getSubject() %></b></td>
			</tr>
			<tr>
				<td align="center" width="90px">내 용</td>
				<td colspan="2" >
				<textarea name="content" id="contenet"  maxlength="2000px"  cols="73" rows="33"  style="resize: none;font-size:15px"  readonly><%=dto.getContent() %></textarea>
		
				</td>
			</tr>
			<tr>
				<td align="center" width="90px">첨부파일</td>
<%				if(dto.getProjectfile() != null){
%>
						<td colspan="2" align="center">
						<img src="/goworker/makeproject/<%=dto.getProjectfile() %>"width="600px"height="500px">
<%				}else{
%>
				<td colspan="2" style="font-size:13px">
					등록된 첨부파일이 없습니다. 
				</td>
<%				}
%>
			</tr>
	
	
	
<% 	if(sid !=null) {
		if(sid.equals(dto.getId())) {
%>
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
<%		} else {
%>
    		<tr>
    			 <td align="center" colspan="3">
                    <input type="button" value="추천!" onclick="window.open('project_Good.jsp?num=<%=dto.getNum()%>','Good','width=300,height=150');window.location.reload();"/>
                    <input type="button" value="비추천!" onclick="window.open('project_Down.jsp?num=<%=dto.getNum()%>','Down','width=300,height=150');window.location.reload();"/><br/><br/>
                    <input type="button" value="메세지" onclick="window.open('../message/message.jsp?mpnum=<%=dto.getNum()%>','message','width=355px, height=540px')"/>
                    <input type="button" value="이메일보내기" onclick="window.location='/goworker/makeproject/email/mail.jsp?pageNum=<%=pageNum%>'"/>
       				<input type="button" value="목록" onclick="window.location='/goworker/makeproject/project_list.jsp'"/>
       			</td>
    		</tr>
<%		} 
 	}
%>
    </table><br/>
</section>




<!-- 댓글 작성 폼 -->
<section class="comment_title">
	<h3>
		관심있어요 [댓글 수: <%=comment_count %>]
	</h3>
		프로젝트에 관심있으신 분은 댓글을 남겨주세요.
</section>

<section class="section2" >
	
	<form action="/goworker/makeproject/comment/commentPro.jsp" name="commentform" method="post">
		<input type="hidden" name="board_num" value="<%=dto.getNum()%>"/>
		<input type="hidden" name="comment_num" value="<%=comment_num %>"/>
		<input type="hidden" name="comment_ref" value="<%=comment_ref %>" />
		<input type="hidden" name="comment__step" value="<%=comment_step %>" />
		<input type="hidden" name="comment_level" value="<%=comment_level %>" />
		<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
		
		
<%
		if(sid == null){
%>
	<table class="comments">
			<tr>
				<td width="400px" colspan="3" align="center">
					댓글은 회원만 작성이 가능합니다. 로그인 후, 이용 부탁드립니다.
				</td>
			</tr>
	</table>
<%		}else{
%>
			작성자: <b><%=sid %></b><input type="hidden" name="comment_writerid" value="<%=sid%>"/><br/>
			<input type="text" size="120" name="comment_content" style="width:620px;height:70px;" placeholder="댓글을 입력해주세요." required>
			<input type="submit" value="댓글작성"/>
	</form> 
</section>





<!-- 댓글 리스트 -->
<section class="section1">
	<table class="comments">
<%
		if(count > 0){
			for(MakeProject_CommentDTO cdto : list) {
				String comment_result = mdao.getRank(cdto.getComment_writerid());
%>	
		<tr>
			<td align="center" width="100px">
<%				if(comment_result != null){
					if(comment_result.equals("admin")){
%>	
					<img src="image/admin.jpg"  width="40px" height="40px" /><br/>	
<%				}
%>
<%				if(comment_result.equals("manager")){
%>				
					<img src="image/manager.jpg"  width="40px" height="40px" /><br/>
<%				}
%>
<%		  		if(comment_result.equals("member")){
%>
					<img src="image/image.jpg" width="40px" height="40px"><br/>
<%					}
        	}
%>
					<span class="getid">
						<%=cdto.getComment_writerid()%>
						<input type="hidden" name="comment_writerid" value="<%=cdto.getComment_writerid() %>" />
						</span><br/>
					<span class="regdate">
						<%=sdf.format(cdto.getComment_regdate()) %>
					</span>
			</td>
		
		
			<td width="490px">
<%
		int wid=0;
		if(cdto.getComment_level() > 0){
			wid=10*(cdto.getComment_level());
%>	
				<img src="image/white.jpg" width="<%=wid %>" height="16">
				<img src="image/re.gif">
<%		}else{
%>
				<img src="image/white.jpg" width="<%=wid %>" height="16">
<%		}
%>			
				<%=cdto.getComment_content() %>		
		</td>
		
<% 
		if(sid !=null) {
			if(sid.equals(cdto.getComment_writerid())) {
%>			
				
		<td align="center" >	
			<form action="/goworker/makeproject/comment/commentDelete.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref() %>"  method="post" >
				<input type="button" value="수정" onclick="window.open('/goworker/makeproject/comment/commentUpdate.jsp?comment_num=<%=cdto.getComment_num()%>','update','width=800,height=300');"/>
				<input type="submit" value="삭제" onclick="comment_removeCheck()" /> 
				<input type="button" value="답글" onclick="window.open('/goworker/makeproject/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&page=<%=pageNum %>','reply','width=600,height=300');" />
			</form>
		</td>
			
<%		
			}else{
%>
				<td align="center">
				<input type="button" value="답글" onclick="window.open('/goworker/makeproject/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&page=<%=pageNum %>','reply','width=600,height=300');" />
				</td>
		
	</tr>
	<tr>
 		<td width="30px" align="center" colspan="4" style="font-size: 12px">
	 		<img src="image/bestcomment.png" width="25px" height="25px" onclick="window.open('/goworker/makeproject/comment/commentGood.jsp?comment_num=<%=cdto.getComment_num() %>','Good','width=300,height=150'); window.location.reload();"/>
	 		댓글이 마음에 드셨다면 ♥를 눌러주세요!  <b style="font-size:15px"> [<%=cdto.getComment_good() %>]</b>
	 	</td>
 	</tr>
<%             }
		   }
		}
	 }
  }
}
%>
 </table><br/>
 
</section> 
 
 


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


 <%@ include file="../include/footer.jsp"%>
 