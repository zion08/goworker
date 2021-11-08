<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<title>회원가입</title>

<script>
	function blankCheck()
	{
		idv=document.getElementsByName("id")[0].value;
		emv=document.getElementsByName("email")[0].value;
		passwordv=document.getElementsByName("password")[0].value;
		if(idv=="")
		{
			alert("닉네임을 입력하세요.");	
			return false;
		}
		if(emv=="")
		{
			alert("이메일을 입력하세요.");	
			return false;
		}
		if(passwordv=="")
		{
			alert("비밀번호를 입력하세요.");	
			return false;
		}
	}
</script>
<script>
	function confirmId()
	{
		idv=document.getElementsByName("id")[0].value;
		if(idv=="")
		{
			alert("닉네임을 입력하세요.");
			return false;
		}else
		{
			open('confirmId.jsp?id='+idv,'checkId','width=500,height=500');	
		}
	}
</script>
<script>
	function confirmEm()
	{
		emv=document.getElementsByName("email")[0].value;
		if(emv=="")
		{
			alert("닉네임을 입력하세요.");
			return false;
		}else
		{
			open('confirmEm.jsp?email='+emv, 'checkEmail', 'width=500,height=500');
		}
	}
</script>

<div class="apply-page" align="center">
		<h2>회원가입</h2>
</div>

<form action="applyPro.jsp" method="post" onsubmit="return blankCheck()">
	<div align="center">
		<table border="1">
			<tr>
				<td align="center">i   d : </td>
				<td><input type="text" name="id" placeholder="nickname"  /></td>
				<td align="center"><input type="button" value="id중복확인" onclick="return confirmId();"/><label id="idCheck"></label></td>
			</tr>
			<tr>
				<td align="center">email : </td>
				<td><input type="email" name="email" placeholder="example@goworker.com" /></td>
				<td align="center"><input type="button" value="email중복확인" onclick="return confirmEm();"/><label id="emCheck"></label></td>
			</tr>
			<tr>
				<td align="center">password : </td>
				<td><input type="password" name="password" placeholder="영문+숫자 조합 6자리 이상 입력해주세요." /></td>
			</tr>
		</table>
			<input type="submit" value="회원가입" onclick="applyPro.jsp"/>	
	</div>
</form>












