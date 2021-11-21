<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.BoardDAO" %>
<%@ page import="bean.BoardDTO" %>
<%@ page import="bean.Cookies" %>
<%@ page import="java.util.List"%>
<%@ include file = "../include/header.jsp" %>

<title>게시물내용</title>
<link rel="stylesheet" href="../bootstrap.css">
<jsp:useBean class="bean.BoardDTO" id="dto" />
<jsp:setProperty property="num" name="dto" />

<%
	if(sid==null){
		sid=cid;
	}
	
	String pageNum=request.getParameter("pageNum"); 
	
	BoardDAO dao = new BoardDAO();
	dao.readCountUp(dto); //조회수 증가
	dto = dao.getContent(dto);
	int count = dao.getCount(); //총게시글 수
	int prev = dto.getNum()-1;
	int next = dto.getNum()+1;

%>
</script>
	<div class="container" >
	<table class="table table-hover">	
	<tr><td>제목 : <%=dto.getSubject() %></td> <td>등록일 : <%=dto.getReg() %></td></tr>
	<tr><td>작성자 : <%=dto.getWriter() %></td> <td>조회수 : <%=dto.getReadcount() %></td>
	<tr><td>내용 : <%=dto.getContent()%></td>
	<%if(dto.getFilename() != null){%>
	<td><a href="uploadFile/boardFile/<%=dto.getFilename()%>" class="btn btn-default" ><%=dto.getFilename()%> [첨부파일]</a></td></tr>
	<%}else{%>
	<td><a href="#" class="btn btn-default">[첨부파일 없음]</a></td></tr>
	<%} %>
	</table>
	<div class="text-center" style="display:inline;">
	<ul class="pagination">
	<%if(prev>1){%>
	<li><a class="btn btn-default" href="content.jsp?num=<%=prev%>&pageNum=<%=pageNum%>">이전글</a></li>
	<%} %> 
	<li><a href="board.jsp?pageNum=<%=pageNum%>" class="btn btn-default">목록</a> </li>
	<%if(next<count){%>
	<li><a class="btn btn-default" href="content.jsp?num=<%=next%>&pageNum=<%=pageNum%>">다음글</a></li>
	<%}%>
	</ul>
	</div>
<%	if(sid!=null){ 
		if(sid.equals(dto.getWriter()))
		{
%>			<a href="edit.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>" class="btn btn-default">수정</a> 
			<form action="delete.jsp" method="post" style="display:inline;">
				<input type="hidden" name="num" value="<%=dto.getNum()%>" />
				<input type="hidden" name="pageNum" value="<%=pageNum%>" />
				<input type="hidden" name="show" value="n" />
				<input type="submit" value="삭 제" class="btn btn-default" />
			</form>
<%		}
	}
%>	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../bootstrap.js"></script>
