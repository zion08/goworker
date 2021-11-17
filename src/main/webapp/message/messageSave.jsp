<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
	
	//받은 메세지 중 최신꺼만 가져옴 (모든 컬럼)
	System.out.println(sid);
	list = mgdao.getMyMessage(sid);
	System.out.println(list);
		
	//안읽은 메세지 갯수
	int countNewMessage = mgdao.getCountNewMessage(sid);
%>

<header class="wrapper-sideicon2">
	<div class="logo"></div>
	<span>새 메세지가 <%=countNewMessage%>개 있습니다.</span>
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
			int newMessageById = mgdao.getNewMessageById(dto.getIdSender(), sid);
			System.out.println(dto.getIdSender() +", "+ newMessageById);
%>			<section class="section4" onclick="window.open('../message/message.jsp?sidTarget=<%=dto.getIdSender()%>&readcheck=1','message','width=355px, height=540px');">
<% 				if (newMessageById != 0) {	//안읽은 메세지 있음
%>					<p id="receive"><%= dto.getIdSender() %>
						<span><img src="../img/note.png"><%= newMessageById %></span>
					</p>
<%				} else {
%>					<p id="receive"><%= dto.getIdSender() %></p>
<%				}
%>				
				<p id="regdate"><%= regDate %></p>
				<p id="message"><b><%= dto.getMessage() %></b></p>
			</section>
<%		}
	}
%>