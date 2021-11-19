<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "bean.MakeProjectDTO" %>
<%@ page import = "bean.MakeProjectDAO" %>
<%@ page import="java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ page import = "bean.MemberDAO" %>

<%@ include file = "../include/header.jsp" %>


<%

	request.setCharacterEncoding("UTF-8");

	int pageSize = 5;
	
	String colum = request.getParameter("colum");
	String search = request.getParameter("search");
	

	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");

	
	String id = (String)session.getAttribute("id");
	
	
	if(pageNum == null){
		pageNum ="1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1) * pageSize +1;
	int endRow = currentPage * pageSize;
	
	MakeProjectDAO dao = new MakeProjectDAO();
	
	int count = 0;
	
	List<MakeProjectDTO> list = null;
	
	if(id == null){
		count = dao.getSearchCount(colum, search); // 전체 글 수
		if(count > 0){
			list = dao.getSearchList(colum, search, startRow, endRow);
		}
	}
%>
<div class="search-box" align="center">프로젝트 검색 한 결과 페이지</div>

<%
	if(sid != null) {
%> 		<table width="700" align="center">
                <tr>
                	<td align="right" bgcolor="pink">
                	<a href="project_input.jsp">글쓰기</a>
                </tr>
    	</table>
   <%} %>
    
    
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
	for(MakeProjectDTO dto : list) { 
	
		MemberDAO mdao = new MemberDAO();
		String result = mdao.getRank(dto.getId());
	
	%>
	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
        	<tr>
        		<th width="400px" height="70px" ><a href="project_detail.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><%=dto.getSubject() %></a></th>
        		<td align="center">
        			<img src="/goworker/s-member/image/view.png" width="20px" height="20px" ><%=dto.getReadcount()%>
        			<img src ="/goworker/s-member/image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>
        			<img src ="/goworker/makeproject/image/thumbs_down.png" width="20px" height="20px"/><%=dto.getDown() %>
        			
        		</td>
        		<td width="80px" align="center">
        		
<%				if(result != null){ %>
<%				if(result.equals("admin")){%>	
					<img src="/goworker/makeproject/image/admin.jpg"  width="40px" height="40px" /></br>	
				<%} %>
<%				if(result.equals("manager")){%>				
					<img src="/goworker/makeproject/image/manager.jpg"  width="40px" height="40px" /></br/>
					<%} %>
<%		  		if(result.equals("member")){ %>
        			<img src="/goworker/makeproject/image/image.jpg" width="40px" height="40px"/><br/>
        			<%}
				}%>
        			<%=dto.getId() %><input type="hidden" name="id" value="<%=dto.getId()%>">
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

    
    