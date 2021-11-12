<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.MessageDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 메세지 DTO, DAO 생성 -->
<jsp:useBean id="mgdto" class="bean.MessageDTO"/>
<jsp:useBean id="mgdao" class="bean.MessageDAO"/>

<!-- message.jsp로 부터 받은 파라미타 mgdto에 저장 >> 이거 액선태그 안됨, 왜안되는지 아시는 분??
<jsp:setProperty property="*" name="mgdto"/> -->

<script>
	function reload(){	// 리스트 갯수가 증가하면 페이지 새로고침 // 리스트 카운트 하는 메소드 필요함
	      setTimeout('location.reload()'); 
	}
</script>

<% 
	// message.jsp에서 보낸 파라미터 받기
	String inputMessage = (String)request.getParameter("inputMessage");
	String sidTarget = (String)session.getAttribute("sidTarget");
	String sidSender = (String)session.getAttribute("sid"); 
	System.out.println("입력메세지: " +inputMessage);
	// 메세지 가져오기위한 list 준비
	List<MessageDTO> listSend = null;		// 내가 보낸거
	List<MessageDTO> listReceive = null;	// 내가 받은거
	
	if (inputMessage==null) {	// 입력 메세지가 null이면, 기존 메세지 내용 가져온다 (처음 메시지 창 열었을때)
		listSend = mgdao.getMessage(sidSender, sidTarget);		// 메세지 가져오기(내가 보낸거)
		listReceive = mgdao.getMessage(sidTarget, sidSender);	// 메세지 가져오기(내가 받은거)
		System.out.println(listSend);
	} else {							// 입력 메세지 있으면,  
		mgdto.setMessage(inputMessage);	// MessgaeDTO에 필드값 저장
		mgdto.setIdTarget(sidTarget);
		mgdto.setIdSender(sidSender);
		mgdao.InsertMessage(mgdto);		// 메세지 DB에 저장
		listSend = mgdao.getMessage(sidSender, sidTarget);		// 메세지 가져오기(내가 보낸거)
		listReceive = mgdao.getMessage(sidTarget, sidSender);	// 메세지 가져오기(내가 받은거)
	}
	
	if (listSend.isEmpty() && listReceive.isEmpty() ){
		System.out.println(listSend +" ,"+ listReceive);
%>		<p>메세지가 없어요:)</p>
<%	}

	if (listSend != null || listReceive != null) {				
		for (MessageDTO dto : listReceive) {
%>			<p><%= dto.getIdSender() %>: (<%=dto.getRegDate()%>)</p>
			<p><%= dto.getMessage() %></p>
<%		}
		for (MessageDTO dto : listSend) {			
%>			<p>(<%=dto.getRegDate()%>)</p>
			<p><%= dto.getMessage() %></p>
<%		}
	}
%>


