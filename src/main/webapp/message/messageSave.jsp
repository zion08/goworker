<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.MessageDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 메세지 DTO, DAO 생성 -->
<jsp:useBean id="mgdto" class="bean.MessageDTO"/>
<jsp:useBean id="mgdao" class="bean.MessageDAO"/>

<%
	//내 id 가져오기
	String sid = (String)session.getAttribute("sid");
	
	//메세지 가져오기위한 list 준비
	List<MessageDTO> list = null;
	
	//내가 받은 모든 메세지 저장
	list = mgdao.getMyMessage(sid);
	
	if (list.isEmpty()){
%>		<p>메세지가 없어요:)</p>		
<%	} else {
		for (MessageDTO dto : list) {
%>			<p><%= dto.getIdSender() %>: (<%=dto.getRegDate()%>)</p>
			<p><%= dto.getMessage() %></p>
<%		}
	}
%>