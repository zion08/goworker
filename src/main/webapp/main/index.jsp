<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>


<title>메인페이지</title>

<section class="section3 section3-height">	
	<form>
		<input type="search"  name="searchmain" placeholder="원하는 분야를 검색하세요" class="search"/>
		<input type="image" src="/web/saveFile/search.png" width="50" height="50"/>
	</form>
	<br/><br/>
	<div class="category-box">
		<div id="smember" onclick="window.location='../s-member/s-member.jsp'">
			<span>멤버 찾기</span>
		</div>

		<div id="sproject" onclick="window.location='../s-project/s-project.jsp'">
			<span>프로젝트 찾기</span>
		</div>
		<div id="mproject" onclick="window.location='/goworker/makeproject/project_list.jsp'">
			<span>프로젝트 생성</span>
		</div>
		<div id="jobinfo">
			<span>취업 정보</span>
		</div>
		<div id="community">
			<span>커뮤니티</span>
		</div>
	</div>
</section>

<%@ include file = "../include/footer.jsp" %>
