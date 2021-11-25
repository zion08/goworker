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
			window.location="login.jsp";
		</script>
<%	}else{
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getUserInfo(sid);
		String profileimg = dao.getProfileImg(sid);
%>
<section class="section2">
  <form action="modifyPro.jsp" method="post" >  	 
		<ul class="profile-info" >	
			<li id="profile-img" >
<%			if(profileimg == null){
%>				<img src = "../img/profileimg_default.png">
<%			} else {
%>				<img src = "../uploadFile/profileFile/<%=profileimg%>">
<%			     	}
%>
	
			</li>			
			<li id="id">	
			    <label>아이디</label>
					<span><%=sid%></span>
					<input type="hidden" name="id" value="<%=sid%>"/>
			</li>
			<li id=email>
				<label>이메일</label>
			    <input  name="email" value="<%=dto.getEmail()%>"/>
			</li>
			<li id=password>
			    <label>비밀번호 </label>
			    <input type="password" name="password" value="<%=dto.getPassword()%>" />
		    </li>
		    <li id=rank>
			    <%if(rank.equals("member")) { %>
				 <label>회원등급</label>
			      <select name = 'rank' >
				      <option value = "member">멤버</option>
				      <option value = "manager">매니저</option>
				 </select>
				 &emsp; 현재등급 :[ 멤버 ]
				 <%} %>
				<%if(rank.equals("manager")) { %>
				    <label>회원등급</label>
					 <select name = 'rank' >
					  	<option value = "manager">매니저</option>
						<option value = "member">멤버</option>
					 </select>
				 &emsp; 현재등급 :[ 매니저 ]
				  <%} %>
			  </li>
			  
			  <li>
			  </li>
			  
			 <li>
			 	<input type="submit" value="정보 수정"  /> 
			 </li>
			 </ul>
	</form>
</section>

<div style="width: 30%; margin: 0 auto;">
	<form action="modifyProImg.jsp" method="post" enctype="multipart/form-data">
			<input type="file" name="profileimg" multiple="multiple"><br/>
			<input type="submit" value="확인" />
	</form>
</div>
		  
<%}%>
<br/><br/>	
<%@ include file = "/include/footer.jsp" %>







