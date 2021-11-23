<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.CsDAO" %>
<%@ page import="bean.CsDTO" %>
<%@ include file = "../include/header.jsp" %>
<%request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean class="bean.CsDTO"  id="dto" />
<jsp:setProperty property="*" name="dto" />

<title>문의사항</title>


<%		
      String id = null;
      if(session.getAttribute("sid") != null){
   	  id = (String) session.getAttribute("sid");
      }

  	  String pageNum = request.getParameter("pageNum");
  	  CsDAO dao = new CsDAO();
  	  dto = dao.getContent(dto);
  		
      int pageNumber = 1; //기본페이지
      if (request.getParameter("pageNumber") != null){
	  pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
      }
	%>
<br/>
<h1>문의사항 수정</h1>
  <section class="section1">
      <form action="csUpdatePro.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<input type="hidden" name="pageNum" value="<%=pageNum%>" />				
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
	    		</tr>
	       </table>	       
	    	     <td colspan=2 align="center">
    	            <input type="button" value="목록" onclick=" window.location='cs.jsp?pageNum=<%=pageNum%>' "/>

<%          // 로그인된 id 와 글작성자 비교
      if(sid != null){
		if(sid.equals(dto.getWriter()) || cid.equals("admin")){
%>		<input type="submit" value="수정" />
		<input type="button" value="삭제" onclick = "csDelete.jsp"/>	
<%  	}
	}
%>
    	</td>
    </form>
</section> 
<br/>
<%@ include file = "/include/footer.jsp" %>
    
    
    
    
    