<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean class="bean.NoticeDTO"  id="dto" />
<jsp:setProperty property="num" name="dto" />
<%
	String pageNum = request.getParameter("pageNum");
%>

<form action="noticeDeletePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=dto.getNum() %>" />
	<input type="hidden" name="pageNum" value="<%=pageNum%>" />
	<input type="submit" value="삭 제" />
</form>