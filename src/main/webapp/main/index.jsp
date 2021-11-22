<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>


<title>메인페이지</title>

<section class="section3">
	<div class="wrapper-title">
		<span class="title">
			GoWorker<br/>함께 나아갈 동료와 프로젝트를 찾으세요! 
		</span>
		<form>
			<input type="search"  name="searchmain" placeholder="원하는 분야를 검색하세요" class="search"/>
			<input type="image" src="image/search.png" class="search-img"/>
		</form>
	</div>	
	
	<br/><br/>
	<div class="category-box">
		<div id="smember" onclick="window.location='../s-member/s-member.jsp'">
			<span>멤버 찾기</span>
		</div>

		<div id="sproject" onclick="window.location='../s-project/s-project.jsp'">
			<span>프로젝트 찾기</span>
		</div>
		<div id="mproject" onclick="window.location='../makeproject/project_list.jsp'">
			<span>프로젝트 생성</span>
		</div>
		<div id="community" onclick="window.location='../board/board.jsp'">
			<span>커뮤니티</span>
		</div>
	</div>
</section>

<%@ include file = "../include/footer.jsp" %>
