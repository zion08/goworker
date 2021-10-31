<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<link href="style.css" rel="stylesheet" type="text/css">

<title>멤버 등록</title>

<header>
	<div class="logo" onclick="window.location='/goworker/main/index.jsp'"></div>

	<div class="wrapper-sideicon">		
		<a href="" class="sideicon1">쪽지함</a>
		<input type="button" name="signin" value="가입하기" class="sideicon2"/>
		<input type="button" name="login" value="로그인" class="sideicon2"/>
	</div>
</header>
<hr color="skyblue" size="2"  align="center" />

<h1>멤버 등록</h1>

<section id="smember_input">
	<form action="s-member_inputPro.jsp" method="post" enctype="multipart/form-data">
		<div class="wrapper">
			<div id="id">	
				<span>아이디</span>
					<input type="text" name="id" placeholder="아이디는 파라미터">
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
						<option value="전체">전체<option>
					</select>			
			</div>
			
			<div id="career">
				<span>경력</span>
					<select name="career">
						<option value="0">신입</option>
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
						<label><input type="checkbox" name="lang" >Python</label>
						<label><input type="checkbox" name="lang" >Django</label>
						<label><input type="checkbox" name="lang" >Java</label>
						<label><input type="checkbox" name="lang" >JavaServerPage</label>
						<label><input type="checkbox" name="lang" >Spring</label>
						<label><input type="checkbox" name="lang" >Html</label>
						<label><input type="checkbox" name="lang" >JavaScript</label>
						<label><input type="checkbox" name="lang" >React</label>
						<label><input type="checkbox" name="lang" >C</label>
						<label><input type="checkbox" name="lang" >C++</label>
						<label><input type="checkbox" name="lang" >C#</label>
						<label><input type="checkbox" name="lang" >SQL</label>				
						<label><input type="checkbox" name="lang" >R</label>
					</div>
			</div>
			
			<div>
				<span>포트폴리오</span>
					<input type="file" name="portfolio" multiple="multiple">
			</div>
			
			<div id="pfdetail">
				<span>포트폴리오 설명</span>
					<input type="text" name="pfdetail" >
			</div>
			
			
			<div id="employtype">
				<span>활동 유형</span>
					<label><input type="checkbox" name="projecttype" value="free">개인 프리랜서</label>
					<label><input type="checkbox" name="projecttype" value="team">팀 프리랜서</label>
					<label><input type="checkbox" name="projecttype" value="solocorp">개인 사업자</label>
					<label><input type="checkbox" name="projecttype" value="corp">법인 사업자</label>
			</div>
			
			<div id="projecttype">
				<span>찾는 프로젝트 유형</span>
					<label><input type="checkbox" name="projecttype" value="side">사이드 프로젝트</label>
					<label><input type="checkbox" name="projecttype" value="main">메인 프로젝트</label>
			</div>            
					
			<div id="worktype">
				<span>가능한 업무 방식</span>
					<label><input type="checkbox" name="worktype" value="remote">원격</label>
					<label><input type="checkbox" name="worktype" value="office">상주</label>
					<label><input type="checkbox" name="worktype" value="discussion">협의</label>
			</div>
			
			<div id="location"> <!--  업무 방식이 사무실 또는 협의인 경우  -->
				<span>선호 업무 지역</span>
					<select name="location">
						<option value="all">상관없음</option>
						<option value="seoul">서울</option>
						<option value="경기">경기</option>
						<option value="incheon">인천</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="대전">대전</option>
						<option value="sejong">세종</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="광주">광주</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="deagu">대구</option>
						<option value="ulsan">울산</option>
						<option value="pusan">부산</option>
						<option value="jeju">제주</option>
				</select>
			</div>
			
			<div id="pay">
				<span>희망 계약금</span>
					<input type="text" name="pay"  placeholder=", 없이 입력">만원
			</div>
			
			<div id="period">
				<span>근무가능일자</span>
					<input type="date" name="period">
			</div>
			
			<div>
				<span>구직활동여부</span>
				<select name="available">
					<option value="1">on</option>
					<option value="0">off</option>
				</select>
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
