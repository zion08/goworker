<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ page import="bean.MakeProjectDAO" %>

<jsp:useBean class="bean.MakeProjectDTO" id="dto" />
<jsp:setProperty property="num" name="dto" />    

<center><h3>비추천을 누르셨습니다!</h3>
			더 좋은 프로젝트로 찾아뵙겠습니다.</center>   <br/>
			
<%
	MakeProjectDAO dao = new MakeProjectDAO();
		dao.projectDown(dto);
%>

<center>
	<input type="button" value="닫기" onclick="window.close()" />	
</center>