<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>탈퇴 화면-테스트</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    
    <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        }
    </script>
    
</head>
<body>
 
    <br><br>
    <b><font size="6" color="gray">내 정보</font></b>
    <br><br><br>
    <% String id = (String)session.getAttribute("id"); 
if(id == null){%>		
	<script>
		alert("로그인후 사용가능합니다. ");
		window.location="loginForm.jsp";
	</script>
<%}else{%>
	<form action="deletePro.jsp" method="post">
			 <input type="hidden" name="id" value="<%=id%>" />
		       <table>
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="password" name="pw" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
		     <input type="button" value="취소" onclick="javascript:window.location='main.jsp'">
			 <input type="submit" value="탈퇴" />
	</form>
<%}%>
</body>
</html>