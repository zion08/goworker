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
작성자 : <%=dto.getId() %><br />
언어 : <%=dto.getLang() %><br />
위치 : <%=dto.getLocation() %><br />
프로젝트 종류 :<%=dto.getProjecttype() %><br />
요구 경력 : <%=dto.getCareer() %><br />
예상 기간 : <%=dto.getPeriod() %><br />
예상 급여 : <%=dto.getPay() %><br />
근무 형태 : <%=dto.getWorktype() %><br />
게시 날짜 : <%=dto.getRegdate() %><br />
조회 : <%=dto.getReadcount() %><br />
<input type="button" value="좋아요">
<input type="button" value="목록" 
	onclick="window.location='s-project_list.jsp?pageNum=<%=pageNum%>'" />
	
<%
//글 수정은 못하게 만들고 프로젝트는 따로 작성할때 점검과정을 통해 만들어지게
%>