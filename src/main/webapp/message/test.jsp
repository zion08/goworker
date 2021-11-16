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
	
	if (sidTarget == null) {	//메인 화면에서 헤더에 있는 메세지 눌렀을때 
		sidTarget = (String)request.getParameter("sidTarget");
		session.setAttribute("sidTarget", sidTarget);
		sidTarget = (String)session.getAttribute("sidTarget");
	}
	
		
	//보내는 사람 (내 id) 가져오기
	String sid = (String)session.getAttribute("sid");
	
	System.out.println("타겟id :" + sidTarget);
%>