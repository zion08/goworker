<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "bean.MemberDTO" %>
<%@ page import= "bean.MemberDAO" %>
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>


<h2>멤버 관리</h2>
<input type="button" value="관리자 홈" onclick="window.location='admin.jsp'" />


<%	

	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	String my = request.getParameter("my");
	
	int pageSize = 20;
	if(pageNum==null) {
		pageNum = "1"; // 값이 안넘어오는경우 >> 첫페이지인경우 
	}
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage - 1) * pageSize + 1;		
	int end = currentPage * pageSize;
	
	MemberDAO dao = new MemberDAO();
	int count = 0; 
	List<MemberDTO> list = null;	
	if(my == null) {		
		count = dao.getCount(); // 전체 글의 갯수
		if(count > 0) {
			list = dao.getmemberList(start,end);	
		}	
	}	
	
	
%>

<section>
	<table border=1 width="1010px">
		<tr>
			<th maxwidth="170">아이디</th>
			<th width="200">이메일</th>
			<th width="100">경고누적</th>
			<th width="200">가입일시</th>
			<th width="100">등급</th>
			<th width="240">관리</th>
		</tr>
	</table>
<% 	if(count >0) {
	for(MemberDTO dto : list) { %>
	<div>
		<form action="/goworker/admin/admin_memberKick.jsp" method="post">
		<table  border=1 width="1010px">
			<tr>
				<th maxwidth="170"> <%=dto.getId() %> 
				<input type="hidden" name="id" value="<%=dto.getId() %>"/></th>
				<th width="200"><%=dto.getEmail()%></th>
				<th width="100">경고 <%=dto.getWarn() %> 회 </th>
				<th width="200"><%=dto.getReg()%></th>
				<th width="100"><%=dto.getRank() %></th>
				<th width="80">
				<input type="submit" value="삭제" onclick="button_event()"/>
			</form>	
				</th>
			<form action="admin_memberRank.jsp" method="post">
				<th width="160">
				<input type="hidden" name="id" value="<%=dto.getId()%>"/>
				<select name="rank">
					<option value="member">멤버</option>
					<option	value="manager">매니져</option>
					<option value="admin">관리자</option>
				</select>
				<input type="submit" value="등급변경" />
				</th>
			</form>	
			</tr>
		</table>
		
	</div>
 



<%}
}	
%>
<script>
function button_event(){

	if (confirm("정말 삭제하시겠습니까??") == true){ 
	    document.form.submit();
	    window.loction='/goworker/admin/admin_memberKick.jsp'
		} else{  
	    	return;
			}
	}

</script>

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
%>			<a href="admin_member.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%		}
	
		for (int i = startPage ; i <= endPage ; i++) {
%> 			<a href="admin_member.jsp?pageNum=<%=i%>">[<%=i %>] </a>
<%		}
	
		if(endPage < pageCount) {
%>		<a href="admin_member.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%		}
	}
%>

<form action="admin_memberSearch.jsp?pageNum=<%=pageNum %>" method= "post">
	<select name = "colum">
		<option value="id"> 아이디 </option>
		<option value="rank"> 등급 </option>
	</select>
	<input type="text" name="search" />
	<input type="submit" value="검색" />
</form>
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
