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

<link href="style.css" rel="stylesheet" type="text/css">

<%@ page import = "bean.MemberDAO" %>

<%@ include file = "../include/header.jsp" %>


<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean class="bean.SprojectDTO" id="dto" />
<jsp:setProperty property="num" name="dto" />

<%	if (sid == null) {
%>		<script>
			location.href="../member/login.jsp";
		</script>  		
<%	} else {
		String pageNum = request.getParameter("pageNum");
		SprojectDAO dao = new SprojectDAO();
		dao.readCountUp(dto);		// 조회수 1증가
		dto = dao.getContent(dto);	// 글 내용 가져오기
		session.setAttribute("num", dto.getNum());
		
		//코멘트 관련
		int comment_num=0, comment_ref=1, comment_step=0, comment_level=0;
		
		if( request.getParameter("comment_num") != null){
			comment_num=Integer.parseInt(request.getParameter("comment_num"));
			comment_ref=Integer.parseInt(request.getParameter("comment_ref"));
			comment_step=Integer.parseInt(request.getParameter("comment_step"));
			comment_level=Integer.parseInt(request.getParameter("comment_level"));
		}
		Comment_SprojectDAO cd = new Comment_SprojectDAO();	
		int comment_count = 0;
		int board_num = dto.getNum();
		comment_count = cd.getCommentCount(board_num);
	
		
		//댓글 리스트
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
		
		Comment_SprojectDAO cdao = new Comment_SprojectDAO();
		int count = 0; 
		List<Comment_SprojectDTO> list = null;	
				
		count = cdao.getCount(); // 전체 글의 갯수
		if(count > 0) {
			list = cdao.getComment( dto.getNum() );	
		}
		
		//한글패치
		if((dto.getCareer())==null) {
			dto.setCareer("미입력");
		}
		if((dto.getCareer()).equals("new")) {
			dto.setCareer("신입"); 
		}
		if((dto.getCareer()).equals("1")) {
			dto.setCareer("1년차"); 
		}
		if((dto.getCareer()).equals("2")) {
			dto.setCareer("2년차"); 
		}
		if((dto.getCareer()).equals("3")) {
			dto.setCareer("3년차"); 
		}
		if((dto.getCareer()).equals("4")) {
			dto.setCareer("4년차"); 
		}
		if((dto.getCareer()).equals("5")) {
			dto.setCareer("5년차"); 
		}
		if((dto.getCareer()).equals("6")) {
			dto.setCareer("6년차"); 
		}
		if((dto.getCareer()).equals("7")) {
			dto.setCareer("7년차 이상"); 
		}
		if((dto.getField())==null) {
			dto.setField("미입력"); 
		}
		if((dto.getField()).equals("dev")) {
			dto.setField("개발"); 
		}
		if((dto.getField()).equals("plan")) {
			dto.setField("기획"); 
		}
		if((dto.getField()).equals("design")) {
			dto.setField("디자인"); 
		}
		if((dto.getEmploytype())==null){
			dto.setEmploytype("미입력");
		}
		if((dto.getEmploytype()).equals("sfree")) {
			dto.setEmploytype("개인 프리랜서"); 
		}
		if((dto.getEmploytype()).equals("tfree")) {
			dto.setEmploytype("팀 프리랜서"); 
		}
		if((dto.getEmploytype()).equals("sbusiness")) {
			dto.setEmploytype("개인 사업자"); 
		}
		if((dto.getEmploytype()).equals("cbusiness")) {
			dto.setEmploytype("법인 사업자"); 
		}
		if((dto.getProjecttype())==null){
			dto.setProjecttype("미입력");
		}
		if((dto.getProjecttype()).equals("side")) {
			dto.setProjecttype("사이드 프로젝트"); 
		}
		if((dto.getProjecttype()).equals("main")) {
			dto.setProjecttype("메인 프로젝트"); 
		}
		if((dto.getProjecttype()).equals("sidemain")) {
			dto.setProjecttype("둘 다");
		}
		if((dto.getWorktype())==null) {
			dto.setWorktype("미입력");
		}
		if((dto.getWorktype()).equals("online")){
			dto.setWorktype("원격"); 
		}
		if((dto.getWorktype()).equals("office")){
			dto.setWorktype("상주"); 
		}
		if((dto.getWorktype()).equals("discuss")){
			dto.setWorktype("협의"); 
		}
		
		if(dto.getLang() == null){
			if((dto.getField()).equals("기획")){
				dto.setLang("기획");
			}
			if((dto.getField()).equals("디자인")){
				dto.setLang("디자인");
			}
			if((dto.getField())==null){
				dto.setLang("미입력");
			}
		}
		if((dto.getLocation())==null) {
			dto.setLocation("미입력");
		}
		if((dto.getLocation()).equals("all")) {
			dto.setLocation("전지역"); 
		}
		if((dto.getLocation()).equals("online")) {
			dto.setLocation("원격"); 
		}
		if((dto.getLocation()).equals("seoul")) {
			dto.setLocation("서울"); 
		}
		if((dto.getLocation()).equals("gyunggi")) {
			dto.setLocation("경기"); 
		}
		if((dto.getLocation()).equals("incheon")) {
			dto.setLocation("인천"); 
		}
		if((dto.getLocation()).equals("gangwon")) {
			dto.setLocation("강원"); 
		}
		if((dto.getLocation()).equals("chungbuk")) {
			dto.setLocation("충북"); 
		}
		if((dto.getLocation()).equals("chungnam")) {
			dto.setLocation("충남"); 
		}
		if((dto.getLocation()).equals("daejeon")) {
			dto.setLocation("대전"); 
		}
		if((dto.getLocation()).equals("sejong")) {
			dto.setLocation("세종"); 
		}
		if((dto.getLocation()).equals("jeonbuk")) {
			dto.setLocation("전북"); 
		}
		if((dto.getLocation()).equals("jeonnam")) {
			dto.setLocation("전남"); 
		}
		if((dto.getLocation()).equals("gwangju")) {
			dto.setLocation("광주"); 
		}
		if((dto.getLocation()).equals("gyungbuk")) {
			dto.setLocation("경북"); 
		}
		if((dto.getLocation()).equals("gyungnam")) {
			dto.setLocation("경남"); 
		}
		if((dto.getLocation()).equals("daegu")) {
			dto.setLocation("대구"); 
		}
		if((dto.getLocation()).equals("ulsan")) {
			dto.setLocation("울산"); 
		}
		if((dto.getLocation()).equals("busan")) {
			dto.setLocation("부산"); 
		}
		if((dto.getLocation()).equals("jeju")) {
			dto.setLocation("제주"); 
		} 
			
%>		
		<title>프로젝트 내용</title>
		<section class="section2">
			<div class="detail-box">
				<ul class="detail-inside">
					<li id="detail-subject">			
						<label>프로젝트 명</label>
						<span><%=dto.getSubject() %></span>
					</li>
					
					<li>
						<label>작성자</label>
						<span><%=dto.getId() %></span>
					</li>
					
					<li id="detail-lang">
						<label>사용 기술</label>
						<span><%=dto.getLang()%></span>
					</li>
					
					<li>
						<label>타입</label>
						<span>
							<%=dto.getProjecttype()%> 
						</span>
					</li>
					
					<li>
						<label>예상 금액</label>
						<span><%=dto.getPay() %>만원</span>
					</li>
					
					<li>
						<label>예상 기간</label>
						<span><%=dto.getPeriod() %>일</span>
					</li>
					
					<li>
						<label>위치</label>
						<span><%=dto.getLocation() %></span>
					</li>
					<%	if(dto.getProjectimg() != null) { %>
					<li id="detail-projectimg">
						<label>대표 이미지</label>
						<span>
						<img src = "../uploadFile/projectFile/<%=dto.getProjectimg() %>">
						</span>
					</li>
					<%}%>
					<li id="detail-projectdetail">
						<label>프로젝트 소개</label>
						<span><%= dto.getProjectDetail() %></span>
					</li>
					
					<li id="detail-introduce">
						<label>업무 내용</label>
						<span><%= dto.getIntroduce() %></span>
					</li>
					
					<li>
						<label>근무 형태</label>
						<span><%= dto.getWorktype() %></span>
					</li>
					<li>
						<label>조회</label>
						<span><%= dto.getReadcount() %></span>
					</li>
					<li>
						<label>좋아요</label>
						<span><%= dto.getGood() %></span>
					</li>
				</ul>
			</div>
		</section>
		
		
		<section class="section1">
		
			<table>
				<tr>
					<th colspan="2" >
						<img src="image/view.png" width="25px" height="25px" >
							<%=dto.getReadcount()%> &emsp;
						<img src="image/thumbs.png" width="25px" height="25px" >
							<%=dto.getGood() %>
					</th>		
				</tr>	
			</table>
			
			<!-- 관심목록 버튼 -->
			<form align="center">
<% 				FavoriteDAO fdao = new FavoriteDAO(); 
				boolean result = fdao.SPfavCheck(sid, dto.getNum());
				if(result == true) {
%>					<a href="/goworker/member/favorite_Spout.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><img src="image/heart_fill.png" width="30px" height="30px"></a>
<%				} else {
%>					<a href="/goworker/member/favorite_Spin.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><img src="image/heart_empty.png" width="30px" height="30px"></a>
<%				} 
%>			</form>
		
			<!-- 좋아요 버튼-->	
			<form align="center">
				<a href="s-project_goodUp.jsp?num=<%=dto.getNum() %>" onclick= "window.open(this.href,'GoodUp','width=300,height=150'); return false; window.location.reload();" >
					좋아요<img src="image/thumbs.png" width="25px" height="25px" >
				</a>&emsp;
				<a href="s-project_goodDown.jsp?num=<%=dto.getNum() %>" onclick= "window.open(this.href,'GoodDown','width=300,height=150'); return false; window.location.reload();" >
					싫어요<img src="image/thumbs_down.png" width="25px" height="25px" >
					</a>
			</form>
			
<%			if(sid.equals(dto.getId()) || rank.equals("admin")) {
%>			<form action= "s-project_delete.jsp" method="post" align="center">
				<input type="button" value="수정 하기" onclick="window.location='/goworker/s-project/s-project_update.jsp?num=<%=dto.getNum() %>'" />
				<input type="submit" value="삭제 하기" onclick="button_event()" />
				<input type="button" value="목록으로" onclick="window.location='s-project.jsp?pageNum=<%=pageNum%>'"/>
				<input type="hidden" name="num" value="<%=dto.getNum() %>" />
			</form>
<%			} else {
%>				<input type="button" value="이메일" onclick="window.location='/goworker/s-member/email/mail.jsp?pageNum=<%=pageNum%>'"/>
				<input type="button" value="메세지" onclick="window.open('../message/message.jsp?spnum=<%=dto.getNum()%>','message','width=355px, height=540px')"/>
				<input type="button" value="목록으로" onclick="window.location='s-project.jsp?pageNum=<%=pageNum%>'"/>
<% 			}				
%>
		</section>
			


		<!-- 댓글 작성 폼 -->
		<section class="comment_title">	
						<h3>
							▶ 프로젝트 관련 문의 - [작성된 댓글 수: <%=comment_count %>]
						</h3>
							프로젝트에 대한 문의사항을 남겨주세요.
		</section>
		
		<section class="section2">
			<form action="comment/commentPro.jsp" name="writeform" method="get" >
				<input type="hidden" name="board_num" value="<%=dto.getNum()%>"/>
				<input type="hidden" name="comment_num" value="<%=comment_num%>"/>
				<input type="hidden" name="comment_ref" value="<%=comment_ref%>"/>
				<input type="hidden" name="comment_step" value="<%=comment_step%>"/>
				<input type="hidden" name="comment_level" value="<%=comment_level%>"/>
				<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
					
				작성자: <b><%=sid %></b><input type="hidden" name="comment_writerid" value="<%=sid%>"/><br/>
				<input type="text" size="120" name="comment_content" style="width:650px;height:70px;" placeholder="댓글을 입력해주세요." required>
				<input type="submit" value="댓글작성"/>
			</form>
		</section>


	<!-- 댓글 리스트 -->
		<section class="section1">
			<table class="comments">
<% 
				if(count > 0) { 
					for(Comment_SprojectDTO cdto : list)  {
						MemberDAO mdao = new MemberDAO();
						String comment_result = mdao.getRank(cdto.getComment_writerid());
%>				
				<tr>	
					<td align="center" width="100px">
<%						if(comment_result != null) { 
							if(comment_result.equals("admin")){
%>								<img src="image/admin.jpg"  width="40px" height="40px" /><br/>	
<%							} 
							if(comment_result.equals("manager")){
%>								<img src="image/manager.jpg"  width="40px" height="40px" /><br/>
<%							} 
							if(comment_result.equals("member")){ 
%>								<img src="image/image.jpg" width="40px" height="40px" /><br/>
<%							} 
						} 
%>
							<span class="getid">
								<%=cdto.getComment_writerid() %>
								<input type="hidden" name="comment_writerid" value="<%=cdto.getComment_writerid() %>" />
							</span><br/>
							<span class="regdate">
								<%=sdf.format(cdto.getComment_regdate()) %>
							</span>
						</td>
				
					<td width="530px">
<%						int wid=0; 
						if(cdto.getComment_level()>0) {
							wid=10*(cdto.getComment_level());
%>								<img src="image/white.jpg" width="<%=wid%>" height="16">
				  				<img src="image/re.gif">
<%						} else {
%>					   			<img src="image/white.jpg" width="<%=wid%>" height="16">	  	 
<%						} 
%>
							<%=cdto.getComment_content() %>
					</td>
	
<% 
					if(sid.equals(cdto.getComment_writerid())) { 
%>						<td  align="center">
							<form action="/goworker/s-project/comment/commentDelete.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref() %>"  method="post">
								<input type="button" value="수정" onclick="window.open('/goworker/s-project/comment/commentUpdate.jsp?comment_num=<%=cdto.getComment_num() %>','update','width=800,height=300');"/>
								<input type="submit" value="삭제" onclick="comment_removeChek()"/>
								<input type="button" value="답글" onclick="window.open('/goworker/s-project/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>','reply','width=600,height=300');" />
						 	</form>
					 	</td>
<%					} else { 
%>						<td align="center">
							<form action="/goworker/s-project/comment/commentDelete.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref() %>"  method="post">
								<input type="button" value="답글" onclick="window.open('/goworker/s-member/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&pageNum=<%=pageNum%>','reply','width=600,height=300');" />
							</form>
						</td>						 
					</tr>
				 
					<tr>
						<td width="30px" align="center" colspan="4" style="font-size: 12px">
	 						<img src="image/bestcomment.png" width="25px" height="25px" onclick="window.open('/goworker/s-project/comment/commentGood.jsp?comment_num=<%=cdto.getComment_num() %>','Good','width=300,height=150'); window.location.reload();"/>
	 						댓글이 마음에 드셨다면 ♥를 눌러주세요!  <b style="font-size:15px"> [<%=cdto.getComment_good() %>]</b>
	 					</td>
		 			</tr>
<%					} 
				}
			}	 	
	}
%>
	</table>
</section>	

<%@ include file="../include/footer.jsp"%>
	
	<script>
		function comment_removeChek(){
			if(confirm("정말로 삭제하시겠습니까?") == true) {
				document.form.submit;
				window.location='/goworker/s-project/comment/commentDelete.jsp';
			}
		}
	</script>