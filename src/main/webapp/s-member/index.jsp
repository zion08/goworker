<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>메인페이지</title>
<style type="text/css">
	html{width:100%;, 
		height:100%;,
		
	}
	header {
	display: flex;
	justify-content: space-between;
	padding: var(--padding);
	}
	section {
	padding : 30px;
	}
	.sign {
	width : 90px;
	height : 30px;
	border-style : groove;
	border-radius : 10%;
	}
	.login {
	width : 90px;
	height : 30px;
	border-style : groove;
	border-radius : 10%;
	}
</style>
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

<meta charset="UTF-8">


<section class="main">
<center>
<form>
	<input type="search"  name="searchmain" placeholder="원하는 분야를 검색하세요"
	style= "width:400px; height:70px; font-size=40px;"/>
	<input type="image" src="/web/saveFile/search.png" width="50" height="50"/>
	</form>
<br/><br/>
<table width="90%">
	<tr>
		<td align="center"><a href="/goworker/s-member/s-member.jsp"><img src="image/find.png" width= "60%" height="60%"style=" display:block;"></a>팀원찾기 </td>
		<td align="center"><img src="image/project.png" width= "60%" height="60%" style=" display:block;">프로젝트찾기</td>
		<td align="center"><img src="image/make.png" width= "60%" height="60%" style=" display:block;">프로젝트만들기</td>
		<td align="center"><img src="image/info.png" width= "60%" height="60%" style=" display:block;">취업정보</td>
		<td align="center"><img src="image/commu.png" width= "60%" height="60%" style=" display:block;">커뮤니티</td>
</table><br/>
</section>

</center>
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

</html>