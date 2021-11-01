<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
   header{
                display:flex;
                justify-content: left;
                color: blue;
            }
            input[type=submit]{
                background-color: skyblue;
                border:none;
                color:white;
                border-radius: 5px;
                width:25%;
                height:35px;
                font-size: 14pt;
                margin-top:5px;
                shap:circle;
            }
            input[type=button]{
                background-color: skyblue;
                border:none;
                color:white;
                border-radius: 5px;
                width:10%;
                height:20px;
                font-size: 10pt;
                margin-top:5px;
            }
            
            #footer{
                text-align: right;
                font-size:12pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }
            </style>

<html>
<title>마이페이지</title>
   <header>마이페이지 </header>
    <img src = "fileSave"
    width="100" height="100"/>
<%
	String id = (String)session.getAttribute("id");

	if(id == null){%>
		<a href="loginForm.jsp" >로그인</a>
		<a href="inputForm.jsp" >회원가입</a>
		<a href="/web/studyBoard/list.jsp" >게시판</a>
  <%}else{%>
	<h2> <%=id%> 님</h2>
	<div class="sideicon" align="right" width="400" height="70">
		<br/>
		<a href="">쪽지함</a>&emsp;
		<input type="button" name="modify" value="회원정보수정" onclick=" window.location='modify.jsp' "/>&emsp;
		<input type="button" name="logout" value="로그아웃" onclick=" window.location='logout.jsp' "/>&emsp;
	</div>
<hr color="skyblue" size="2"  align="center" />
<br/>
<center>
<div class="input" >
<tr>
    <td><nav>
    <input type="submit" value="프로젝트찾기" onclick=" window.location='modity.jsp' "/>
    <input type="submit" value="팀원찾기" onclick=" window.location='modity.jsp' "/>
    <input type="submit" value="관심목록" onclick=" window.location='like.jsp' "/>
    </nav></td>
</tr>
<tr>    
    <td><section><input type="submit" value="진행중인 프로젝트"/></section></td>
</tr>    
	</table> <br/>
	<hr color="skyblue" size="2" align="center"><br/>	
</div>
</center>
<%}%>
<footer>페이지 하단에 저작권이나 사업자 등록번호 같은 것들</footer>
</html>

