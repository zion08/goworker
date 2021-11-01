<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
프로젝트 명<input type="text" name="projectName">
<input type="text" name="">
<form action=s-projectPro.jsp method="post">
	경력<br />
	<input type=radio name="career" checked>신입
	<input type=radio name="career">1년이하
	<input type=radio name="career">1년~2년
	<input type=radio name="career">2년~3년
	<input type=radio name="career">4년이상<br />
	
	사용기술<br />
	<input type=checkbox name="lang" value="Python">Python
	<input type=checkbox name="lang" value="Java">Java
	<input type=checkbox name="lang" value="JavaScript">JavaScript
	<input type=checkbox name="lang" value="JavaServerPage">JavaServerPage
	<input type=checkbox name="lang" value="Spring">Spring
	<input type=checkbox name="lang" value="Html">Html<br />
	<input type=checkbox name="lang" value="C">C
	<input type=checkbox name="lang" value="C++">C++
	<input type=checkbox name="lang" value="C#">C#
	<input type=checkbox name="lang" value="SQL">SQL
	<input type=checkbox name="lang" value="R">R
	<input type=checkbox name="lang" value="Django">Django
	<input type=checkbox name="lang" value="React">React<br />
	
	업무 방식<br />
	<input type=checkbox name="worktype" value="">원격
	<input type=checkbox name="worktype" value="">상주
	<input type=checkbox name="worktype" value="">협의<br />
	
	프로젝트 유형<br />
	<input type=checkbox name="projecttype" value="메인 프로젝트">메인 프로젝트
	<input type=checkbox name="projecttype" value="사이드 프로젝트">사이드 프로젝트
	<br />
	
	계약<br />
	<input type=radio name="employtype">정규직
	<input type=radio name="employtype">계약직<br />
	
	프로젝트 예상기간
	<SELECT multuple size="1" name="period">
		<option>프로젝트 예상기간</option>
		<option>7일</option>
		<option>15일</option>
		<option>30일</option>
		<option>60일</option>
		<option>90일</option>
		<option>180일</option>
		<option>365일 이상</option>
	</SELECT><br />
	
	지역
	<input type="text" name="location" value="시,군,구"><br />
	
	예상금액
	<SELECT multuple size="1" name="pay">
		<option>프로젝트 예상금액</option>
		<option>100만 원</option>
		<option>200만 원</option>
		<option>300만 원</option>
		<option>400만 원</option>
		<option>500만 원</option>
		<option>600만 원</option>
		<option>700만 원</option>
		<option>800만 원</option>
		<option>900만 원</option>
		<option>1000만 원</option>
		<option>2000만 원</option>
		<option>3000만 원</option>
		<option>4000만 원</option>
		<option>5000만 원</option>
		<option>5000만 원 이상</option>
	</SELECT><br />
	
	<input type=checkbox name="endProject">모집 마감 프로젝트 숨기기<br />
	
	<input type=checkbox name="sent">이력서 보낸 프로젝트 숨기기<br />
	
	<input type="submit" value="검색">
</form>