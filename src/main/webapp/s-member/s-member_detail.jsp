<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDAO" %> 
<%@ page import = "bean.Comment_SmemberDAO" %>
<%@ page import = "bean.Comment_SmemberDTO" %>
<%@ page import="java.util.List" %> 
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file = "../include/header.jsp" %>
   
<jsp:useBean class = "bean.SmemberDTO" id= "dto" />
<jsp:setProperty property="num" name="dto" />  



<script>
function button_event(){

	if (confirm("정말 삭제하시겠습니까??") == true){ 
	    document.form.submit();
	    window.loction='/goworker/s-member/s-member_delete.jsp?num=<%=dto.getNum() %>'
		} else{  
	    	return;
			}
	}

</script>

<%
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	SmemberDAO dao = new SmemberDAO();
	dao.readCountUp(dto);
	dto = dao.getContent(dto);
	

%>

<!-- <style>
	section {
			 display: table; margin-left: auto; margin-right: auto;
	}
	.mDetail{  border-style : groove; width : 100%; height : 100%; text-align : center;
	}
</style> -->
<title>멤버 상세정보</title>

<section class="section1">
	<table class="mDetail" border=1>
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %><input type="hidden" name="num" value="<%=dto.getNum() %>"></td>
		</tr>
		<tr>
			<th>분야</th>
			<td><%=dto.getField() %></td>
		</tr>
		<%--if (field의 값 == dev){--%>
		<tr>

			<th>경력</th>
			<td><%=dto.getCareer() %></td>
		</tr>
		
		<tr>
			<th>보유 기술</th>
			<td><%=dto.getLang() %></td>
		</tr>
		
		<%-- }--%>
		<tr>
			<th>가능한 업무 방식</th>		
			<td><%=dto.getWorktype() %> </td>
		</tr>
		<tr>
			<th>지역</th>		
			<td><%=dto.getLocation() %> </td>
		</tr>
		<tr>
			<th>활동 유형</th>		
			<td><%=dto.getEmploytype()%></td>
		</tr>
		<tr>
			<th>근무 가능 일자</th>		
			<td><%=dto.getPeriod() %></td>
		</tr>
		<tr>
			<th>희망 계약금</th>		
			<td><%=dto.getPay() %>만원 선</td>
		</tr>
		<tr>
			<th><img src="image/phone.png" width="25px" height="25px" ></th>		
			<td><%=dto.getPhone() %></td>
		</tr>
		<tr>
			<th><img src="image/kakao-talk.png" width="25px" height="25px" ></th>		
			<td><%=dto.getKakao() %></td>
		</tr>
		<tr>
			<th><img src="image/email.png" width="25px" height="25px" ></th>		
			<td><a href="mailto:﻿"<%=dto.getEmail() %>><%=dto.getEmail() %></a></td>
		</tr>
		<tr>
			<th>포트폴리오</th>		
			<%if(dto.getPortfolio() != null) { %>
				<td><img src = "/goworker/portfolioFile/<%=dto.getPortfolio() %>" width ="180px" height="300px"></td>
			<%} else { %>
			<td> 등록된 포트폴리오가 없습니다. </td>
			<%} %>
		</tr>
		<tr>
			<th>포트폴리오 설명</th>		
			<td><%=dto.getPfdetail()%> </td>
		</tr>
		
		
		<tr>
			<th>자기소개</th>		
			<td width="400px"><%=dto.getIntroduce() %></td>
		</tr>
		<tr>
				
		
			<th colspan="2">
				<img src="image/view.png" width="25px" height="25px" ><%=dto.getReadcount()%> &emsp;
				<img src="image/thumbs.png" width="25px" height="25px" ><%=dto.getGood() %>
			</th>		
			
		
		</tr>	
	</table>
	<br/>
	
	
	
	<form align="center">
		<a href="s-member_goodUp.jsp?num=<%=dto.getNum() %>" onclick= "window.open(this.href,'GoodUp','width=300,height=150'); return false; window.location.reload();" >좋아요<img src="image/thumbs.png" width="25px" height="25px" ></a>&emsp;
		<a href="s-member_goodDown.jsp?num=<%=dto.getNum() %>" onclick= "window.open(this.href,'GoodDown','width=300,height=150'); return false; window.location.reload();" >싫어요<img src="image/thumbs_down.png" width="25px" height="25px" ></a>
	</form>
	
	


	<form align="center">
		<input type="button" value="메일 보내기" onclick="window.location='/goworker/s-member/email/mail.jsp?pageNum=<%=pageNum%>'"/>
		<input type="button" value="쪽지 보내기" />
		<input type="button" value="목록으로" onclick="window.location='s-member.jsp?pageNum=<%=pageNum%>'"/>
	</form>

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
	
	
	Comment_SmemberDAO cd = new Comment_SmemberDAO();	
	int comment_count = 0;
	int board_num = dto.getNum();
	comment_count = cd.getCommentCount(board_num);
	
