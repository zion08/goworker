<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDAO" %>
<jsp:useBean class="bean.SmemberDTO"  id="dto" />
<jsp:setProperty property="num" name="dto" /> 


<h1>싫어요를 눌렀습니다!</h1>
<% SmemberDAO dao = new SmemberDAO();
	dao.goodDown(dto);
%>
<center>
	<input type="button" value="닫기" onclick="window.close()" />
</center>	