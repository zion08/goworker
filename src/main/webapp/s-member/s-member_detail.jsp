<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDAO" %> 
<%@ page import = "bean.Comment_SmemberDAO" %>
<%@ page import = "bean.Comment_SmemberDTO" %>
<%@ page import = "bean.FavoriteDAO" %>
<%@ page import="java.util.List" %> 
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ page import = "bean.MemberDAO" %>

<%@ include file = "../include/header.jsp" %>
   
<jsp:useBean class = "bean.SmemberDTO" id= "dto" />
<jsp:setProperty property="num" name="dto" />  

<% request.setCharacterEncoding("UTF-8"); %>


<%	if (sid == null) {
%>		<script>
			location.href="../member/login.jsp";
		</script> 
<%	} else {

		String pageNum = request.getParameter("pageNum");
		SmemberDAO dao = new SmemberDAO();
		dao.readCountUp(dto);		// 조회수 1증가
		dto = dao.getContent(dto);	// 글 내용 가져오기
	
		// 코멘트 관련
		int comment_num=0, comment_ref=1, comment_step=0, comment_level=0;
		if(request.getParameter("comment_num") != null){
			comment_num=Integer.parseInt(request.getParameter("comment_num"));
			comment_ref=Integer.parseInt(request.getParameter("comment_ref"));
			comment_step=Integer.parseInt(request.getParameter("comment_step"));
			comment_level=Integer.parseInt(request.getParameter("comment_level"));
		}
		
		Comment_SmemberDAO cd = new Comment_SmemberDAO();	
		int comment_count = 0;
		int board_num = dto.getNum();
		comment_count = cd.getCommentCount(board_num);
		
		
		// 댓글 리스트
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
		Comment_SmemberDAO cdao = new Comment_SmemberDAO();
		int count = 0; 
		List<Comment_SmemberDTO> list = null;	
				
		count = cdao.getCount(); // 전체 글의 갯수
		if(count > 0) {
			list = cdao.getComment( dto.getNum() );	
		}
		
%>
		<title>멤버 상세정보</title>
	
		<section class="section2">
			<div class="detail-box">
				<ul class="detail-inside">
					<li>
						<label>작성자</label>
						<span><%=dto.getId() %></span>
						<input type="hidden" name="num" value="<%=dto.getNum() %>">
					</li>
					
					<li>
						<label>분야</label>
						<span><%=dto.getField() %></span>
					</li>
					
					<li>
						<label>경력</label>
						<span><%=dto.getCareer() %></span>
					</li>
					
					<li id="detail-lang">
						<label>보유 기술</label>
						<span><%=dto.getLang() %></span>
					</li>
					
					<li>
						<label>타입</label>
						<span>
<%							if(dto.getProjecttype() == "side") { 
%>								사이드 프로젝트 
<%							} else { 
%>								메인 프로젝트
<%							}
%>						</span>
					</li>
					
					<li>
						<label>희망 계약금</label>		
						<span><%=dto.getPay() %>만원 선</span>
					</li>
					<li>
						<label>근무 가능 일자</label>		
						<span><%=dto.getPeriod() %></span>
					</li>
					
					<li>
						<label>거주 지역</label>		
						<span><%=dto.getLocation() %> </span>
					</li>
					
					<li>
						<label>업무 방식</label>		
						<span><%=dto.getWorktype() %> </span>
					</li>
					
					<li>
						<label>활동 유형</label>		
						<span><%=dto.getEmploytype()%></span>
					</li>
					
					<li>
						<label>
							<img src="image/phone.png" width="25px" height="25px" >
						</label>		
						<span><%=dto.getPhone() %></span>
					</li>
					
					<li>
						<label>
							<img src="image/kakao-talk.png" width="25px" height="25px" >
						</label>		
						<span><%=dto.getKakao() %></span>
					</li>
					
					<li>
						<label>
							<img src="image/email.png" width="25px" height="25px" >
						</label>		
						<span>
							<a href="mailto:﻿"<%=dto.getEmail() %>><%=dto.getEmail() %>
							</a>
						</span>
					</li>
					
					<li id="detail-portfoiloimg">
						<label>포트폴리오</label>		
<%							if(dto.getPortfolio() != null) { 
%>								<img src = "../uploadFile/portfolioFile/<%=dto.getPortfolio() %>">
<%							} else { 
%>								등록된 포트폴리오가 없습니다.
<%							} 
%>	
					</li>
					
					<li id="detail-portfoilodetail">
						<label>포트폴리오 설명</label>		
						<span><%=dto.getPfdetail()%> </span>
					</li>
			
			
					<li id="detail-introduce">
						<label>자기소개</label>		
						<span><%=dto.getIntroduce() %></span>
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
<%				FavoriteDAO fdao = new FavoriteDAO(); 
				boolean result = fdao.favCheck(sid, dto.getNum());
				if(result == true) {
%>					<a href="/goworker/member/favorite_out.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><img src="image/heart_fill.png" width="30px" height="30px"></a>
<%				} else {
%>					<a href="/goworker/member/favorite_in.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><img src="image/heart_empty.png" width="30px" height="30px"></a>
<%				} 
%>			</form>
			
			<!-- 좋아요 버튼-->	
			<form align="center">
				<a href="s-member_goodUp.jsp?num=<%=dto.getNum() %>" onclick= "window.open(this.href,'GoodUp','width=300,height=150'); return false; window.location.reload();" >
					좋아요<img src="image/thumbs.png" width="25px" height="25px" >
				</a>&emsp;					
				<a href="s-member_goodDown.jsp?num=<%=dto.getNum() %>" onclick= "window.open(this.href,'GoodDown','width=300,height=150'); return false; window.location.reload();" >
					싫어요<img src="image/thumbs_down.png" width="25px" height="25px" >
				</a>
			</form>
			
			
<%			if(sid.equals(dto.getId())) {
%>				<form action= "s-member_delete.jsp" method="post" align="center">
					<input type="button" value="수정 하기" onclick="window.location='/goworker/s-member/s-member_update.jsp?num=<%=dto.getNum() %>'" />
					<input type="submit" value="삭제 하기" onclick="button_event()" />
					<input type="hidden" name="num" value="<%=dto.getNum() %>" />
				</form>
<%			} else { 
%>				<input type="button" value="메세지" onclick="window.open('../message/message.jsp?num=<%=dto.getNum()%>','message','width=355px, height=540px')"/>
				<input type="button" value="메일 보내기" onclick="window.location='/goworker/s-member/email/mail.jsp?pageNum=<%=pageNum%>'"/>
<%			} 
%>				<input type="button" value="목록으로" onclick="window.location='s-member.jsp?pageNum=<%=pageNum%>'"/>
		</section>
		
		
		<!-- 댓글 작성 폼 -->
		<section class="section1">	

			<table  align="center">
				<tr>
					<td align="left" colspan="3" width="528px" style="font-size:15px">
						<h3>
							▶ 서비스 평가 - [작성된 댓글 수: <%=comment_count %>]
						</h3>
						실제 Go-Worker 이용자들이 남긴 평가입니다.
					</td>
				</tr>	
			</table>


			<form action="comment/commentPro.jsp" name="writeform" method="get" >
				<input type="hidden" name="board_num" value="<%=dto.getNum()%>"/>
				<input type="hidden" name="comment_num" value="<%=comment_num%>"/>
				<input type="hidden" name="comment_ref" value="<%=comment_ref%>"/>
				<input type="hidden" name="comment_step" value="<%=comment_step%>"/>
				<input type="hidden" name="comment_level" value="<%=comment_level%>"/>
				<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
				
				<table class="comments" border=1>
					<tr>
						<td width="60px" align="center">
								작성자
						</td>
						<td width="200px" colspan=3 align="center">
							<%=sid %><input type="hidden" name="comment_writerid" value="<%=sid%>"/>
								
						</td>

					</tr>
					<tr>	
						<td width="60px" align="center">
							내 용
						</td>
						<td width="300px" colspan=3 align="center">
							<input type="text" size="100" name="comment_content" id="comment_content" style="width:465px;height:100px;" placeholder="댓글을 입력해주세요." required;>
						</td>
					</tr>
			
					<tr>
						<td colspan=2 align="center">
							<input type="submit" value="댓글 쓰기"/>
							<input type="reset" value="다시 작성"/>
						</td>
					</tr>
				</table>
			</form>
		</section>
 
 
		<!-- 댓글 리스트 -->
		<section class="section1">

			<table class="comments" border="1" width="537px" align="center">
				<tr>
					<td width="60px" align="center">작성자</td>
					<td width="350px" align="center">내 용</td>
					<td width="60px" align="center" >작성일</td>
					<td width="40px" align="center">버튼</td>
				</tr>
<% 
				if(count > 0) {
					for(Comment_SmemberDTO cdto : list)  {
						MemberDAO mdao = new MemberDAO();
						String comment_result = mdao.getRank(cdto.getComment_writerid());				
%>	
				<tr>	
					<td align="center">
<%						if(comment_result != null){ 
							if(comment_result.equals("admin")){
%>							<img src="/goworker/s-member/image/admin.jpg"  width="40px" height="40px" /><br/>	
<%							}
%>
<%							if(comment_result.equals("manager")){
%>								<img src="/goworker/s-member/manager.jpg"  width="40px" height="40px" /><br/>
<%							} 
%>
<%		  					if(comment_result.equals("member")){ 
%>								<img src="/goworker/s-member/image/image.jpg" width="40px" height="40px" /><br/>
<%							}
						}
%>
						<%=cdto.getComment_writerid() %>
						<input type="hidden" name="comment_writerid" value="<%=cdto.getComment_writerid() %>" />
					</td>
					 
					<td>
<%						int wid=0; 
						if(cdto.getComment_level()>0){
							// 답글일때에만 Re_level()의 값이 0 이상이다. / 답글일때에만 조건문 수행
							wid=10*(cdto.getComment_level());
							// 답글 들여쓰기 사이즈(width의 값으로 넣을 변수와 값 저장해서 아래에 대입)
%>							<img src="/goworker/s-memeber/image/white.jpg" width="<%=wid%>" height="16">
							<img src="/goworker/s-member/image/re.gif">
<%						} else {
%>							<img src="/goworker/s-member/image/white.jpg" width="<%=wid%>" height="16">	  	 
<%						}
%>	  	 				<%=cdto.getComment_content() %> 
					</td>
					
					<td align="center">
						<%=sdf.format(cdto.getComment_regdate()) %>
					</td>
					
<%	 				if(sid.equals(cdto.getComment_writerid())) { 
%>						<td  align="center">
							<form action="/goworker/s-member/comment/commentDelete.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref() %>"  method="post" >
								<input type="button" value="수정" onclick="window.open('/goworker/s-member/comment/commentUpdate.jsp?comment_num=<%=cdto.getComment_num()%>','update','width=800,height=300');"/>
								<input type="submit" value="삭제" onclick="comment_removeCheck()" />
		 						<input type="button" value="답글" onclick="window.open('/goworker/s-member/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&pageNum=<%=pageNum%>','reply','width=600,height=300');" />
							</form>
<%					} else {
%>						<td align="center">
		 					<form action="/goworker/s-member/comment/commentDelete.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref() %>"  method="post" >	
		 						<input type="button" value="답글" onclick="window.open('/goworker/s-member/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&pageNum=<%=pageNum%>','reply','width=600,height=300');" />
		 					</form>
	 					</td>	 			
		 			</tr>

		 			<tr>
	 					<td width="30px" align="center" colspan="4" style="font-size: 12px">
	 						<img src="/goworker/s-member/image/bestcomment.png" width="30" height="30" onclick="window.open('/goworker/s-member/comment/commentGood.jsp?comment_num=<%=cdto.getComment_num() %>','Good','width=300,height=150'); window.location.reload();" align="center"/>
	 						를 꾸~욱! 눌러주세요!  <b style="font-size:15px"> [<%=cdto.getComment_good() %>]</b>
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
	function comment_removeCheck(){
		if(confirm("삭제 시, 복구가 되지 않습니다. \n 정말로 삭제하시겠습니까??") == true) {
			document.form.submit;
			window.location='/goworker/s-member/comment/commentDelete.jsp';
		}
	}
	
	function button_event(){
			if (confirm("정말 삭제하시겠습니까??") == true){ 
			    document.form.submit();
			    window.loction='/goworker/s-member/s-member_delete.jsp?num=<%= dto.getNum() %>'
			} else {  
		    	return;
			}
		}
</script>
