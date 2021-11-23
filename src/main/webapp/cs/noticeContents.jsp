<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.MemberDTO" %>
<%@ page import="bean.SmemberDAO" %>
<%@ page import="bean.SmemberDTO" %>
<%@ page import="bean.NoticeDTO" %>
<%@ page import="bean.NoticeDAO" %>
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>

<jsp:useBean class="bean.NoticeDTO"  id="dto" />
<jsp:setProperty property="num" name="dto" />

<title>공지사항</title>
<br/>
<%		
      String id = null;
      if(session.getAttribute("sid") != null){
   	  sid = (String) session.getAttribute("sid");
      }
      int pageNumber = 1; //기본페이지
      if (request.getParameter("pageNumber") != null){
	  pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
      }
	%>
<%
	  String pageNum = request.getParameter("pageNum");
	  NoticeDAO dao = new NoticeDAO();
	  dao.readCountUp(dto);  // 조회수 증가 
	  dto = dao.getContent(dto);
%>
 <section class="section1">	
	 <form>
	   <table class="cs" border=1>
	    <tr>
	      <th width = "500px" align = "center">작성자 : <%=dto.getWriter() %> </th>
	    </tr>
	    <tr>
	      <th width = "500px" align = "center">작성일 : <%=dto.getRegdt() %> </th>
	    </tr>
	    <tr>
	      <th width = "500px" align = "center">제 목 : <%=dto.getSubject() %> </th>
	    </tr>
	    <tr>
	      <th width = "500px" hight = "300px" align = "center">내 용 : <%=dto.getContent() %> </th>
	      
	    </tr> 
<%    if(dto.getFilename() != null){ %>
	    <tr>
	      <th width = "500px" align = "center">
		      첨부파일  : <img src="/goworker/fileSave/<%=dto.getFilename()%>" width = "100px" heigh = "100px">
	      </th>     
	    </tr>
	    <%} %>
      </table>
    </form>

<input type="button" value="목록" 
	   onclick=" window.location='notice.jsp?pageNum=<%=pageNum%>' "/>

<%       
        // 로그인된 id 와 글작성자 비교
        if(sid!=null){
        if(sid.equals("admin")){
%>		<input type="button" value="글수정" onclick=" window.location='noticeUpdate.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>' "/>
		<input type="button" value="글삭제" onclick=" window.location='noticeDelete.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>' "/>	
<%  		}
      	}
%>
  </section>
 <br/>
<%@ include file = "/include/footer.jsp" %> 