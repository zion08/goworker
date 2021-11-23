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
	
%>
<%		
     
      int pageNumber = 1; //기본페이지
      if (request.getParameter("pageNumber") != null){
	  pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
      }
	%>
<h1>공지사항 수정</h1>
   <section class="section1">
        <form action="noticeUpdatePro.jsp" method="post" enctype="multipart/form-data">
				<input type="hidden" name="num" value="<%=dto.getNum() %>" />
				<input type="hidden" name="pageNum" value="<%=pageNum%>" />
				<input type="hidden" name="writer" value="관리자" />
				
				  <table class="cs" border=1>

			 <tr>
			      <th width ="100px" align = "center">제 목</th>
			      <th width="300px" colspan=3 align="center">
    	          <input type="text" name="subject" value="<%=dto.getSubject() %>" />  <br />
    	          </th>
    	     </tr>
             <tr>	
			      <td width="100px" align="center">내 용</td>
			      <td width="300px" colspan=3 align="center">
			      <input type="text" size="100" name="content" id="content" style="width:500px;height:100px;" value="<%=dto.getContent() %>"></td>
		     </tr>
		     <tr>
		          <td width="100px" align="center">첨부파일</td>
			      <td width="300px" colspan=3 align="center">  
              <%if(dto.getFilename() != null){%> 
    			   <img src="/goworker/fileSave/<%=dto.getFilename()%>" width = "100px" heigh = "100px">
    		  <%}else{%>
    				[첨부파일 없음]
    		  <%} %>
    		       <input type="file" name="filename" /> 
    		  </td><br />
    		  </table>
    	     <td colspan=2 align="center">
    	         <input type="submit" value="수정" />
    	         
    	    </td>
		</tr>
	    <br/>
     </form>
  </section>
 <br/>
<%@ include file = "/include/footer.jsp" %> 
    
    
    
    
    