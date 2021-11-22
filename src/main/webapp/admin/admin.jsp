<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "bean.SmemberDTO" %>
<%@ page import= "bean.SmemberDAO" %>
<%@ page import= "bean.SprojectDAO" %>
<%@ page import= "bean.SprojectDTO" %>
<%@ page import= "bean.CommentDAO" %>
<%@ page import= "bean.CommentDTO" %>
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>

<h1>관리자 페이지</h1>

<%	
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	String my = request.getParameter("my");
	int pageSize = 10;
	if(pageNum==null) {
		pageNum = "1"; // 값이 안넘어오는경우 >> 첫페이지인경우 
	}
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage - 1) * pageSize + 1;		
	int end = currentPage * pageSize;
	
	SmemberDAO mdao = new SmemberDAO();
	int mcount = 0; 
	List<SmemberDTO> mlist = null;	
			
		mcount = mdao.getCount(); // 전체 글의 갯수
		if( mcount > 0) {
			mlist = mdao.getHotList( 1, 5 );	
		}
		
	SprojectDAO pdao = new SprojectDAO();
	int pcount = 0; 
	List<SprojectDTO> plist = null;	
				
	pcount = pdao.getCount(); // 전체 글의 갯수
		if( pcount > 0) {
			plist = pdao.getSPHotList( 1, 5 );	
		}	
	
	CommentDAO cdao = new CommentDAO();
	int ccount = 0; 
		List<CommentDTO> clist = null;	
					
		ccount = cdao.getCount(); // 전체 글의 갯수
			if( ccount > 0) {
				clist = cdao.getHotComment( 1, 5 );	
			}	
		
%>

<div class="section7">
	<a href="admin_smember.jsp" class="sideicon2"><p>멤버찾기 관리</p></a> 
	<a href="admin_sproject.jsp"  class="sideicon2"><p>프로젝트 찾기 관리</p></a>
	<a href="admin_comment.jsp"  class="sideicon2"><p>댓글 관리</p></a> 
	<a href="admin_member.jsp"  class="sideicon2"><p>회원 관리</p></a> 
	<a href="admin_notice.jsp"  class="sideicon2"><p>공지사항</p></a> 
	<a href="admin_cs.jsp"  class="sideicon2"><p>문의사항</p></a> 
</div>


<section class="section1">
	<h3> 인기 멤버 </h3>
	<table border=1 width="980px">
		<tr>
			<th width="80">글 번호</th>
			<th maxwidth="150">아이디</th>
			<th width="100">조회수/좋아요</th>
			<th width="200">작성일시</th>
			
		</tr>
	</table>
<% 	if(mcount > 0) {
	for(SmemberDTO mdto : mlist) { %>
	<div>
		<form action="/goworker/s-member/s-member_delete.jsp?num=<%=mdto.getNum()%>" method="get">
		<table  border=1 width="980px">
			<tr>
				<th width="80">
				<input type="hidden" name="num" value="<%=mdto.getNum() %>" />
				<a href="/goworker/s-member/s-member_detail.jsp?num=<%=mdto.getNum()%>" onclick="window.open(this.href, 'detail','width=600,height=1000,toolbars=no'); return false;">No.<%=mdto.getNum() %></a>
				</th>
				<th maxwidth="150"> <%=mdto.getId() %> </th>
				<th width="100"><img src="image/view.png" width="20px" height="20px"/><%=mdto.getReadcount() %>
					<img src="image/thumbs.png" width="20px" height="20px"/><%=mdto.getGood() %>
				</th>
				<th width="200">
					<%=mdto.getRegdate()%>
				</th>
				
			</tr>
			
		</table>
		</form>
	</div>
<%}
}
%>
</section>

<section class="section1">
	<h3> 인기 프로젝트 </h3>
	<table border=1 width="980px">
		<tr>
			<th width="80">글 번호</th>
			<th maxwidth="150">아이디</th>
			<th width="100">조회수/좋아요</th>
			<th width="200">작성일시</th>
			
		</tr>
	</table>
<%  if(pcount > 0) {
	for(SprojectDTO pdto : plist) { %>
	<div>
		<form action="/goworker/s-project/s-project_delete.jsp?num=<%=pdto.getNum()%>" method="get">
		<table  border=1 width="980px">
			<tr>
				<th width="80">
				<input type="hidden" name="num" value="<%=pdto.getNum() %>" />
				<a href="/goworker/s-project/s-project_detail.jsp?num=<%=pdto.getNum()%>" onclick="window.open(this.href, 'detail','width=600,height=1000,toolbars=no'); return false;">No.<%=pdto.getNum() %></a>
				</th>
				<th maxwidth="150"> <%=pdto.getId() %> </th>
				<th width="100"><img src="image/view.png" width="20px" height="20px"/><%=pdto.getReadcount() %>
					<img src="image/thumbs.png" width="20px" height="20px"/><%=pdto.getGood() %>
				</th>
				<th width="200">
					<%=pdto.getRegdate()%>
				</th>
				
			</tr>
			
		</table>
		</form>
	</div>
	<%}
}
	%>
</section>

<section class="section1">
	<h3> 인기 댓글 </h3>
	<table border=1 width="980px">
		<tr>
			<th width="150">게시판 이름</th>
			<th width="80">댓글 번호</th>
			<th width="150">아이디</th>
			<th width="300">댓글 내용</th>
			<th width="100">좋아요</th>
			<th width="200">작성일시</th>
			
		</tr>
	</table>
<%  if(ccount > 0) {
	for(CommentDTO cdto : clist) { %>
	<div>
		<table  border=1 width="980px">
			<tr>
				<th width="150"> <%=cdto.getBoard_name() %> </th>
				<th width="80"><%=cdto.getComment_num() %></th>
				<th width="150"> <%=cdto.getComment_writerid() %> </th>
				<th width="300">
				<% if(cdto.getBoard_name().equals("멤버찾기")) { %>
				<a href="/goworker/s-member/s-member_detail.jsp?num=<%=cdto.getBoard_num()%>"><%=cdto.getComment_content() %></a>
				<%} %>
				<% if(cdto.getBoard_name().equals("프로젝트찾기")) { %>
				<a href="/goworker/s-project/s-project_detail.jsp?num=<%=cdto.getBoard_num()%>"><%=cdto.getComment_content() %></a>
				<%} %>
				<% if(cdto.getBoard_name().equals("프로젝트만들기")) { %>
				<a href="/goworker/makeproject/makeproject_detail.jsp?num=<%=cdto.getBoard_num()%>"><%=cdto.getComment_content() %></a>
				<%} %>
				
				
				
				</th>
				<th width="100">
					<img src="image/thumbs.png" width="20px" height="20px"/><%=cdto.getComment_good() %>
				</th>
				<th width="200"><%=cdto.getComment_regdate()%></th>
				
			</tr>
			
		</table>
	</div>
<%}
}%>
</section>


<%@ include file = "../include/footer.jsp" %>