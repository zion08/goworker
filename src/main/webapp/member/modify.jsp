<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.MemberDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file = "../include/header.jsp" %>
<title>회원정보수정</title>

<%
	if(sid == null){
%>		<script>
			alert("로그인후 사용가능합니다. ");
			window.location="loginForm.jsp";
		</script>
<%	}else{
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getUserInfo(sid);
%>
<section class="section1">
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
	     	<%if(rank.equals("member")) { %>
		    <td>회원등급 :
			 <select name = 'rank' >
				 <option value = "member">멤버</option>
				 <option value = "manager">매니저</option>
			 </select>
			 &emsp; 현재등급 :[ 멤버 ]
			 </td>
			 <%} %>
			 <%if(rank.equals("manager")) { %>
		    <td>회원등급 :
			 <select name = 'rank' >
			  	<option value = "manager">매니저</option>
				<option value = "member">멤버</option>
			 </select>
			 &emsp; 현재등급 :[ 매니저 ]
			 </td>
			 <%} %>
		</tr>        
	    <tr>           
	    	<td><input type="submit" value="정보 수정" /></td>
	 	</tr> 
	 </table>
	</form>  	
	<%}%>
</section>

<section class="section1">
	프로필 사진 등록
	<form action="modifyProImg.jsp" method="post" enctype="multipart/form-data">
		<input type="file" name="profileimg" multiple="multiple">
		<input type="submit" value="확인" />
	</form>

</section>	
	
<%@ include file = "/include/footer.jsp" %>







