<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.MakeProjectDTO" %>
<%@ page import = "bean.MakeProjectDAO" %>
<%@ include file = "../include/header.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
    
<jsp:useBean class= "bean.MakeProjectDTO"  id="dto" />
<jsp:setProperty property="*" name="dto" />  


<title>프로젝트 만들기</title>


<center>
	<br/>
	<h3>프로젝트 만들기</h3>
	<br/>
	
	<form action="project_inputPro.jsp" method="post" enctype="multipart/form-data">
		<table border="1"  cellpadding="0" cellspacing="0" align="center"> 
			<tr>
				<td alIgn="center">아이디</td>
				<td align="center"><%=sid %><input type="hidden" name="id" value="<%=sid%>"/></td>
			</tr>
        	<tr>
        		<td align="center">제목</td>	
        		<td width="300px"><input type="text" size="70" name="subject" maxlength="100" required/ ></td> 
       	 	</tr>
       	 	<tr>
        		<td align="center">내용</td>
        		<td><textarea name="content" maxlength="2000px" style="width:500px;height:300px" required></textarea></td>
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
	</form>
</center><br/>

<%@ include file = "/include/footer.jsp" %>
