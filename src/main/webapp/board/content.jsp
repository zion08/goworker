<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.BoardDAO" %>
<%@ page import="bean.BoardDTO" %>
<%@ page import="bean.Cookies" %>
<%@ page import="java.util.List"%>
<%@ include file = "../include/header.jsp" %>

<title>게시물내용</title>
<jsp:useBean class="bean.BoardDTO" id="dto" />
<jsp:setProperty property="num" name="dto" />
<%
	if(sid==null){ // 로그인 확인 => 수정 버튼 클릭시 사용
		sid=cid;
	}
	String pageNum=request.getParameter("pageNum"); 
	
	BoardDAO dao = new BoardDAO();
	dao.readCountUp(dto); //조회수 증가 함수 호출
	dto = dao.getContent(dto); // 글 내용 호출 함수
	int count = dao.getCount(); //총게시글 수 함수
	dao.getNext(dto); // 다음글 버튼 구현 함수
	dao.getPrev(dto); // 이전글 버튼 구현 함수
	int prev=dto.getNum_prev();
	int next=dto.getNum_next();
	
%>			<%-- 게시글 내용 화면 --%>
</script>
	<div class="search-box" style=" padding-right: 15px;  padding-left: 15px;  margin-right: auto;  margin-left: auto;" align="center" >
	<table boarder="1" >	
	<tr><td>제목 : <%=dto.getSubject() %></td> <td>등록일 : <%=dto.getReg() %></td></tr>
	<tr><td>작성자 : <%=dto.getWriter() %></td> <td>조회수 : <%=dto.getReadcount() %></td>
	<tr><td style="width:1140px;height:500px;">내용 : <%=dto.getContent()%></td>
	<%if(dto.getFilename() != null){%>
	<td><a href="uploadFile/boardFile/<%=dto.getFilename()%>" ><%=dto.getFilename()%> [첨부파일]</a></td></tr>
	<%}else{%>
	<td><a href="#" >[첨부파일 없음]</a></td></tr>
	<%} %>
	</table>
	<div  >	<%-- 하단 버튼 구현 --%>
	<%if(prev>=1){%>
		<a href="content.jsp?num=<%=prev%>&pageNum=<%=pageNum%>">[이전글]</a>
	<%}%>
		<a href="board.jsp?pageNum=<%=pageNum%>">[목록]</a>
	<%if(next>0){%>
		<a href="content.jsp?num=<%=next%>&pageNum=<%=pageNum%>">[다음글]</a>
	<%}%>
	</div> <%-- 게시물 삭제 기능 구현 --%>
<%	if(sid!=null){ 
		if(sid.equals(dto.getWriter()))
		{
%>			<a href="edit.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>">수정</a> 
			<form action="delete.jsp" method="post" ">
				<input type="hidden" name="num" value="<%=dto.getNum()%>" />
				<input type="hidden" name="pageNum" value="<%=pageNum%>" />
				<input type="submit" value="삭 제" />
			</form>
<%		}
	}
%>	</div>
