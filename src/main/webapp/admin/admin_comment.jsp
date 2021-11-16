<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "bean.CommentDTO" %>
<%@ page import= "bean.CommentDAO" %>
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>


<h2>멤버 관리</h2><input type="button" value="관리자 홈" onclick="window.location='admin.jsp'" />
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
	
	CommentDAO cdao = new CommentDAO();
	int count = 0; 
	List<CommentDTO> list = null;	
			
		count = cdao.getCount(); // 전체 글의 갯수
		
		if(count > 0) {
			list = cdao.getComment(start,end);	
		}	 %> 
		
		
	

<section>
	<table border=1 width="1250px">
		<tr>
			<th maxwidth="170">게시판명</th>
			<th width="200">게시판/댓글 번호</th>
			<th width="150">아이디</th>
			<th width="350">댓글내용</th>
			<th width="100">좋아요</th>
			<th width="200">작성일시</th>
			<th width="80">관리</th>
		</tr>
	</table>
<% 	
	if(count !=0) {
		
	
	for(CommentDTO cdto : list) {
		%>
	<div>
		<form action="/goworker/admin/admin_commentUpdate.jsp" method="post">
		<table  border=1 width="1250px">
			<tr>
				<th maxwidth="170"> <%=cdto.getBoard_name() %> <input type="hidden" name="board_name" value= "<%=cdto.getBoard_name() %>" /></th>
				<th width="200">BN = <%=cdto.getBoard_num() %> / CM= <%=cdto.getComment_num() %> 
				<input type="hidden" name="board_num" value= "<%=cdto.getBoard_num() %>" />
				<input type="hidden" name="comment_num" value= "<%=cdto.getComment_num() %>" />
				</th>
				<th width="150"><%=cdto.getComment_writerid()%></th>
				<th width="350"><%=cdto.getComment_content()%></th>
				<th width="100"><img src="image/thumbs.png" width="20px" height="20px"><%=cdto.getComment_good() %></th>
				<th width="200"><%=cdto.getComment_regdate()%></th>
				<th width="80">
				<input type="submit" value="댓글수정" />
				</th>
			</tr>
		</table>
		</form>
	</div>
 



<%}
%>

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
%>			<a href="admin_comment.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%		}
	
		for (int i = startPage ; i <= endPage ; i++) {
%> 			<a href="admin_comment.jsp?pageNum=<%=i%>">[<%=i %>] </a>
<%		}
	
		if(endPage < pageCount) {
%>		<a href="admin_comment.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%		}
	}
}else{%>
	작성된 댓글이 없습니다 .
<%}
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
