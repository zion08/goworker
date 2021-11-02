<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bean.SmemberDAO" %>

<jsp:useBean class="bean.SmemberDTO" id="dto" />   
<% String num= request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	/* String id = (String)session.getAttribute("id"); */
	SmemberDAO dao = new SmemberDAO();
	dto = dao.getContent(dto);

%>

<html>
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
<center>
<div class="input" >
	<form action="s-member_updatePro.jsp" method="post" >
	<table border="1" width="70%" class="input_board">
	<tr>
		<th>아이디</th>
		<td><%=dto.getId()%> 
    			 <input type="hidden" name="writer" value="<%=dto.getId()%>" />	
	</tr>
	<tr>
			<th>경력</th>	
			<td>
			<select name="career">
				<option value="신입">신입</option>
				<option value="1년차">1년차</option>
				<option value="2년차">2년차</option>
				<option value="3년차">3년차</option>
				<option value="4년차">4년차</option>
				<option value="5년차">5년차</option>
				<option value="6년차">6년차</option>
				<option value="7년차이상">7년차이상</option>
			</select>
			</td>
		</tr>
	<tr>
		<th>분야</th>
		<td><select name="field">
				<option value="개발">개발</option>
				<option value="기획">기획</option>
				<option value="디자인">디자인</option>
				<option value="기타">기타</option>
		</select>
			
		</td>
	</tr>
	<tr>
		<th>개발언어</th>
		<td><input type="text" name="lang" /></td>	
	</tr>
	<tr>
			<th>업무방식</th>	
			<td><select name="worktype">
				<option value="전체">상관없음</option>
				<option value="온라인">온라인</option>
				<option value="사무실">사무실</option>
				<option value="의견조율">의견조율</option>
				</select>
			</td>
		</tr>
	<tr>
		<th>지역</th>
		<td><select name="location">
			<option value="전체">상관없음</option>
			<option value="서울">서울</option>
			<option value="경기">경기</option>
			<option value="인천">인천</option>
			<option value="강원">강원</option>
			<option value="충북">충북</option>
			<option value="충남">충남</option>
			<option value="대전">대전</option>
			<option value="세종">세종</option>
			<option value="전북">전북</option>
			<option value="전남">전남</option>
			<option value="광주">광주</option>
			<option value="경북">경북</option>
			<option value="경남">경남</option>
			<option value="대구">대구</option>
			<option value="울산">울산</option>
			<option value="부산">부산</option>
			<option value="제주">제주</option>
		</select></td>	
	</tr>
	<tr>
		<th>고용타입</th>
		<td><select name="employtype">
			<option value="토이/사이드">토이/사이드</option>
			<option value="계약직">계약직</option>
			<option value="정규직">정규직</option>
			<option value="기타">기타</option>
		</select></td>	
	</tr>
	<tr>
		<th>프로젝트타입</th>
		<td><select name="projecttype">
			<option value="토이/사이드">토이/사이드프로젝트</option>
			<option value="메인프로젝트">메인프로젝트</option>
		</select></td>	
	</tr>
	
	<tr>
		<th>희망급여</th>
		<td><input type="text" name="pay" placeholder="단위는 만원">
		</td>		
	</tr>
	<tr>
		<th>근무가능일자</th>
		<td><input type="text" name="period" placeholder="년/월/일 부터"/></td>	
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="phone" placeholder="기존정보 불러오기"/></td>	
	</tr>
	<tr>
		<th>이메일주소</th>
		<td><input type="text" name="email" placeholder="기존정보 불러오기"/></td>	
	</tr>
	<tr>
		<th>카카오톡</th>
		<td><input type="text" name="kakao" placeholder="카카오톡 아이디"/></td>	
	</tr>
	<tr>
		<th>포트폴리오</th>
		<td><input type="text" name="portfolio"/></td>	
	</tr>
	<tr>
		<th>소개</th>
		<td><textarea rows="10" cols="40" name="introduce"></textarea></td>	
	</tr>
	<tr>
		<th>구직활동여부</th>
		<td><select name="available">
				<option value="1">on</option>
				<option value="0">off</option>
		</select> 
			
		</td>
	</tr>
	</table> <br/>
	<hr color="skyblue" size="2" width="600" align="center"><br/>
		<input type="submit" value="작성하기"/>
	
	</form>


</div>
</center>

</html>