<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SprojectDTO" %>
<%@ page import="bean.SprojectDAO" %>
<%@ page import ="java.util.List" %>
<%
	int pageSize = 20;
	String id = (String)session.getAttribute("id");
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage - 1) * pageSize + 1;
	int end = currentPage * pageSize;
	SprojectDAO dao = new SprojectDAO();
	
	int count = 0;
	List<SprojectDTO> list = null;
	
	count = dao.getCount();
	if (count > 0 ) {
		list = dao.getAllList(start , end);
	}else{	
	}
	
	//if(id != null){
		%>		<input type="button"  value="프로젝트 등록" onclick="window.location='s-project_input.jsp' "/>
		<%//}  %>
	<%=count %>
<table border="1">
	<tr>
		<th>글번호</th><th>제목</th><th>작성자</th><th>경력</th><th>예상기간</th><th>예상금액</th>프로젝트 타입<th>지역</th><th>작성일</th>
	</tr>
	
	<%if(count == 0){ %>
		<tr>
			<td colspan="6">게시글이 없습니다</td>
		</tr>
	<%}else{ %>
<% 		for(SprojectDTO dto : list){%>
	<tr>
		<td><%=dto.getNum() %></td>
		<td><a href="s-project_detail.jsp?num=<%=dto.getNum() %>&pageNum=<%=pageNum %>"><%=dto.getId() %></a></td>
		<td><%=dto.getId() %></td>
		<td><%=dto.getCareer() %></td>
		<td><%=dto.getPeriod() %></td>
		<td><%=dto.getPay() %></td> 
		<td><%=dto.getProjecttype() %></td>
		<td><%=dto.getLocation() %></td>
		<td><%=dto.getRegdate() %></td>
	</tr>	
		<%} 
		} %>
</table>
<%
	if(count > 0){
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / 20) * 10 + 1;
		int pageBlock = 20;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		if(startPage > 20){%>
			<a href="list.jsp?pageNum=<%=startPage-20 %>">[이전]</a>
		<% }
		for(int i = startPage ; i <= endPage ; i++){
		%>	<a href="list.jsp?pageNum=<%=i %>">[<%=i%>]</a>
		<%} 
		if(endPage < pageCount){%>
		<a href="list.jsp?pageNum=<%=startPage + 20 %>">[다음]</a>
	  <%}
	} 
%>
