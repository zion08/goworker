<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.Cookies" %>
<%@	page import="bean.BoardDAO" %>
<%@	page import="bean.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>
<title>내글 목록</title>
	<link rel="stylesheet" href="../bootstrap.css">

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
	//System.out.println(start+","+ end);
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
				System.out.println(str.getShow());
				System.out.println(str.getSubject());
				System.out.println(str.getWriter());
			}
		}
	}
	String show="y";
%>
<body>
<div class="container">
<table class="table table-hover">
	<thead>	
	<tr>
		<th>탭</th><th>제 목</th><th>글쓴이</th><th>날짜</th><th>조회</th><th>추천</th>
	</tr>
	</thead>
	<tbody>
	<% if(total==0){%>
		<tr>
			<td colspan="6">저장된 글이 없습니다..</td>
		</tr>
	<%}else{ %>	
<% 		for(BoardDTO dto : list)
		{
			if(show.equals(dto.getShow()))
			{
%>			<tr>
				<td><%=dto.getCategory()%></td>
				<td><a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>" ><%=dto.getSubject()%></a></td>
				<td><%=dto.getWriter()%></td>
				<td><%=dto.getReg()%></td>
				<td><%=dto.getReadcount()%></td>
				<td><%=dto.getGood()%></td>
				<td><%=dto.getRowNum()%></td>
			</tr>
<%	 		}
		}
%>
<%	}	 
%>
	</tbody>
</table>

<div  class="btm_line">
		<div class="find" >
			<form action="searchList.jsp" method="post" style="display: inline" >	
				<input type="text" name="search" >	
					<select name="colum">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
						<option value="comment">댓글</option>
					</select>
				<button type="submit" onclick="searchList.jsp" class="btn btn-default">Search</button>
			</form>
			<a class="btn btn-default " href="board.jsp">목록</a>
			<a class="btn btn-default pull-right" href="write.jsp">쓰기</a>
			<%if(sid!=null){ %>
			<a class="btn btn-default pull-right" href="board.jsp?my=1">내글</a>
			<%} %>
			<a class="btn btn-default pull-right" href="#favorite" onclick="searchList.jsp" >인기글</a>
		</div>
</div>
</div>

<div class="text-center">
	<ul class="pagination">
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
			<li><a href="board.jsp?pageNum=<%=startPage-10%>" class="btn btn-default pull-left">[이전]</a></li>
		<%}
		for(int i = startPage ; i<= endPage; i++){%>
			<li><a href="board.jsp?pageNum=<%=i%>"class="btn btn-default"><%=i%></a></li>
		<%}
		if(endPage<pageCount){%>
			<li><a href="board.jsp?pageNum=<%=startPage+10 %>" class="btn btn-default pull-right">[다음]</a></li>	
		<% }%>
	<%}%>
	</ul>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../bootstrap.js"></script>