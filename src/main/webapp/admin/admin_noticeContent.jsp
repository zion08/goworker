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

<head>
<title>공지사항</title>
</head>
<body>
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
<tr>
      <th width = "500px" align = "center">
      <%if(dto.getFilename() != null){ %>
	    첨부파일  : <img src="/goworker/fileSave/<%=dto.getFilename()%>" width = "100px" heigh = "100px">
      <%} %> </th>     
</tr>

</table>
</form>

<input type="button" value="목록" 
	   onclick=" window.location='admin_notice.jsp?pageNum=<%=pageNum%>' "/>

<form action="/goworker/cs/noticeDeletePro.jsp" method="post">
	<input type="hidden" name="pageNum" value=<%=pageNum %> />
	<input type="hidden" name="num" value=<%=dto.getNum() %> />
		<input type="button" value="글수정" onclick=" window.location='/goworker/cs/noticeUpdate.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>' "/>
		<input type="submit" value="글삭제" onclick="button_event()"/>	
</form>
<script>
function button_event(){

	if (confirm("정말 삭제하시겠습니까??") == true){ 
	    document.form.submit();
	    window.loction='/goworker/cs/noticeDeletePro.jsp?num=<%=dto.getNum() %>'
		} else{  
	    	return;
			}
	}

</script>
</body>
<%@ include file = "../include/footer.jsp" %>