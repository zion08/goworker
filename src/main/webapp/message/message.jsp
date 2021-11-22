<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bean.MessageDTO" %>
<link href="../style.css" rel="stylesheet" type="text/css">
<% request.setCharacterEncoding("UTF-8"); %>

<!-- DTO, DAO 객채 생성 -->
<jsp:useBean id="smdto" class="bean.SmemberDTO"/>
<jsp:useBean id="smdao" class="bean.SmemberDAO"/>
<jsp:useBean id="spdto" class="bean.SprojectDTO"/>
<jsp:useBean id="spdao" class="bean.SprojectDAO"/>
<jsp:useBean id="mpdto" class="bean.MakeProjectDTO"/>
<jsp:useBean id="mpdao" class="bean.MakeProjectDAO"/>
<!-- member_search에서 선택한 글 번호 저장. 왜 안되는 것이냐...-->
<%-- <jsp:setProperty property="smnum" name="smdto" />
<jsp:setProperty property="spnum" name="spdto" />
<jsp:setProperty property="mpnum" name="mpdto" /> --%>

  
<% 
	//메세지 클릭한 각 게시판의 글번호
	String smnum = (String)request.getParameter("smnum");	
	String spnum = (String)request.getParameter("spnum");	
	String mpnum = (String)request.getParameter("mpnum");
	smdto.setSmNum(smnum);
	spdto.setSpNum(spnum);
	mpdto.setMpNum(mpnum);
	int num = 0;
	
	//받는 사람 정보 (targetid, field, lang, rank)
	String sidTarget = null;
	String field = null;
	String lang = null;
	
	//클릭한 게시물의 내용에서 필요한 정보 가저옴
	if (smdto.getSmNum() != null) {
		num = Integer.parseInt(smdto.getSmNum());
		smdto.setNum(num);
		smdto = smdao.getContent(smdto);
		session.setAttribute("sidTarget", smdto.getId());		//받는 사람(idtarget) 세션에 저장
		sidTarget = (String)session.getAttribute("sidTarget");	//저장된 값 가져오기
		field = smdto.getField();
		lang = smdto.getLang();
	}
	
	if (spdto.getSpNum() != null) {
		num = Integer.parseInt(spdto.getSpNum());
		spdto.setNum(num);
		spdto = spdao.getContent(spdto);
		session.setAttribute("sidTarget", spdto.getId());		//받는 사람(idtarget) 세션에 저장
		sidTarget = (String)session.getAttribute("sidTarget");	//저장된 값 가져오기
		field = spdto.getField();
		lang = spdto.getLang();
	}
	
	if (mpdto.getMpNum() != null) {
		num = Integer.parseInt(mpdto.getMpNum());
		mpdto.setNum(num);
		mpdto = mpdao.getContent(mpdto);
		session.setAttribute("sidTarget", mpdto.getId());		//받는 사람(idtarget) 세션에 저장
		sidTarget = (String)session.getAttribute("sidTarget");	//저장된 값 가져오기
	}
	
	//메인 화면 > 메세지 > 받은 메세지 눌렀을때 	
	if (sidTarget == null) {	
		sidTarget = (String)request.getParameter("sidTarget");	//messageSave.jsp에서 값 보낸거 받음
		session.setAttribute("sidTarget", sidTarget);
		sidTarget = (String)session.getAttribute("sidTarget");
	}

	
		
	//보내는 사람 (내 id) 가져오기
	String sid = (String)session.getAttribute("sid");	
	
	//읽음 확인 파라미터 받기
	String readcheck = (String)request.getParameter("readcheck");
	session.setAttribute("readcheck", readcheck);
%>

<!-- 받는 사람 -->
<div id="messege-top">
	<div></div>
	<span><b><%=sidTarget%></b></span>
<%	if(field != null) {
%>		<span><%=field%></span>
<%	} 
	if (lang !=null) {
%>		<span><%=lang%></span>
<%	}
%>	
</div>

<!-- 메세지 출력 -->
<iframe src="messagePrint.jsp" name="if" id="messege-content">
</iframe>

<!-- 메세지 내용 전송 -->
<form action="messagePrint.jsp" method="post" target="if" id="messege-send">
	<input type="text" name="inputMessage">
	<input type="submit" value="보내기">
</form>


