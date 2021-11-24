<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="bean.NoticeDTO" %>
<%@ page import="bean.NoticeDAO" %>
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>

<title>공지사항</title>

<%		
      String id = null;
      if(session.getAttribute("sid") != null){
   	  id = (String) session.getAttribute("sid");
      }
      int pageNumber = 1; //기본페이지
      if (request.getParameter("pageNumber") != null){
	  pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
      }
	%>

<h2>공지사항</h2>

<section class="section1">
	<input type="button" value="관리자 홈" onclick="window.location='admin.jsp'" />
<%
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	
	 
	if(pageNum == null){		
		pageNum="1";	
	}	
	
	int currentPage = Integer.parseInt(pageNum); 
	int start = (currentPage-1) * pageSize + 1;  
	int end = currentPage * pageSize;
	NoticeDAO dao = new NoticeDAO();
		
	int count = 0;
	List<NoticeDTO> list = null;
	
    count = dao.getCount(); // 전체글 수 
    if(count > 0){
	    list = dao.getAllList( start , end );
		}
%>
<section class="section1">
     <table  border=1 width="800px" style="table-layout:fixed">
	   <tr>
		    <th width="70">글번호</th>
		    <th width="100">작성자</th>
		    <th width="350">제목</th>
		    <th width="150">작성일</th>
		    <th width="70">조회</th>
	    </tr>
	<%if(count == 0){%>
		<tr>
			<td colspan="6">저장된 글이 없습니다...!!</td>
		</tr>	
	<%}else{%>
	<%
      for(NoticeDTO dto : list){%>
		<tr>
			<th width="70"><%=dto.getNum()%></th>
			<th width="100"><%=dto.getWriter()%></th>
		    <th width="350"style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"><a href="/goworker/admin/admin_noticeContent.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><%=dto.getSubject()%></a></th> 	
		    <th width="150"><%=dto.getRegdt()%></th>
			<th width="70"><%=dto.getReadcount()%></th>
	</tr>		
<%	}
}%>
	</table>
 </section>
</section>

<section class="section2"> 
<%
	if(count > 0){
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / 10) * 10 + 1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}	
		if(startPage > 10){%>
			<a href="admin_notice.jsp?pageNum=<%=startPage-10%>">[이전]</a>
		<%}
		for(int i = startPage ; i <= endPage ; i++){
		%>	<a href="admin_notice.jsp?pageNum=<%=i%>">[<%=i%>]</a> 	
	  <%}
		if(endPage < pageCount){%>
		<a href="admin_notice.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
	<%}	
	}
%>
</section>


<section class="section2">
 		<input type="button"  value="글쓰기" onclick="window.location='admin_noticeWrite.jsp' "/>
 		<input type="button" value="취소" onclick= "history.go(-1)"/>
</section>


<%@ include file = "../include/footer.jsp" %>