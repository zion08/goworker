<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.Cookies" %>
<%@	page import="bean.BoardDAO" %>
<%@	page import="bean.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>
<title>내글 목록</title>

<%
	if(sid==null){
		sid=cid;
	}
	int maxArticle=10;
	String colum = request.getParameter("colum");
	String search= request.getParameter("search");
	
	String pageNum = request.getParameter("pageNum");
	String my = request.getParameter("my");
	
	if(pageNum==null){
		pageNum="1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage-1)*maxArticle+1;
	int end= currentPage*maxArticle;
	BoardDAO dao = new BoardDAO();
	
	int total = 0;
	List<BoardDTO> list = null;
	if(my == null){
		total  = dao.getSearchCount(colum, search);
		System.out.println(total);
		if(total>0){
			list= dao.getSearchList(colum, search, start, end);
			for(BoardDTO str : list){
				System.out.println(str.getCategory());
				System.out.println(str.getContent());
				System.out.println(str.getFilename());
				System.out.println(str.getGood());
				System.out.println(str.getNum());
				System.out.println(str.getReadcount());
				System.out.println(str.getSubject());
				System.out.println(str.getWriter());
			}
		}
	}
	String show="y";
%>
<body>
<div  class="search-box" align="center">
<table >
	<thead>	
	<tr>
		<th>탭</th><th>제 목</th><th>글쓴이</th><th>날짜</th><th>조회</th>
	</tr>
	</thead>
	<tbody>
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
<%	 		}
		}
%>
	</tbody>
</table>

<div  class="search-box" align="center">
			<form action="searchList.jsp" method="post"  >	
				<input type="text" name="search" >	
					<select name="colum">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
						<option value="comment">댓글</option>
					</select>
				<button type="submit" onclick="searchList.jsp" >Search</button>
			</form>
			<a  href="board.jsp">목록</a>
			<a  href="write.jsp">쓰기</a>
			<%if(sid!=null){ %>
			<a  href="board.jsp?my=1">내글</a>
			<%} %>
			<a  href="#favorite" onclick="searchList.jsp" >인기글</a>
</div>

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
