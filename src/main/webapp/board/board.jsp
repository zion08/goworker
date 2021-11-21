<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.BoardDTO" %>
<%@ page import="bean.BoardDAO" %>
<%@ page import="java.util.List"%>
<%@ page import="bean.Cookies" %>
<%@ include file = "../include/header.jsp" %>
	<title>자유게시판</title>
	<link rel="stylesheet" href="../bootstrap.css" type="text/css">
<%
	int maxArticle = 10;//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 페이지당 최대 게시글 수
	String pageNum=request.getParameter("pageNum");
	String my = request.getParameter("my"); //<<<<<<<<<<<<<<<<<<<<<<<<<<<< my
	if(pageNum==null){
		pageNum="1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage-1)*maxArticle+1;//<<<<<<<<<<<<<<<<<<<<<<<<<<< start 1
	int end = currentPage*maxArticle;//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< end 10
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
	String show="y";
%>
<body>
<div class="container">
<table class="table table-hover">
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
			</tr>
<%	 		}
		}
%>
<%	}	 
%>
	</tbody>
</table>
<div class="btm_line">
		<div class="find" >
			<form action="searchList.jsp" method="post" style="display: inline" >	
				<input type="text" name="search" >	
					<select name="colum">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select>
				<button type="submit" onclick="searchList.jsp" class="btn btn-default">Search</button>
			</form>
			
			<a class="btn btn-default " href="board.jsp">목록</a>
			<a class="btn btn-default pull-right" href="write.jsp" onsubmit="return chkLogin();">쓰기</a>
			<%if(sid!=null || cid!=null){ %>
			<a class="btn btn-default pull-right" href="board.jsp?my=1" >내글</a>
			<%} %>
		</div>
</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../bootstrap.js"></script>

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