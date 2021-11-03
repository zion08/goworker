<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SprojectDTO" %>
<%@ page import="bean.SprojectDAO" %>

<jsp:useBean class="bean.SprojectDTO" id="dto" />
<jsp:setProperty property="num" name="dto" />

<%
	String pageNum = request.getParameter("pageNum");
	SprojectDAO dao = new SprojectDAO();
	dao.readCountUp(dto);
	dto = dao.getContent(dto);
	session.setAttribute("num", dto.getNum());
%>
글 제목 : <%=dto.getProjectName() %>
작성자 : <%=dto.getId() %>
언어 : <%=dto.getLang() %>
위치 : <%=dto.getLocation() %>
프로젝트 종류 :<%=dto.getProjecttype() %>
요구 경력 : <%=dto.getCareer() %>
예상 기간 : <%=dto.getPeriod() %>
예상 급여 : <%=dto.getPay() %>
근무 형태 : <%=dto.getWorktype() %>
게시 날짜 : <%=dto.getRegdate() %>
조회 : <%=dto.getReadcount() %>
<input type="button" value="좋아요">
<input type="button" value="목록" 
	onclick="window.location='list.jsp?pageNum=<%=pageNum%>'" />
	
<%
//글 수정은 못하게 만들고 프로젝트는 따로 작성할때 점검과정을 통해 만들어지게
%>

