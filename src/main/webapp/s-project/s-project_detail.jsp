<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SprojectDTO" %>
<%@ page import="bean.SprojectDAO" %>

<%@ page import="bean.FavoriteDTO" %>
<%@ page import="bean.FavoriteDAO" %>

<%@ page import = "bean.Comment_SprojectDAO" %>
<%@ page import = "bean.Comment_SprojectDTO" %>

<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %> 

<%@ page import = "bean.MemberDTO" %>
<%@ page import = "bean.MemberDAO" %>

<%@ include file = "../include/header.jsp" %>


<jsp:useBean class="bean.SprojectDTO" id="dto" />
<jsp:setProperty property="num" name="dto" />



<%
String id = (String)session.getAttribute("id");
String pageNum = request.getParameter("pageNum");
SprojectDAO dao = new SprojectDAO();
dao.readCountUp(dto);
dto = dao.getContent(dto);
session.setAttribute("num", dto.getNum());
%>




<title><%=dto.getSubject() %></title>

<body>
	<B>
	
		<div class="detailbox1" id="detailallbox"><br /><center>예상 급여 : <%=dto.getPay() %></center><br /> </div>
		<div class="detailbox2" id="detailallbox"><br /><center>요구 경력 : <%=dto.getCareer() %></center><br /> </div>
		<div class="detailbox3" id="detailallbox"><br /><center>예상 기간 : <%=dto.getPeriod() %></center><br /> </div>
	
	</B>
</body>
<br /><br /><br /><br /><br /><br /><br /><br /><br />

<center>

작성자 : <%=dto.getId() %><br />
<br />
<div class="detailbox4" id="detailallbox"><br /><center><%=dto.getLang() %></center></div><br />
	<br /><br />
	위치 : <% if(dto.getLocation()=="online"){ %>원격<%
			}else if(dto.getLocation()=="seoul"){%>서울<%
			}else if(dto.getLocation()=="gyunggi"){%>경기<% 
			}else if(dto.getLocation()=="incheon"){%>인천<% 
			}else if(dto.getLocation()=="gangwon"){%>강원<%
			}else if(dto.getLocation()=="chungbuk"){%>충북<%
			}else if(dto.getLocation()=="chungnam"){%>충남<%
			}else if(dto.getLocation()=="daejeon"){%>대전<%
			}else if(dto.getLocation()=="sejong"){%>세종<%
			}else if(dto.getLocation()=="jeonbuk"){%>전북<%
			}else if(dto.getLocation()=="jeonnam"){%>전남<%
			}else if(dto.getLocation()=="gwangju"){%>광주<%
			}else if(dto.getLocation()=="gyungbuk"){%>경북<%
			}else if(dto.getLocation()=="gyungnam"){%>경남<%
			}else if(dto.getLocation()=="daegu"){%>대구<%
			}else if(dto.getLocation()=="ulsan"){%>울산<%
			}else if(dto.getLocation()=="busan"){%>부산<%
			}else {%>제주<%
			}%><br />
	프로젝트 종류 :<% if(dto.getProjecttype() == "side"){ %> 사이드 프로젝트 <%}else{ %>메인 프로젝트<%}%> <br />
	근무 형태 : <% if(dto.getWorktype() == "online"){ %> 원결 <%}else{ %>상주<%} %><br />
	조회 : <%=dto.getReadcount() %><br />
	좋아요 : <%=dto.getGood() %><br />
	
	
