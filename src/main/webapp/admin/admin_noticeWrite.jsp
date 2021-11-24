<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.NoticeDAO" %>
<%@ page import="bean.NoticeDTO" %>
<%@ include file = "../include/header.jsp" %>
<%request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean class="bean.NoticeDTO"  id="dto" />
<jsp:setProperty property="*" name="dto" />

<title>공지사항</title>

<%
     
	 String pageNum = request.getParameter("pageNum");
	 NoticeDAO dao = new NoticeDAO();
	 dto = dao.getContent(dto);
	  
     int pageNumber = 1; //기본페이지
     if (request.getParameter("pageNumber") != null){
     pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
     }
	%>
 <form action="/goworker/cs/noticeWritePro.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="num" value="<%=dto.getNum() %>" />
	<input type="hidden" name="pageNum" value="<%=pageNum%>" />
		
	<table class="cs" border=1>
      <h1>공지사항</h1>
    	 <input type="hidden" name="writer" value="관리자" />  <br />
    		<tr>
			      <td width ="100px" align ="center">제 목</td>
			      <th width="300px" colspan=3 align="center">
    	          <input type="text" size="70" name="subject"  />  <br />
    	          </th>
    	     </tr>
             <tr>	
			      <td width="100px" align="center">내 용</td>
			      <td width="300px" colspan=3 align="center">
			        <textarea name="content" cols="60" rows="10" ></textarea></td>
		     </tr>
		     <tr>
		          <td width="100px" align="center">첨부파일</td>
			      <td width="300px" colspan=3 align="center">
    	          <input type="file" name="filename" /></td>
    	     </tr>     
    	     <tr>   
              <%if(dto.getFilename() != null){%> 
    				[<%=dto.getFilename()%>]    
    				<input type="hidden" name="org" value="<%=dto.getFilename()%>" />					
    		  <%}else{%>
    				
    		  <%} %>
    	     <td colspan=2 align="center">
    	         <input type="submit" value="글쓰기" />
    	    </td>
		</tr>
	</table>
 </form><br/>

<%@ include file = "../include/footer.jsp" %>

    
