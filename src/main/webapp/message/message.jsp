<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.MessageDTO" %>  
<link href="../style.css" rel="stylesheet" type="text/css">
<% request.setCharacterEncoding("UTF-8"); %>

<!-- DTO, DAO 객채 생성 -->
<jsp:useBean id="smdto" class="bean.SmemberDTO"/>
<jsp:useBean id="smdao" class="bean.SmemberDAO"/>
<!-- member_search에서 선택한 글 번호 저장 -->
<jsp:setProperty property="num" name="smdto" />
  
<% 
	//받는 사람 정보 가저오기	
	smdto = smdao.getContent(smdto);	//클릭한 게시물 내용 가져옴
	session.setAttribute("sidTarget", smdto.getId());	//받는 사람(idtarget) 세션에 저장
	String sidTarget = (String)session.getAttribute("sidTarget");	//저장된 값 가져오기
	
	if (sidTarget == null) {	//메인 화면에서 헤더에 있는 메세지 눌렀을때 
		sidTarget = (String)request.getParameter("sidTarget");
		session.setAttribute("sidTarget", sidTarget);
		sidTarget = (String)session.getAttribute("sidTarget");
	}	
		
	//보내는 사람 (내 id) 가져오기
	String sid = (String)session.getAttribute("sid");	
	System.out.println("타겟id :" + sidTarget);
	
	//읽음 확인 파라미터 받기
	String readcheck = (String)request.getParameter("readcheck");
	System.out.println("readcheck :" + readcheck);
	session.setAttribute("readcheck", readcheck);
%>

<!-- 받는 사람 -->
<div id="messege-top">
	<div></div>
	<span><b><%=sidTarget%></b></span>
	<span><%=smdto.getField()%></span>
	<span><%=smdto.getLang()%></span>
</div>

<!-- 메세지 출력 -->
<iframe src="messagePrint.jsp" name="if" id="messege-content">
</iframe>

<!-- 메세지 내용 전송 -->
<form action="messagePrint.jsp" method="post" target="if" id="messege-send">
	<input type="text" name="inputMessage">
	<input type="submit" value="보내기">
	<%-- <input type="hidden" name="idtarget" value="<%=smdto.getId()%>">
	<input type="hidden" name="idsender" value="<%=sid%>">  --%>
</form>