<!-- 관심목록 버튼 -->	
	<%
	if (sid !=null) {%>

	<form>
		<% FavoriteDAO fdao = new FavoriteDAO(); 
		boolean result = fdao.favCheck(sid, dto.getNum());
		if(result == true) {%>
		<a href="/goworker/member/favorite_Spout.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><img src="image/heart_fill.png" width="30px" height="30px"></a>
		<%}else {%>
		<a href="/goworker/member/favorite_Spin.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><img src="image/heart_empty.png" width="30px" height="30px"></a>
		<%} %>
	</form>
	<!-- 관심목록 버튼 끝-->
	
	<!-- 좋아요 버튼-->
	
	<form align="center">
		<a href="s-project_goodUp.jsp?num=<%=dto.getNum() %>" onclick= "window.open(this.href,'GoodUp','width=300,height=150'); return false; window.location.reload();" >좋아요<img src="image/thumbs.png" width="25px" height="25px" ></a>&emsp;
		<a href="s-project_goodDown.jsp?num=<%=dto.getNum() %>" onclick= "window.open(this.href,'GoodDown','width=300,height=150'); return false; window.location.reload();" >싫어요<img src="image/thumbs_down.png" width="25px" height="25px" ></a>
	</form>
	
	<%}%>

	
	<%if (sid !=null) {%>
		<%if(sid.equals(dto.getId())) {%>
		<form action= "s-member_delete.jsp" method="post" align="center">
			<input type="button" value="수정 하기" onclick="window.location='/goworker/s-member/s-member_update.jsp?num=<%=dto.getNum() %>'" />
			<input type="submit" value="삭제 하기" onclick="button_event()" />
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
	</form>
 		<%}else{%>
	<input type="button" value="메일 보내기" onclick="window.location='/goworker/s-member/email/mail.jsp?pageNum=<%=pageNum%>'"/>
	<input type="button" value="쪽지 보내기" value="메세지" onclick="window.open('../message/message.jsp?num=<%=dto.getNum()%>'"/>
		<% } 
	}%>	
<br />
	<input type="button" value="목록으로" onclick="window.location='s-member.jsp?pageNum=<%=pageNum%>'"/>

<br /><br />






<!-- 댓글 작성 폼 -->

