<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.MakeProjectDTO" %>
<%@ page import = "bean.MakeProjectDAO" %>
<%@ include file = "../include/header.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
    
<jsp:useBean class= "bean.MakeProjectDTO"  id="dto" />



<form action="project_inputPro.jsp" method="post" enctype="multipart/form-data">

<center>
	<table border="1"  cellpadding="0" cellspacing="0" align="center"> 
		<tr>
			<th colspan="2" align="center">프로젝트 신청 글 작성</th>
		</tr>
		<tr>
			<td>아이디</td>
			<td><%=sid%></td>
		</tr>
        <tr>
        	<td align="center">제목</td>	
        	<td width="300px"><input type="text" size="70" name="subject" maxlength="100"/></td> 
        </tr>
        <tr>
        	<td align="center">내용</td>
        	<td><textarea name="content" maxlength="2000px" style="width:500px;height:300px"></textarea></td>
        </tr>
        <tr>
        	<td align="center">첨부파일</td>
        	<td><input type="file" name="projectfile" multiple="multiple"/></td>
        </tr>
        <tr>
        	<td colspan="2" align="center">
        		<input type="submit" value="작성하기" />
        		<input type="reset" value="다시작성" />
        	</td>
        </tr>
        
    </table>
</center>
</form>