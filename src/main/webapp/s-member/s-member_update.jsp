<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.SmemberDAO" %>

<jsp:useBean class="bean.SmemberDTO" id="dto" />   
<% String num= request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	String id = (String)session.getAttribute("id");
	SmemberDAO dao = new SmemberDAO();
	dto = dao.getContent(dto);

%>

<link href="style.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>멤버등록</title>
<header>
	<div class="logo">
		<a href="/goworker/main/index.jsp"><img src="image/logo.png" width= "80" height="80"/></a>
		
	</div>
	<div class="sideicon" align="right" width="400" height="70">
		<br/>
		<a href="">쪽지함</a>&emsp;
		<input type="button" name="signin" value="가입하기" class="sign"/>&emsp;
		<input type="button" name="login" value="로그인" class="login"/>&emsp;
	</div>


</header>
<hr color="skyblue" size="2"  align="center" />
<br/>
<section class="section2">
	<form action="s-member_updatePro.jsp" method="post" enctype="multipart/form-data" class="form-box2">
		<div class="wrapper">
			<div id="id">	
				<span>아이디</span>
					<%=id%>
					<input type="hidden" name="writer" value="<%=id%>" />
			</div>
			
			<div id=phone>
				<span>전화번호</span>
					<input type="text" name="phone" placeholder="-없이 입력">
			</div>
			
			<div id=email>
				<span>이메일</span>
					<input type="email" name="email">
			</div>
			
			<div id=kakao>
				<span>카카오톡</span>
					<input type="text" name="kakao">
			</div>
			
			<div id="field">
				<span>분야</span>
					<select name="field">
						<option value="개발">개발</option>
						<option value="기획">기획</option>
						<option value="디자인">디자인</option>
						<option value="all">전체<option>
					</select>			
			</div>
			
			<div id="career">
				<span>경력</span>
					<select name="career">
						<option>신입</option>
						<option>1년차</option>
						<option>2년차</option>
						<option>3년차</option>
						<option>4년차</option>
						<option>5년차</option>
						<option>6년차</option>
						<option>7년차이상</option>
					</select>
			</div>
			
			<div id="lang">
				<span>보유 기술</span>
					<div>
						<label><input type="checkbox" name="lang" value="Python">Python</label>
						<label><input type="checkbox" name="lang" value="Django">Django</label>
						<label><input type="checkbox" name="lang" value="Java">Java</label>
						<label><input type="checkbox" name="lang" value="JavaServerPage">JavaServerPage</label>
						<label><input type="checkbox" name="lang" value="Spring">Spring</label>
						<label><input type="checkbox" name="lang" value="Html">Html</label>
						<label><input type="checkbox" name="lang" value="JavaScript">JavaScript</label>
						<label><input type="checkbox" name="lang" value="React">React</label>
						<label><input type="checkbox" name="lang" value="C">C</label>
						<label><input type="checkbox" name="lang" value="C++">C++</label>
						<label><input type="checkbox" name="lang" value="C#">C#</label>
						<label><input type="checkbox" name="lang" value="SQL">SQL</label>				
						<label><input type="checkbox" name="lang" value="R">R</label>
					</div>
			</div>
			
			<div id="portfolio">
				<span>포트폴리오</span>
					<input type="file" name="portfolio" multiple="multiple">
			</div>
			
			<div id="pfdetail">
				<span>포트폴리오 설명</span>
					<input type="text" name="pfdetail" >
			</div>
			
			
			<div id="employtype">
				<span>활동 유형</span>
					<label><input type="radio" name="employtype" value="개인">개인 프리랜서</label>
					<label><input type="radio" name="employtype" value="팀">팀 프리랜서</label>
					<label><input type="radio" name="employtype" value="개인사업">개인 사업자</label>
					<label><input type="radio" name="employtype" value="법인사업">법인 사업자</label>
			</div>
			
			<div id="projecttype">
				<span>찾는 프로젝트 유형</span>
					<label><input type="checkbox" name="projecttype" value="사이드">사이드 프로젝트</label>
					<label><input type="checkbox" name="projecttype" value="메인">메인 프로젝트</label>
			</div>            
					
			<div id="worktype">
				<span>가능한 업무 방식</span>
					<label><input type="checkbox" name="worktype" value="원격">원격</label>
					<label><input type="checkbox" name="worktype" value="상주">상주</label>
					<label><input type="checkbox" name="worktype" value="협의">협의</label>
			</div>
			
			<div id="location"> <!--  업무 방식이 사무실 또는 협의인 경우  -->
				<span>선호 업무 지역</span>
					<select name="location">
						<option>원격</option>
						<option>서울</option>
						<option>경기</option>
						<option>인천</option>
						<option>강원</option>
						<option>충북</option>
						<option>충남</option>
						<option>대전</option>
						<option>세종</option>
						<option>전북</option>
						<option>전남</option>
						<option>광주</option>
						<option>경북</option>
						<option>경남</option>
						<option>대구</option>
						<option>울산</option>
						<option>부산</option>
						<option>제주</option>
				</select>
			</div>
				
			<div id="period">
				<span>근무 가능 일자</span>
					<input type="date" name="period">
			</div>
			
			<div id="available">
				<span>구직활동여부</span>
				<select name="available">
					<option value="1">on</option>
					<option value="0">off</option>
				</select>
			</div>
			
			<div id="pay">
				<span>희망 계약금</span>
					<input type="text" name="pay"  placeholder=", 없이 입력">만원
			</div>
			
			<div id="introduce">
				<span>소개</span>
					<input type="text" name="introduce" >
			</div>
			
			
			
			<hr color="skyblue" size="2" width="750" align="center">
			<div class="wrapper-submit">
				<input type="submit" value="등록하기" />
			</div>
		</div>
	</form>	
</section>
