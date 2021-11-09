<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
	
<%	if (sid != null){	//로그인pro 수정 수정 후, ==으로 바꿀 것
%>		<script>
			location.href="../member/login.jsp";
		</script>  		
<%	} else {
%>		<title>프로젝트 등록</title>

		<h1>프로젝트 등록</h1>

		<section class="section2">
			<form action="s-project_inputPro.jsp" method="post" enctype="multipart/form-data" class="form-box2">
				<div class="wrapper">
					<ul class="profile-info">
						<li id="profile-img">		
						</li>
						<li id="id">	
							<label>아이디</label>
								<span><%=sid%></span>
								<input type="hidden" name="writer" value="<%=sid%>"/>
						</li>
						
						<li id=phone>
							<label>전화번호</label>
								<input type="text" name="phone" placeholder="-없이 입력">
						</li>
						
						<li id=email>
							<label>이메일</label>
								<input type="email" name="email">
						</li>
						
						<li id=kakao>
							<label>카카오톡</label>
								<input type="text" name="kakao">
						</li>
					</ul>
					
					<ul class="career-info">
						<li id="field">
							<label>분야</label>
								<select name="field">
									<option value="dev">개발</option>
									<option value="plan">기획</option>
									<option value="design">디자인</option>
								</select>			
						</li>
						
						<li id="career">
							<label>희망 경력</label>
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
						</li>
						
						<li id="lang">
							<label>사용 기술</label>
								<label><input type="checkbox" name="lang" value="Python">Python</label>
								<label><input type="checkbox" name="lang" value="Django">Django</label>
								<label><input type="checkbox" name="lang" value="Java">Java</label>
								<label><input type="checkbox" name="lang" value="JSP">JSP</label>
								<label><input type="checkbox" name="lang" value="Spring">Spring</label>
								<label><input type="checkbox" name="lang" value="Html">Html</label>
								<label><input type="checkbox" name="lang" value="JavaScript">JavaScript</label>
								<label><input type="checkbox" name="lang" value="React">React</label>
								<label><input type="checkbox" name="lang" value="C">C</label>
								<label><input type="checkbox" name="lang" value="C++">C++</label>
								<label><input type="checkbox" name="lang" value="C#">C#</label>
								<label><input type="checkbox" name="lang" value="SQL">SQL</label>				
								<label><input type="checkbox" name="lang" value="R">R</label>
						</li>
						
						<li id="projectimg">
							<label >프로젝트 대표 이미지</label>
								<input type="file" name="projectimg" multiple="multiple">
						</li>
						
						<li id="projectdetail">
							<label>프로젝트 설명</label>
								<input type="text" name="projectdetail" >
						</li>
					</ul>
					
					<ul class="condition-info">	
						<li id="employtype">
							<label>찾는 활동 유형</label>
								<label><input type="radio" name="employtype" value="sfree">개인 프리랜서</label>
								<label><input type="radio" name="employtype" value="tfree">팀 프리랜서</label>
								<label><input type="radio" name="employtype" value="sbusiness">개인 사업자</label>
								<label><input type="radio" name="employtype" value="cbusiness">법인 사업자</label>
						</li>
						
						<li id="projecttype">
							<label>프로젝트 진행 유형</label>
								<label><input type="checkbox" name="projecttype" value="side">사이드 프로젝트</label>
								<label><input type="checkbox" name="projecttype" value="main">메인 프로젝트</label>
						</li>            
								
						<li id="worktype">
							<label>가능한 업무 방식</label>
								<label><input type="checkbox" name="worktype" value="online">원격</label>
								<label><input type="checkbox" name="worktype" value="office">상주</label>
								<label><input type="checkbox" name="worktype" value="discuss">협의</label>
						</li>
						
						<li id="location"> <!--  업무 방식이 사무실 또는 협의인 경우  -->
							<label>선호 업무 지역</label>
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
						</li>
									
						<li id="period">
							<label>업무 시작 일자</label>
								<input type="date" name="period">
						</li>
						
						<li id="available">
							<label>구인활동여부</label>
							<select name="available">
								<option value="1">on</option>
								<option value="0">off</option>
							</select>
						</li>
						
						<li id="pay">
							<label>계약금</label>
								<input type="text" name="pay"  placeholder=", 없이 입력">만원
						</li>
						
						<li id="introduce">
							<label>소개</label>
								<input type="text" name="introduce" >
						</li>
					</ul>
					
					<hr>
					<div class="wrapper-submit">
						<input type="submit" value="등록하기" />
					</div>
				</div>
			</form>	
		</section>
<%	}
%>