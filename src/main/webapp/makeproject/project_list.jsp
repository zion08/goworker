<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "bean.MakeProjectDTO" %>
<%@ page import = "bean.MakeProjectDAO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>

<%@ page import ="bean.MakeProject_CommentDTO" %>
<%@ page import ="bean.MakeProject_CommentDAO" %>

<%@ page import = "bean.MemberDAO" %>

<%@ include file = "../include/header.jsp" %>



<%
 	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	
	String best= request.getParameter("best"); 

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
	if(best == null){
		count = dao.getCount(); // 전체 글의 갯수
	
		if(count > 0){
			list = dao.getAllList(startRow, endRow);
		}
	}	
	if(best != null){
		count = dao.getCount(); // 전체 글의 갯수
		if(count >0){
			list = dao.getBestList(startRow, endRow);
		}
	}
	

%>


<h2>프로젝트 만들기</h2>
<div class="search2">
	<form action="project_search.jsp" method="post" align="right">
		<select name="colum">
			<option value="subject">제목</option>
			<option value="content">프로젝트 내용</option>
			<option value="id">아이디</option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색" />
	</form>		
</div>
	
<center>

<%
	if(sid != null){
%>	
			<table width="705" height="30px" align="center">
            	    <tr>
                		<td align="right" bgcolor="pink" >
                		<a href="project_input.jsp" >글 작성하기</a> / 
                		<a href ="project_list.jsp?best=1" >좋아요 많은 글</a>
                		
               		</tr>
        	</table>
<%} %>




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
		
		MakeProject_CommentDAO cd = new MakeProject_CommentDAO();	
		int comment_count = 0;
		int board_num = dto.getNum();
		comment_count = cd.getCommentCount(board_num);
		
		MemberDAO mdao = new MemberDAO();
		String result = mdao.getRank(dto.getId());
%>
	
	<table border="1" width="700"  cellpadding="0" cellspacing="0" align="center"> 
        	<tr>
        		<th width="400px" height="70px" ><a href="project_detail.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>">
        			<%=dto.getSubject() %></a> [<%=comment_count %>]</th>
        		<td align="center" width="140px">
        			<img src="/goworker/makeproject/image/view.png" width="20px" height="20px" /><%=dto.getReadcount()%>
        			<img src ="/goworker/makeproject/image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>
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
					<% }
        		}%>        			
        				<%=dto.getId() %><input type="hidden" name="id" value="<%=dto.getId()%>">
        		</td>
        		<td width="60px" align="center" >
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



<%@ include file="../include/footer.jsp"%>


</body>
</html>