<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<link href="../style.css" rel="stylesheet" type="text/css">
<title>프로젝트 검색</title>
    
<header>
	<div class="logo" onclick="window.location='/goworker/main/index.jsp'"></div>

	<div class="wrapper-sideicon">		
		<a href="" class="sideicon1">로그인</a>
		<input type="button" name="signin" value="" class="sideicon2"/>
		<input type="button" name="login" value="로그인" class="sideicon2"/>
	</div>
</header>

<hr color="skyblue" size="2"  align="center" />

<h1>프로젝트 검색</h1>

<form action=s-project_searchPro.jsp method="post">
프로젝트명<input type="text" name="projectName">
<input type="text" name="">
	경력<br />
	<input type=radio name="career" checked>신입
	<input type=radio name="career">1년이하
	<input type=radio name="career">1년~2년
	<input type=radio name="career">2년~3년
	<input type=radio name="career">4년이상<br />
	
	개발 언어 <br />
	<input type=checkbox name="Python" value="Python">Python
	<input type=checkbox name="Java" value="Java">Java
	<input type=checkbox name="JavaScript" value="JavaScript">JavaScript
	<input type=checkbox name="JavaServerPage" value="JavaServerPage">JavaServerPage
	<input type=checkbox name="Spring" value="Spring">Spring
	<input type=checkbox name="Html" value="Html">Html<br />
	<input type=checkbox name="C" value="C">C
	<input type=checkbox name="C++" value="C++">C++
	<input type=checkbox name="C#" value="C#">C#
	<input type=checkbox name="SQL" value="SQL">SQL
	<input type=checkbox name="R" value="R">R
	<input type=checkbox name="Django" value="Django">Django
	<input type=checkbox name="React" value="React">React<br />
	
	업무 방식<br />
	<input type=checkbox name="remote" value="">원격
	<input type=checkbox name="resident" value="">상주
	<input type=checkbox name="discussion" value="">협의<br />
	
	프로젝트 유형<br />
	<input type=checkbox name="side" value="">사이드
	<input type=checkbox name="main" value="">메인
	<br />
	
	계약<br />
	<input type=radio name="employtype">
	<input type=radio name="employtype"><br />
	
	예상기간
	<SELECT multuple size="1" name="period">
		<option value="periodAll">프로젝트 예상 기간/option>
		<option value="7day">7일</option>
		<option value="15day">15일</option>
		<option value="30day">30일</option>
		<option value="60day">60일</option>
		<option value="90day">90일</option>
		<option value="180day">180일</option>
		<option value="365day">365이상</option>
	</SELECT><br />
	
	지역
	<input type="text" name="location" value="시/군/구"><br />
	
	예상 금액
	<SELECT multuple size="1" name="pay">
		<option>프로젝트 예상 금액</option>
		<option>100만원</option>
		<option>200만원</option>
		<option>300만원</option>
		<option>400만원</option>
		<option>500만원</option>
		<option>600만원</option>
		<option>700만원</option>
		<option>800만원</option>
		<option>900만원</option>
		<option>1000만원</option>
		<option>2000만원</option>
		<option>3000만원</option>
		<option>4000만원</option>
		<option>5000만원</option>
		<option>5000만원 이상</option>
	</SELECT><br />
	
	<input type=checkbox name="endProject">모집 종료<br />
	
	<input type=checkbox name="sent">이력서를 보낸 프로젝트 포함<br />
	
	<input type="submit" value="검색">
</form>
