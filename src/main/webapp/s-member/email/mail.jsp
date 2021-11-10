<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mail Form</title>
</head>
<body>
    <div>
        <form action="mailSend.jsp" method="post" >
            <table border="1" align="center">
                <tr>
                	<th colspan="2">메일 문의</th>
                </tr>
                <tr>
                	<td align="center">프로젝트 명</td>
                	<td width="300px" ><input type="text" name="project" style="width:300px;height:15px;" required/></td>
                </tr>
                <tr>
                	<td align="center">보내는 사람 이름</td>
                	<td><input type="text" name="name" style="width:300px;height:15px;" required/></td>
                </tr>
                <tr>
                	<td align="center">보내는 사람 E-mail</td>
                	<td><input type="text" name="from" style="width:300px;height:15px;" value="goworker123@gmail.com" required/></td>
                </tr>
                <tr>
                	<td align="center">받는 사람 E-mail</td>
                	<td><input type="text" name="to" style="width:300px;height:15px;" required/></td>
                </tr>
                <tr>
                	<td align="center">연락처</td>
                	<td><input type="text" name="number" style="width:300px;height:15px;" /></td>
                </tr>
                <tr>
                	<td align="center">제 목</td>
                	<td><input type="text" name="subject" style="width:300px;height:15px;" required/></td>
                </tr>
                <tr>
                	<td align="center">내 용</td>
                	<td><textarea name="content" style="width:300px; height:200px;" required></textarea></td>
                </tr>
                <tr>
                	<td colspan="2" style="text-align:right;">
                	<input type="submit" value="Send"/> 
                	<input type="reset" value="Reset"/></td>
                </tr>
            </table>
        </form>
    </div>
        
</body>
</html>
