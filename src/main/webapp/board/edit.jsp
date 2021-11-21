<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.Cookies" %>
<%@ page import = "bean.BoardDAO" %>
<%@ include file = "../include/header.jsp" %>
<title>내글수정</title>

<%
	if(sid==null && cid==null){
		response.sendRedirect("/goworker/member/login.jsp");
	}
%>
	<jsp:useBean id="dto" class="bean.BoardDTO"/>
	<jsp:setProperty name="dto" property="*" />
<% 	
	String pageNum= request.getParameter("pageNum");
	
	BoardDAO dao = new BoardDAO();
	dto = dao.getContent(dto);
	
%>
<div class="search-box" style=" padding-right: 15px;  padding-left: 15px;  margin-right: auto;  margin-left: auto;" align="center" >
	<form action="editPro.jsp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
					<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
			제목 : 	<input type="text" name="subject" value="<%= dto.getSubject()%>"/> 
			<select name="category" class="form-control">
					<option value="tab">	탭</option>
					<option value="forum">	자유게시판</option>
					<option value="qna">	묻고답하기</option>
					<option value="notice">	공지</option>
			</select>[<%=dto.getCategory() %>]
			작성자 : <%=dto.getWriter() %> 조회수 : <%=dto.getReadcount() %></br>
			내용 : 	<input type="text" name="content" value="<%=dto.getContent()%>"style="width:1140px;height:500px;"/></br>
					<input type="file" name="filename" />
			<%
				if(dto.getFilename() != null){%>
					[<%=dto.getFilename() %>]
					<input type = "hidden" name="org" value="<%=dto.getFilename()%>"/>		
				<%}else{%>
					[첨부파일 없음]
				<%} %>
					<input type="submit" value="수정" /><a href="board.jsp?pageNum=<%=pageNum%>">[목록]</a>
	</form>
</div>
