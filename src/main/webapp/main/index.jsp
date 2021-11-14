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
		<div id="mproject" onclick="window.location='/goworker/makeproject/project_detaion.jsp'">
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

<footer>
<hr color="skyblue" size="2"  align="center" />
<table width="500" align="right">
      
      <thead align="center">
        <tr>
          <th></th>
          <th>메인</th>
          <th>회원</th>
          <th>고객센터</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><a href="">사이트소개</a></td>
          <td><a href="/goworker/s-member/s-member.jsp">팀원찾기</a></td>
          <td>회원가입</td>
          <td>공지사항</td>
          
        </tr>
        <tr>
          <td>이용방법</td>
          <td>프로젝트찾기</td>
          <td>회원정보수정</td>
          <td>Q&A</td>
        </tr>
        <tr>
          <td></td>
          <td>프로젝트만들기</td>
          <td>회원탈퇴</td>
          <td></td>
        </tr>
        <tr>
            <td></td>
            <td>취업정보</td>
            <td></td>
            <td></td>
          </tr>
        <tr>
          <td></td>
          <td>커뮤니티</td>
          <td></td>
          <td></td>
        </tr>
      </tbody>
      
    </table>
</footer>
