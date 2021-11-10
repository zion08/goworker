<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "bean.SmemberDTO" %>
<%@ page import= "bean.SmemberDAO" %>
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
	
	SmemberDAO dao = new SmemberDAO();
	int count = 0; 
	List<SmemberDTO> list = null;	
	if(my == null) {		
		count = dao.getCount(); // 전체 글의 갯수
		if( count > 0) {
			list = dao.getHotList( 1, 5 );	
		}	
		
%>

<aside>
	<a href="admin_smember.jsp">멤버찾기 관리</a> <br/>
	<a href="admin_sproject.jsp">프로젝트 찾기 관리</a> <br/>
	<a href="admin_comment">댓글 관리</a> <br/>
	<a href="admin_member">회원 관리</a> <br/>
	
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
<% 
	for(SmemberDTO dto : list) { %>
	<div>
		<form action="/goworker/s-member/s-member_delete.jsp?num=<%=dto.getNum()%>" method="get">
		<table  border=1 width="470px">
			<tr>
				<th width="80">
				<input type="hidden" name="num" value="<%=dto.getNum() %>" />
				<a href="/goworker/s-member/s-member_detail.jsp?num=<%=dto.getNum()%>" onclick="window.open(this.href, 'detail','width=600,height=1000,toolbars=no'); return false;">No.<%=dto.getNum() %></a>
				</th>
				<th maxwidth="150"> <%=dto.getId() %> </th>
				<th width="100"><img src="image/view.png" width="20px" height="20px"/><%=dto.getReadcount() %>
					<img src="image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>
				</th>
				<th width="200">
					<%=dto.getRegdate()%>
				</th>
				
			</tr>
			
		</table>
		</form>
	</div>
 




<%}
}%>
</section>
	<h3> 인기 프로젝트 </h3>
</section>