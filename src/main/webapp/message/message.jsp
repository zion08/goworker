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
	smdto = smdao.getContent(smdto);
	session.setAttribute("sidTarget", smdto.getId());	//받는 사람(idtarget) 세션에 저장
	
	String sidTarget = (String)session.getAttribute("sidTarget");
		
	//보내는 사람 (내 id) 가져오기
	String sid = (String)session.getAttribute("sid");
	
	/* System.out.println(sidTarget); */
%>

<!-- 받는 사람 -->
<!-- smdto에서 정보 가져옴 -->
<%-- <%= sidTarget %> --%>
<div id="messege-top">
	<div></div>
	<span>idtarget: <b><%=smdto.getId()%></b></span>
	<span><%=smdto.getField()%></span>
	<span><%=smdto.getLang()%></span>
</div>

<!-- 메세지 출력 -->
<iframe src="messageSend.jsp" name="if" id="messege-content">

	
</iframe>

<!-- 메세지, 보내는 사람, 받는 사람 정보 전송 -->
<!-- 보내는 사람(나), 받는 사람(DB에서 가져온 사람) -->
idsender: <%= sid %>
<form action="messageSend.jsp" method="post" target="if" id="messege-send">
	<input type="text" name="inputMessage">
	<input type="submit" value="보내기">
	<%-- <input type="hidden" name="idtarget" value="<%=smdto.getId()%>">
	<input type="hidden" name="idsender" value="<%=sid%>">  --%>
</form>