%>
<section class="section1">	

	<table   align="center">
			<tr>
				<td align="left" colspan="3" width="530px" style="font-size:15px">
				<h3>▶ 서비스 평가 - [작성된 댓글 수: <%=comment_count %>]</h3><br/>
				실제 Go-Worker 이용자들이 남긴 평가입니다.</td>
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
		<%	if(sid == null){ %>
		<tr>
			<td width="520px" colspan="3" align="center">
				댓글은 회원만 작성이 가능합니다.<br/>
				로그인 후, 이용 부탁드립니다.</td>
		</tr>
		<%}else{ %>
			<tr>

				<td width="60" align="center">작성자</td>
				<td width="200px" colspan=3 align="center">
					<%=sid %><input type="hidden" name="comment_writerid" value="<%=sid%>"/>
				</td>

			</tr>
			
			<tr>	
				<td width="60px" align="center">내 용</td>
				<td width="300px" colspan=3 align="center">
					<input type="text" size="100" name="comment_content" id="comment_content" style="width:465px;height:100px;" placeholder="댓글을 입력해주세요." required;></td>
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
<% 	
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
	Comment_SmemberDAO cdao = new Comment_SmemberDAO();
	int count = 0; 
	List<Comment_SmemberDTO> list = null;	
			
		count = cdao.getCount(); // 전체 글의 갯수
		if(count > 0) {
			list = cdao.getComment( dto.getNum() );	
		}		
%>

<section class="section1">

	<table class="comments" border="1" width="535px" align="center">
		<tr>
			<td width="60px">작성자</td>
			<td width="350px" align="center">내 용</td>
			<td width="60px" align="center" >작성일</td>
			<td width="40px" align="center">버튼</td>
		</tr>
<% 
		if(count > 0) { 
			for(Comment_SmemberDTO cdto : list)  {
%>	
			<tr>	
				<td align="center">
					<img src="image/image.jpg" width="50" height="50"><br/>
						<%=cdto.getComment_writerid() %><input type="hidden" name="comment_writerid" value="<%=cdto.getComment_writerid() %>" />
				</td>
				 
				<td>
<%					int wid=0; 
					if(cdto.getComment_level()>0){
						// 답글일때에만 Re_level()의 값이 0 이상이다. / 답글일때에만 조건문 수행
						wid=10*(cdto.getComment_level());
						// 답글 들여쓰기 사이즈(width의 값으로 넣을 변수와 값 저장해서 아래에 대입)
%>						<img src="image/white.jpg" width="<%=wid%>" height="16">
						<img src="image/re.gif">
<%					} else {
%>						<img src="image/white.jpg" width="<%=wid%>" height="16">	  	 
<%					}
%>	  	 			<%=cdto.getComment_content() %> 
				</td>
				
				<td align="center">
					<%=sdf.format(cdto.getComment_regdate()) %>
				</td>
				
<% if(sid !=null) {
if(sid.equals(cdto.getComment_writerid())) { %>					
				
				<td  align="center">
					<form action="/goworker/s-member/comment/commentDelete.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref() %>"  method="post" >
						<input type="button" value="수정" onclick="window.open('/goworker/s-member/comment/commentUpdate.jsp?comment_num=<%=cdto.getComment_num()%>','update','width=800,height=300');"/>
						<input type="submit" value="삭제" onclick="comment_removeCheck()" />
	 					<input type="button" value="답글" onclick="window.open('/goworker/s-member/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&pageNum=<%=pageNum%>','reply','width=600,height=300');" />
	 					<%}else{ %>
	 					
	 					<td algin="center">
	 						<input type="button" value="답글" onclick="window.open('/goworker/s-member/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&pageNum=<%=pageNum%>','reply','width=600,height=300');" />
	 					</td>
	 				</form>
	 			</td>
	 		</tr>

	 		<tr>
 				<td width="30px" align="center" colspan="4" style="font-size: 12px">
 					<img src="/goworker/s-member/image/bestcomment.png" width="30" height="30" onclick="window.open('/goworker/s-member/comment/commentGood.jsp?comment_num=<%=cdto.getComment_num() %>','Good','width=300,height=150'); window.location.reload();" align="center"/>
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
	function comment_removeCheck(){
		if(confirm("삭제 시, 복구가 되지 않습니다. \n 정말로 삭제하시겠습니까??") == true) {
			document.form.submit;
			window.location='/goworker/s-member/comment/commentDelete.jsp';
		}	
</script>
</html>