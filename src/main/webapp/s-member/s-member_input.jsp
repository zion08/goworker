<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); 
	String id = (String)session.getAttribute("id");%>
<link href="../style.css" rel="stylesheet" type="text/css">

<header>
	<div class="logo" onclick="window.location='/goworker/main/index.jsp'"></div>

	<div class="wrapper-sideicon">		
		<a href="" class="sideicon1">쪽지함</a>
		<input type="button" name="signin" value="가입하기" class="sideicon2"/>
		<input type="button" name="login" value="로그인" class="sideicon2"/>
	</div>
</header>
<hr color="skyblue" size="2"  align="center" />


<title>멤버 등록</title>
<h1>멤버 등록</h1>

<section class="section2">
	<form action="s-member_inputPro.jsp" method="post" enctype="multipart/form-data" class="form-box2">
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
						<option value="dev">개발</option>
						<option value="plan">기획</option>
						<option value="design">디자인</option>
						
					</select>			
			</div>
			
			<div id="career">
				<span>경력</span>
					<select name="career">
						<option value="new">신입</option>
						<option value="1">1년차</option>
						<option value="2">2년차</option>
						<option value="3">3년차</option>
						<option value="4">4년차</option>
						<option value="5">5년차</option>
						<option value="6">6년차</option>
						<option value="7">7년차이상</option>
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
					<label><input type="radio" name="employtype" value="sfree">개인 프리랜서</label>
					<label><input type="radio" name="employtype" value="tfree">팀 프리랜서</label>
					<label><input type="radio" name="employtype" value="sbusiness">개인 사업자</label>
					<label><input type="radio" name="employtype" value="cbusiness">법인 사업자</label>
			</div>
			
			<div id="projecttype">
				<span>찾는 프로젝트 유형</span>
					<label><input type="checkbox" name="projecttype" value="side">사이드 프로젝트</label>
					<label><input type="checkbox" name="projecttype" value="main">메인 프로젝트</label>
			</div>            
					
			<div id="worktype">
				<span>가능한 업무 방식</span>
					<label><input type="checkbox" name="worktype" value="online">원격</label>
					<label><input type="checkbox" name="worktype" value="office">상주</label>
					<label><input type="checkbox" name="worktype" value="discuss">협의</label>
			</div>
			
			<div id="location"> <!--  업무 방식이 사무실 또는 협의인 경우  -->
				<span>선호 업무 지역</span>
					<select name="location">
						<option value="online">원격</option>
						<option value="seoul">서울</option>
						<option value="gyunggi">경기</option>
						<option value="incheon">인천</option>
						<option value="gangwon">강원</option>
						<option value="chungbuk">충북</option>
						<option value="chungnam">충남</option>
						<option value="daejeon">대전</option>
						<option value="sejong">세종</option>
						<option value="jeonbuk">전북</option>
						<option value="jeonnam">전남</option>
						<option value="gwangju">광주</option>
						<option value="gyungbuk">경북</option>
						<option value="gyungnam">경남</option>
						<option value="daegu">대구</option>
						<option value="ulsan">울산</option>
						<option value="busan">부산</option>
						<option value="jeju">제주</option>
					</select>
			</div>
				
			<div id="period">
				<span>근무가능일자</span>
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
