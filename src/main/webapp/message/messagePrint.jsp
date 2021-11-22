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
	// message.jsp에서 보낸 파라미터 받기
	String inputMessage = (String)request.getParameter("inputMessage");
	String sidTarget = (String)session.getAttribute("sidTarget");
	String sidSender = (String)session.getAttribute("sid");
	String readcheck = (String)session.getAttribute("readcheck");
	
	if (readcheck==null){
		readcheck = "0";
	}
	
	System.out.println("readcheck :" + readcheck);
	System.out.println("입력메세지: " +inputMessage);
	
	// 메세지 가져오기위한 list 준비
	List<MessageDTO> list = null;		// 내가 보낸거
	
	if (inputMessage==null) {	// 입력 메세지가 null이면, 기존 메세지 내용 가져온다 (처음 메시지 창 열었을때)
		list = mgdao.getMessage(sidSender, sidTarget);		// 메세지 가져오기
		System.out.println("출력페이지 읽음확인값: " +readcheck);
		System.out.println(list);
		if (readcheck.equals("1")) {
			System.out.println("출력페이지 나: " +sidSender);
			System.out.println("출력페이지 받은거: " +sidTarget);
			mgdao.updateReadCheck(sidSender, sidTarget);
		}
	} else {							// 입력 메세지 있으면,  
		mgdto.setMessage(inputMessage);	// MessgaeDTO에 필드값 저장
		mgdto.setIdTarget(sidTarget);
		mgdto.setIdSender(sidSender);
		mgdao.InsertMessage(mgdto);		// 메세지 DB에 저장
		list = mgdao.getMessage(sidSender, sidTarget);		// 메세지 가져오기
	}
	
	if (list.isEmpty()){
		System.out.println(list);
%>		<p>메세지가 없어요:)</p>
<%	}

	if (list != null) {
		for (MessageDTO dto : list) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String regDate = sdf.format(dto.getRegDate());
%>			<section class="section4">
<%				if(sidSender.equals(dto.getIdSender())){	//보낸 사람이 나일 때
%>					<p id="send"><%= dto.getIdSender() %></p>
<%				} else {	//보낸 사람이 상대방일 때
%>					<p id="receive"><%= dto.getIdSender() %></p>
<%				}					
%>				<p id="regdate"><%= regDate %></p>
				<p id="message"><%= dto.getMessage() %> </p>
			</section>			
<%		}
	}
%>