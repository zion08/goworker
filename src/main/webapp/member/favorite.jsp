<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bean.SmemberDTO"%>
<%@ page import="bean.SmemberDAO"%>
<%@ page import="bean.SprojectDTO"%>
<%@ page import="bean.SprojectDAO"%>
<%@ page import="bean.FavoriteDTO"%>
<%@ page import="bean.FavoriteDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.Math" %>
<%@ include file = "../include/header.jsp" %>


<title>관심목록</title>

<%	request.setCharacterEncoding("UTF-8");
	int pageNum = 1; //기본페이지
	if (request.getParameter("pageNumber") != null){
		pageNum = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
	}
%>

<h1>관심목록</h1>
<section class="section1">
	<div class="container">
		<p><%=sid %>님이 추가하신 관심목록입니다.<br><br></p>
			<div>
						<%
						int pageSize = 20;
						
						
						int currentPage = pageNum;
					/*	int start = (currentPage - 1) * pageSize + 1;		
						int end = currentPage * pageSize; */
						
						FavoriteDAO fdao = new FavoriteDAO();
						int count = 0;
						List<SmemberDTO> list = null;
						count = fdao.getfavCount(sid);
						if(count > 0){
				        list= fdao.getFavlist(sid);	
						} 
						
						int pcount = 0;
						List<SprojectDTO> plist = null;
						pcount = fdao.getSPfavCount(sid);
						if(pcount > 0){
				        plist= fdao.getSPFavlist(sid);	
						}
						%>
				<table border="1" width="850" text-align="center">	
			
			    <tr>
			    	<th width="100">게시판</th>
					<th width="50">번호</th>
					<th width="350">아이디/제목</th>
					<th width="350">작성일</th>
					<th width="50">삭제</th>
				</tr>
				
			       <% if(count == 0){%>
			    <tr>
				    <th colspan="6"> 멤버찾기에 관심목록이 없습니다...!!</th>
				</tr>	
				    <%}%>
				    
				    <%if(count > 0) {
				    for(SmemberDTO dto : list){%>
		   <form action="../member/favorite_out_fav.jsp" method="post">
			  <tr>
			 	<input type="hidden" name="num" value="<%=dto.getNum() %>" />
			 	<td width="100">멤버찾기</td>
				<td width="50"><%= dto.getNum() %></td>
				<td width="350"><a href="/goworker/s-member/s-member_detail.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><%=dto.getId() %></a></td>
				<td width="350"><%= dto.getRegdate() %></td>
				<td width="50">
                <input type ="submit" value="관심해제" >   
                </td>
			 </tr>
		  </form>
				 <%}
				   }
				 %>
					<% if(pcount == 0){%>
			    <tr>
				    <th colspan="6">프로젝트 찾기에 관심목록이 없습니다...!!</th>
				</tr>	
				    <%}%>
				    <%if(pcount > 0) {
				    for(SprojectDTO pdto : plist){%>
		   <form action="../member/favorite_Spout_fav.jsp" method="post">
			  <tr>
			 	<input type="hidden" name="num" value="<%=pdto.getNum() %>" />	    
			 	<td width="100">프로젝트찾기</td>
				<td width="50"><%= pdto.getNum() %></td>
				<td width="350"><a href="/goworker/s-project/s-project_detail.jsp?num=<%=pdto.getNum()%>&pageNum=<%=pageNum%>"><%=pdto.getSubject() %></a></td>
				<td width="350"><%= pdto.getRegdate() %></td>
				<td width="50">
                <input type ="submit" value="관심해제" >   
                </td>
			 </tr>
			 </form>
				 <%}
				   }
				 %>			
				 </table>
			</div>
		</div>
</section>	

<section class="section2">
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
%>			<a href="favorite.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%		}
	
		for (int i = startPage ; i <= endPage ; i++) {
%> 			<a href="favorite.jsp?pageNum=<%=i%>">[<%=i %>] </a>
<%		}
	
		if(endPage < pageCount) {
%>		<a href="favorite.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%		}
	   }
	
%>
</section>


<%@ include file="../include/footer.jsp"%>
