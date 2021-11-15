<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SprojectDTO" %>
<%@ page import="bean.SprojectDAO" %>

<%@ page import = "bean.Comment_SprojectDAO" %>
<%@ page import = "bean.Comment_SprojectDTO" %>

<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %> 

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
String sid = dto.getId();
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
	위치 : <%=dto.getLocation() %><br />
	프로젝트 종류 :<%=dto.getProjecttype() %><br />
	근무 형태 : <%=dto.getWorktype() %><br />
	게시 날짜 : <%=dto.getRegdate() %><br />
	조회 : <%=dto.getReadcount() %><br />
	<br />
	<input type="button" value="좋아요">

	<input type="button" value="목록" 
	onclick="window.location='s-project_list.jsp?pageNum=<%=pageNum%>'" />

	<%if( sid == id ) { %>	
		<input type="button" value="수정하기" 
		onclick="window.location='s-project_update.jsp?pageNum=<%=pageNum%>&num=<%=dto.getNum() %>&id=<%=id %>'" />	
	<%} %>
	<%if( sid != id ) { %>	
		<input type="button" value="메일 보내기" onclick="window.location='/goworker/s-project/email/mail.jsp?pageNum=<%=pageNum%>'"/>
	<%} %>
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


%>


<div class="comment_title"><b>프로젝트 관련 문의</b><br/></div>
  <div class="comment_smalltitle">프로젝트에 대한 문의사항을 남겨주세요.</div>
<br>

<form action="comment/commentPro.jsp" name="writeform" method="get" >
			<input type="hidden" name="board_num" value="<%=dto.getNum()%>"/>
			<input type="hidden" name="comment_num" value="<%=comment_num%>"/>
			<input type="hidden" name="comment_ref" value="<%=comment_ref%>"/>
			<input type="hidden" name="comment_step" value="<%=comment_step%>"/>
			<input type="hidden" name="comment_level" value="<%=comment_level%>"/>
			<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
		<table class="comments" border=1>
		<tr>
			<th width="50" align="center">작성자</th>
			<th width="300px" colspan=3 align="center">
				<%=id %>
			</th>
		
		</tr>
		<tr>	
			<td width="50px" align="center">내 용</td>
			<td width="300px" colspan=3 align="center">
			<input type="text" size="100" name="comment_content" id="comment_content" style="width:500px;height:100px;" placeholder="댓글을 입력해주세요."></td>
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
 
 </body>
 
 
 
 
 
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


	<table class="comments" border=1>
		<tr>
			<th width="60px">작성자</th>
			<td width="370px" align="center">내 용</td>
			<td width="70px" align="center" >작성일</td>
			<td width="40px" align="center">버튼</td>
		</tr>
		<% 
			if(count > 0) { 
			for(Comment_SprojectDTO cdto : list)  {%>
		
		<tr>	
			<td align="center">
				<img src="/goworker/s-project/image/image.jpg" width="50" height="50"><br/>
					<%=id %>
			</td>
			 <td>
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
			<td  align="center">
				<form action="/goworker/s-project/comment/commentDelete.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>"  method="post">
					<input type="button" value="수정" onclick="window.open('/goworker/s-project/comment/commentUpdate.jsp?comment_num=<%=cdto.getComment_num() %>','update','width=800,height=300');"/>
					<input type="submit" value="삭제" onclick="comment_removeChek()"/>
 					<input type="button" value="답글" onclick="window.open('/goworker/s-project/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>','reply','width=600,height=300');" />
 				</form>
 			</td>
 		</tr>
 		<tr>
 			<td width="30px" align="center" colspan="4" style="font-size: 12px">
 				<img src="/goworker/s-project/image/bestcomment.png" width="30" height="30" onclick="window.open('/goworker/s-project/comment/commentGood.jsp?comment_num=<%=cdto.getComment_num() %>','Good','width=300,height=150'); window.location.reload();" align="center"/>
 				를 꾸~욱! 눌러주세요!  <b style="font-size:15px"> [<%=cdto.getComment_good() %>]</b>
 			</td>
 	</tr>
 		<%} 
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
 
