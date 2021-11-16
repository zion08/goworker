<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="bean.MessageDTO" %>
<link href="../style.css" rel="stylesheet" type="text/css">
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 메세지 DTO, DAO 생성 -->
<jsp:useBean id="mgdto" class="bean.MessageDTO"/>
<jsp:useBean id="mgdao" class="bean.MessageDAO"/>

<%
	//내 id 가져오기
	String sid = (String)session.getAttribute("sid");

	//메세지 가져오기위한 list 준비
	List<MessageDTO> list = null;
	
	//받은 메세지 중 최신꺼만 가져옴
	list = mgdao.getMyMessage(sid);
%>

<header class="wrapper-sideicon2">
	<div class="logo"></div>
	<span class="sideicon2">
		<p><%=sid%></p>
	</span>	
</header>



<%	
	if (list.isEmpty()){
%>		<section class="section2">
			<p>메세지가 없어요:)</p>
		</section>		
<%	} else {
		for (MessageDTO dto : list) {		
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String regDate = sdf.format(dto.getRegDate());
%>			<section class="section4" onclick="window.open('../message/message.jsp?sidTarget=<%=dto.getIdSender()%>','message','width=355px, height=540px');">
				<p id="receive"><%= dto.getIdSender() %>
				<p><%= regDate %></p>
				<p id="message"><b><%= dto.getMessage() %></b></p>
			</section>
<%		}
	}
%>