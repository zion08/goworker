<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	* {
	  box-sizing: border-box;
	  margin: 0;
	}
	
	.wrapper{
		display: flex;
		align-items: center;
	    justify-content: center;
		height: 75%
	}
	
	.info-box{
		text-align: center;
		margin: 50px 0 30px 0;
	}	
	
	.submit-box{
		text-align: center;
		margin: 10px 0 50px 0;
	}
		
		.submit-box > input {
			font-size: 20px;
		}
	
	input::placeholder {
	  font-size: 14px;
	  color: rgb(134 134 134);
	  padding-left: 10px;  
	}
	
	fieldset{
		width: 500px;
		display: flex;
		flex-direction: column;	  	
	}
	
	input{
		margin: 15px;
		font-size: 25px;
		width: 70%;
	}
	
	a, label{
		text-decoration: none;
		float: right;
		font-size: 15px;
	    color: rgb(134 134 134);
	    margin-right: 39px;
	}
</style>


<div class=wrapper>
	<form action="loginPro-test.jsp" method="post" target="_blank">	
		<fieldset>
			<div class="info-box">
				<input type="text" name="id" placeholder="아이디를 입력하세요"/>
				<input type="password" name="password" placeholder="비밀번호를 입력하세요"/>
			</div>
			
			<div class="submit-box">
				<input type="submit" value="로그인" /><br/>
				<label><a href="join.jsp">회원가입</a></<label>
			</div>				
		</fieldset>
	</form>
</div>
