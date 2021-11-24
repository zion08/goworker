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
	<table border=1  align="center" >
	    <tr>
	      <td align="center"width="90px" height="4"   align="center">작성자</td>
	      <td align="center">
	      <%=dto.getWriter() %> </td>
	      <td align="right" width="200px">
	      <%=dto.getRegdt() %> </td>
	    </tr>
	    <tr>
	      <td align="center"  width="90px" height="4">제목</td>
	      <td  colspan="2" align="center" style="font-size:18px">
	      <%=dto.getSubject() %></td>
	    </tr>
	    <tr>
	      <td align="center" width="90px" >내 용</td>
	       <td colspan="2" >
			<textarea name="content" id="contenet"  maxlength="2000px"  
			style="font-size:14px" cols="62" rows="10"  readonly><%=dto.getContent() %></textarea>	      
           </td>	    
	     </tr>
	    <tr>
<%    if(dto.getFilename() != null){ %>
	    <td align="center" width="90px">첨부파일</td>
	      <td colspan="2" align="center">
		  <img src="../uploadFile/csFile/<%=dto.getFilename()%>" width = "300px"height="300px">
	      </td>				    
	     </tr>
	<%} %>
		</table>
  </section><br/>	
 <center>		
    <input type="button" value="목록" 
	        onclick=" window.location='notice.jsp?pageNum=<%=pageNum%>' "/>
<%       
        // 로그인된 id 와 글작성자 비교
        if(sid!=null){
        if(rank.equals("admin")){
%>		<input type="button" value="글수정" onclick=" window.location='noticeUpdate.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>' "/>
		<input type="button" value="글삭제" onclick=" window.location='noticeDelete.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>' "/>	
<%  		}
      	}
%>
 </center>
 <br/>
<%@ include file = "/include/footer.jsp" %> 