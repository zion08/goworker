<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.MemberDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<link href="style.css" rel="stylesheet" type="text/css" >
<title>회원정보수정</title>
<html>
   <header>
   <div class="logo" onclick="window.location='/goworker/main/s-member/index.jsp'"></div>    
   </header>
   <hr color="skyblue" size="2"  align="center"  />
<%
	String sid = (String)session.getAttribute("sid");
	if(sid == null){
%>		<script>
			alert("로그인후 사용가능합니다. ");
			window.location="loginForm.jsp";
		</script>
<%	}else{
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getUserInfo(sid);
%>
<body>
<form action="modifyPro.jsp" method="post">
		<input type="hidden" name="id" value="<%=sid%>" /> 
 <table border="1" align="center">
	<tr>
		<td>아이디 : <%=sid%> </td>
	</tr>
 	<tr>		
		<td>email : <%=dto.getEmail()%>
		<input type="hidden" name="email" value="<%=dto.getEmail()%>"/></td>
	</tr>
	</fome>
	<form action="pw_change.jsp" method="post">
	<tr>
        <td>비밀번호 : <input type="password" name="password" value="<%=dto.getPassword()%>" /></td>
    </tr>
     <tr>
	    <td align="center">회원등급 : </td>
		 <select name = 'rank' >
			 <option value = "member">멤버</option>
			 <option value = "manager">매니저</option>
		 </select>
	</tr>        
    <tr>           
    	<td><input type="submit" value="정보 수정" /></td>
 	</tr> 
 </table>
</form>  
</body> 
	<%}%>
	<footer>
<hr color="skyblue" size="2"  align="center" />
<table align="right">
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






