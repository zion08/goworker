<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "bean.SmemberDTO" %>
<%@ page import= "bean.SmemberDAO" %>
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>


<h2>멤버찾기 관리</h2>
<input type="button" value="관리자 홈" onclick="window.location='admin.jsp'" />
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
		if(count > 0) {
			list = dao.getAllList( start, end );	
		}	
		
%>

<section>
	<table border=1 width="570px">
		<tr>
			<th width="80">글 번호</th>
			<th maxwidth="170">아이디</th>
			<th width="100">조회수/좋아요</th>
			<th width="200">작성일시</th>
			<th width="80">관리</th>
		</tr>
	</table>
<% 
	for(SmemberDTO dto : list) { %>
	<div>
		<form action="/goworker/s-member/s-member_delete.jsp?num=<%=dto.getNum()%>" method="get">
		<table  border=1 width="570px">
			<tr>
				<th width="80">
				<input type="hidden" name="num" value="<%=dto.getNum() %>" />
				<a href="/goworker/s-member/s-member_detail.jsp?num=<%=dto.getNum()%>" onclick="window.open(this.href, 'detail','width=600,height=1000,toolbars=no'); return false;">No.<%=dto.getNum() %></a>
				</th>
				<th maxwidth="170"> <%=dto.getId() %> </th>
				<th width="100"><img src="image/view.png" width="20px" height="20px"/><%=dto.getReadcount() %>
					<img src="image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>
				</th>
				<th width="200">
					<%=dto.getRegdate()%>
				</th>
				<th width="80">
				<input type="submit" value="삭제" />
				</form>
				<form action= "/goworker/s-member/s-member_warn.jsp?num=<%=dto.getNum()%>" method="post">
				<input type="hidden" name="num" value="<%=dto.getNum() %>" />
				<input type="hidden" name="id" value="<%=dto.getId() %>" />
				<input type="submit" value="삭제 및 경고" />
				</form>
				
				</th>
			</tr>
			
		</table>
		
	</div>
 




<%}
}%>

<section class="section4">
<%
	if (count > 0) {
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / 10)* 10 +1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock -1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
		
		if (startPage >10) {
%>			<a href="admin_smember.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%		}
	
		for (int i = startPage ; i <= endPage ; i++) {
%> 			<a href="admin_smember.jsp?pageNum=<%=i%>">[<%=i %>] </a>
<%		}
	
		if(endPage < pageCount) {
%>		<a href="admin_smember.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%		}
	}
%>
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
          		<td>
          			<a href="/goworker/s-member/s-member.jsp">팀원찾기</a>
         		</td>
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
