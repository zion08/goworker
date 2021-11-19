<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<html>
<head>
    <title>탈퇴 화면</title>
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
    <br><br><br>
    <% 
if(sid == null){%>		
	<script>
		alert("로그인후 사용가능합니다. ");
		window.location="login.jsp";
	</script>
<%}else{%>
	<form action="deletePro.jsp" method="post">
			 <input type="hidden" name="id" value="<%=sid%>" />
		       <table>
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="password" name="password" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
		     <input type="button" value="취소" onclick="javascript:window.location='../main/index.jsp'">
			 <input type="submit" value="탈퇴" />
	</form>
<%}%>
</body>
<br/>
<%@ include file = "/include/footer.jsp" %>
</html>