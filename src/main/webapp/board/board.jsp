<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.BoardDTO" %>
<%@ page import="bean.BoardDAO" %>
<%@ page import="java.util.List"%>
<%@ page import="bean.Cookies" %>
<%@ include file = "../include/header.jsp" %>
	<title>자유게시판</title>
<%
	int maxArticle = 10;//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 페이지당 최대 게시글 수
	String pageNum=request.getParameter("pageNum");
	String my = request.getParameter("my"); 
	if(pageNum==null){
		pageNum="1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage-1)*maxArticle+1;
	int end = currentPage*maxArticle;
	BoardDAO dao = new BoardDAO();
	int total = 0;//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 총 게시글 수
	List<BoardDTO> list = null;
	if(my==null){
		total=dao.getCount();
		if(total>0){
			list = dao.getAllList(start, end);
		}
	}else{
		total = dao.getMyCount(sid);
		if(total>0){
				list=dao.getMyAllList(sid,start, end);
		}
	}	
%>       <%-- 게시판 메인 화면 --%>
<body>
<div class="search-box" align="center" >
<table border="1">
	<tr>
		<th>탭</th><th>제 목</th><th>글쓴이</th><th>날짜</th><th>조회</th>
	</tr>
	<% if(total==0){%>
		<tr>
			<td colspan="6">저장된 글이 없습니다..</td>
		</tr>
	<%}else{
 		for(BoardDTO dto : list)
		{
%>			<tr>
				<td><%=dto.getCategory()%></td>
				<td><a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>" ><%=dto.getSubject()%></a></td>
				<td><%=dto.getWriter()%></td>
				<td><%=dto.getReg()%></td>
				<td><%=dto.getReadcount()%></td>
			</tr>
<%	 	}
	  }	 
%>	 		 <%-- 검색 박스 --%>
</table>
<div class="search-box" align="center">
			<form action="searchList.jsp" method="post"  >	
				<input type="text" name="search" >	
					<select name="colum">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select>
				<button type="submit" onclick="searchList.jsp" >Search</button>
			</form>
			 <%-- 기능 버튼 구현  --%>
			<a href="board.jsp">[목록]</a>
			<a href="write.jsp">[쓰기]</a>
			<%if(sid!=null || cid!=null){ %>
			<a href="board.jsp?my=1">[내글]</a>
			<%} %>
</div>
			 <%-- 페이징 구현 --%>
<div class="search-box" align="center" style="display:inline;">
<%
	if(total>0){
		int pageCount = total / maxArticle + (total % maxArticle == 0? 0 : 1);
		int startPage = (currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock -1;
		if(endPage>pageCount){
			endPage=pageCount;
		}
		if(startPage>10){%>
			<a href="board.jsp?pageNum=<%=startPage-10%>" >[이전]</a>
		<%}
		for(int i = startPage ; i<= endPage; i++){%>
			<a href="board.jsp?pageNum=<%=i%>">[<%=i%>]</a>
		<%}
		if(endPage<pageCount){%>
			<a href="board.jsp?pageNum=<%=startPage+10 %>" >[다음]</a>
		<% }%>
	<%}%>
</div>
</body>