<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8"); %>
<link href="../style.css" rel="stylesheet" type="text/css">

<!-- 멤버 찾기에서 선택한 글 번호 저장 -->
<jsp:useBean id="dto" class="bean.SmemberDTO"/>
<jsp:setProperty property="num" name="dto" />    
<!-- dao 객체 생성 -->
<jsp:useBean id="dao" class="bean.SmemberDAO"/>   

<% 
	// 내 id 가져오기
	String sid = (String)session.getAttribute("sid");
	
	// 선택한 글 번호에 해당하는 모든 내용 가져오기
	dto = dao.getContent(dto);
%>

<div id="messege-top">
	<div></div>
	<span><b><%=dto.getId()%></b></span>
	<span><%=dto.getField()%></span>
	<span><%=dto.getLang()%></span>
</div>

<div id="messege-content">
	메세지 출력
</div>

<!-- 메세지 내용 입력 -->
<form action="messageSend.jsp" method="post" id="messege-send">
	<input type="text" name="message">
	<input type="submit" value="보내기">
	<input type="hidden" name="riceiver" value="<%=dto.getId()%>">
	<input type="hidden" name="sender" value="<%=sid%>">
</form>

