<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "bean.MakeProjectDTO" %>
<%@ page import = "bean.MakeProjectDAO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>


<%
 	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	int pageSize = 5;
	
	if(pageNum == null){
		pageNum ="1"; // 값이 넘어오지 않을 경우 > 첫 페이지
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	
	
	MakeProjectDAO dao = new MakeProjectDAO();
	int count = 0;
	List<MakeProjectDTO> list = null;
	
		count = dao.getCount(); // 전체 글의 갯수
	
	if(count > 0){
		list = dao.getAllList(startRow, endRow);
	}
	
%>


<div class="search-box" align="center">프로젝트 만들기</div>

	<form action="project_search.jsp" method="post" align="center">
		<select>
			<option value="all">전체 </option>
			<option value="title">제목</option>
			<option value="content">프로젝트 내용</option>
		</select>
		<input type="text">
		<input type="submit" value="검색">
	</form>		
	
		
		<table width="700" align="center">
                <tr>
                	<td align="right" bgcolor="pink">
                	<a href="project_input.jsp">글쓰기</a>
                </tr>
        </table>
        
<center>
<%
	if(count == 0){
%>
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
    		<td align="center">
    			게시판에 저장된 글이 없습니다.
    		</td>
   	 </tr>
	</table>

<%}else{ %>

<% 
	for(MakeProjectDTO dto : list) { %>
	
	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
        	<tr>
        		<th width="400px" ><a href="project_detail.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><%=dto.getSubject() %></a></th>
        		<td align="center">
        			<img src="/goworker/s-member/image/view.png" width="20px" height="20px" ><%=dto.getReadcount()%>
        			<img src ="/goworker/s-member/image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>
        		</td>
        		<td width="80px" align="center">
        			<img src="/goworker/s-member/image/image.jpg" width="15px" height="15px"/><br/>
        			<%=dto.getId() %>
        		</td>
        		<td width="100px" align="center" >
        			<%=sdf.format(dto.getReg_date()) %>
        		</td>
        	</tr>
        </table>
     <%} 
}%>      
</center>


<section align="center">
<%
	if(count > 0){
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / 10)* 10 +1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock -1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			if(startPage > 10){
%>				<a href="project_list.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%		}
	
		for (int i = startPage ; i <= endPage ; i++) {
%> 			<a href="project_list.jsp?pageNum=<%=i%>">[<%=i %>] </a>
<%		}
	
		if(endPage < pageCount) {
%>		<a href="project_list.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%		}
	}
%>

</section >
</body>
</html>