<section class="commentForm">

	<%
			int comment_num=0, comment_ref=1, comment_step=0, comment_level=0;
	
			if(request.getParameter("comment_num") != null){
				comment_num=Integer.parseInt(request.getParameter("comment_num"));
				comment_ref=Integer.parseInt(request.getParameter("comment_ref"));
				comment_step=Integer.parseInt(request.getParameter("comment_step"));
				comment_level=Integer.parseInt(request.getParameter("comment_level"));
			}
	
			
			Comment_SprojectDAO cd = new Comment_SprojectDAO();	
			int comment_count = 0;
			int board_num = dto.getNum();
			comment_count = cd.getCommentCount(board_num);
	
	%>
	
	<section class="section1">	
	
	
	<table   border="1" align="center">
			<tr>
				<td align="left" colspan="3" width="580px" style="font-size:15px">
				<h3>▶ 프로젝트 관련 문의 - [작성된 댓글 수: <%=comment_count %>]</h3>
				프로젝트에 대한 문의사항을 남겨주세요.</td>
			</tr>	
		</table>
		
	<form action="comment/commentPro.jsp" name="writeform" method="get" >
				<input type="hidden" name="board_num" value="<%=dto.getNum()%>"/>
				<input type="hidden" name="comment_num" value="<%=comment_num%>"/>
				<input type="hidden" name="comment_ref" value="<%=comment_ref%>"/>
				<input type="hidden" name="comment_step" value="<%=comment_step%>"/>
				<input type="hidden" name="comment_level" value="<%=comment_level%>"/>
				<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
				
			<table class="comments" border="1"  >
			
	<%	if(sid == null){ %>
			<tr>
				<td width="580px" colspan="3" align="center">
					댓글은 회원만 작성이 가능합니다.<br/>
					로그인 후, 이용 부탁드립니다.</td>
			</tr>
			<%}else{ %>
			<tr>
				<td width="70px align="center" >작성자</td>
				<td width="200px" colspan=3 align="center">
					<%=sid %><input type="hidden" name="comment_writerid" value="<%=sid%>"/>
				</td>
			
			</tr>
			<tr>	
				<td width="70px" align="center">내 용</td>
				<td width="300px" colspan=3 align="center">
				<input type="text" size="130" name="comment_content" id="comment_content" style="width:505px;height:100px;" placeholder="댓글을 입력해주세요."  required;></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
					<input type="submit" value="댓글 쓰기"/>
					<input type="reset" value="다시 작성"/>
				</td>
			</tr>
			</table><br/>
		</form>
	 </section>
	 

	 
	 
	 
	 
	 
	 <!-- 댓글 리스트 -->
	
	<section class="commentList">
	
	<% 	
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
	
		Comment_SprojectDAO cdao = new Comment_SprojectDAO();
		int count = 0; 
		List<Comment_SprojectDTO> list = null;	
				
			count = cdao.getCount(); // 전체 글의 갯수
			if(count > 0) {
				list = cdao.getComment( dto.getNum() );	
			}	
	
			
	%>
	
	
		<table class="comments" border=1 width="589px" align="center">
			<tr>
				<th width="60px" align="center">작성자</th>
				<td width="350px" align="center">내 용</td>
				<td width="60px" align="center" >작성일</td>
				<td width="40px" align="center">버튼</td>
			</tr>
			<% 
				if(count > 0) { 
				for(Comment_SprojectDTO cdto : list)  {
				

					MemberDTO mdto = new MemberDTO();
					MemberDAO mdao = new MemberDAO();
					String result = mdao.getRank(cdto.getComment_writerid());
				
				%>
			
			<tr>	
				<%				if(result != null){ %>
					<%					if(result.equals("admin")){%>	
										<img src="/goworker/s-project/image/admin.jpg"  width="40px" height="40px" /></br>	
									<%} %>
					<%				if(result.equals("manager")){%>				
										<img src="/goworker/s-project/image/manager.jpg"  width="40px" height="40px" /></br/>
									<%} %>
					<%		  		if(result.equals("member")){ %>
										<img src="/goworker/s-project/image/image.jpg" width="40px" height="40px"><br/>
										<%} 
									} %>
											<%=cdto.getComment_writerid() %><input type="hidden" name="comment_writerid" value="<%=cdto.getComment_writerid() %>" />
									</td>
			<%
			  int wid=0; 
			  if(cdto.getComment_level()>0){
				// 답글일때에만 Re_level()의 값이 0 이상이다. / 답글일때에만 조건문 수행
				wid=10*(cdto.getComment_level());
			 // 답글 들여쓰기 사이즈(width의 값으로 넣을 변수와 값 저장해서 아래에 대입)
			%>
				 <img src="/goworker/s-project/image/white.jpg" width="<%=wid%>" height="16">
				  <img src="/goworker/s-project/image/re.gif">
			  <%}else{%>
				   <img src="/goworker/s-project/image/white.jpg" width="<%=wid%>" height="16">	  	 
			   <%} %>
					   <%=cdto.getComment_content() %>
			   
				</td>
				<td align="center">
					<%=sdf.format(cdto.getComment_regdate()) %>
				</td>
				
	
	<% if(sid !=null) {
	if(sid.equals(cdto.getComment_writerid())) { %>	
			
				<td  align="center">
					<form action="/goworker/s-project/comment/commentDelete.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref() %>"  method="post">
						<input type="button" value="수정" onclick="window.open('/goworker/s-project/comment/commentUpdate.jsp?comment_num=<%=cdto.getComment_num() %>','update','width=800,height=300');"/>
						<input type="submit" value="삭제" onclick="comment_removeChek()"/>
						 <input type="button" value="답글" onclick="window.open('/goworker/s-project/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>','reply','width=600,height=300');" />
						 <%}else{ %>
						 <td algin="center">
							 <input type="button" value="답글" onclick="window.open('/goworker/s-member/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&pageNum=<%=pageNum%>','reply','width=600,height=300');" />
						 </td>
						 
					 </form>
				 </td>
				 <%} 
				 }%>
			 </tr>
			 <tr>
				 <td width="30px" align="center" colspan="4" style="font-size: 12px">
					 <img src="/goworker/s-project/image/bestcomment.png" width="30" height="30" onclick="window.open('/goworker/s-project/comment/commentGood.jsp?comment_num=<%=cdto.getComment_num() %>','Good','width=300,height=150'); window.location.reload();" align="center"/>
					 를 꾸~욱! 눌러주세요!  <b style="font-size:15px"> [<%=cdto.getComment_good() %>]</b>
				 </td>
		 </tr>
			 <%} 
			}
		 }%>
			 
	 </table><br/>
		
	
	</section>
	
	
	
	<script>
		function comment_removeChek(){
			if(confirm("정말로 삭제하시겠습니까?") == true) {
				document.form.submit;
				window.location='/goworker/s-project/comment/commentDelete.jsp';
			}
		}
	</script>