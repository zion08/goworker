<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "bean.SmemberDTO" %>
<%@ page import= "bean.SmemberDAO" %>
<%@ page import= "bean.SprojectDAO" %>
<%@ page import= "bean.SprojectDTO" %>
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
		
%>

<aside>
	<a href="admin_smember.jsp">멤버찾기 관리</a> <br/>
	<a href="admin_sproject.jsp">프로젝트 찾기 관리</a> <br/>
	<a href="admin_comment.jsp">댓글 관리</a> <br/>
	<a href="admin_member.jsp">회원 관리</a> <br/>
	<a href="admin_notice.jsp">공지사항</a> <br/>
	<a href="admin_cs.jsp">문의사항</a> <br/>
	
</aside>
<section>
	<h3> 인기 멤버 </h3>
	<section>
	<table border=1 width="470px">
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
		<table  border=1 width="470px">
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
	<h3> 인기 프로젝트 </h3>
	<section>
	<table border=1 width="470px">
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
		<table  border=1 width="470px">
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
</section>