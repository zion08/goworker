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

<link href="style.css" rel="stylesheet" type="text/css">


<title>프로젝트 의뢰</title>
<h2>프로젝트 의뢰</h2>


<%
	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	
	String best= request.getParameter("best"); 

	int pageSize = 7;
	
	if(pageNum == null){
		pageNum ="1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	
	
	
	MakeProjectDAO dao = new MakeProjectDAO();
	int count = 0;
	List<MakeProjectDTO> list = null;
	if(best == null){
		count = dao.getCount();
	
		if(count > 0){
			list = dao.getAllList(startRow, endRow);
		}
	}	
	
	
	
	// 추천 많은 글 순
	if(best != null){
		count = dao.getCount();
		if(count >0){
			list = dao.getBestList(startRow, endRow);
		}
	}

%>


<%-- 기능 버튼 --%>
<section class="section2">
<%
	if(sid != null){
%>	
              <a href="project_input.jsp" >[글 작성하기]</a>
              <a href ="project_list.jsp?best=1" >[추천 많은 글]</a>
<%	}
%>
</section>



<%-- 메인 화면 --%>
<section class="section1">
	<table border="1">
		<tr>
			<th width="480px">제 목</th>
			<th width="130px">조 회</th>
			<th width="100px">작성자</th>
		</tr>
<%
	if(count == 0){
%>
			 <tr>
    				<td align="center" >
    					게시판에 저장된 글이 없습니다.
    				</td>
   		 	</tr>
<%	
	}else{
		for(MakeProjectDTO dto : list){
			MemberDAO mdao = new MemberDAO();
			String result = mdao.getRank(dto.getId());
%>
        	<tr>
        		<th width="400px" height="85px" style="font-size:14.5px">
        			<a href="project_detail.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>">
        			<%=dto.getSubject() %></a>
        		</th>
        		<td align="center" width="90px">
        			<img src="image/view.png" width="20px" height="20px" /><%=dto.getReadcount()%>
        			<img src="image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>
        			<img src="image/thumbs_down.png" width="20px" height="20px"/><%=dto.getDown() %>
        		</td>
        		<td width="85px" align="center" style="font-size:13px">
<%				if(result != null){
%>
<%					if(result.equals("admin")){
%>	
						<img src="image/admin.jpg"  width="40px" height="40px" /><br/>	
<%					}
%>
<%					if(result.equals("manager")){
%>				
						<img src="image/manager.jpg"  width="40px" height="40px" /><br/>
<%					}
%>
<%		  			if(result.equals("member")){
%>
						<img src="image/image.jpg" width="40px" height="40px" /><br/>
<%					}
        		}
%>        			
        				<span class="getid"><%=dto.getId() %><input type="hidden" name="id" value="<%=dto.getId()%>"></span><br/>
        				<span class="regdate"><%=sdf.format(dto.getReg_date()) %></span>
        		</td>
        	</tr>
<%				} 
			}
%>
        </table>
</section>     	      


<%-- 검색 박스 --%>
<section class="section2">
	<form action="project_search.jsp" method="post">
		<select name="colum">
			<option value="subject">제목</option>
			<option value="content">프로젝트내용</option>
			<option value="id">작성자</option>
		</select>
			<input type="text" name="search" />
			<input type="submit" value="검색" />
	</form>		
</section>






<section class="section2">
<%
	if(count > 0){
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / 10)* 10 +1;
		int pageBlock = 7;
		int endPage = startPage + pageBlock -1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			if(startPage > 10){
%>
				<a href="project_list.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%			}
	
		for (int i = startPage ; i <= endPage ; i++) {
%>
			<a href="project_list.jsp?pageNum=<%=i%>">[<%=i %>] </a>
<%		}
	
		if(endPage < pageCount) {
%>
			<a href="project_list.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%		}
%>
<%	}
%>
</section ><br/>


<%@ include file="../include/footer.jsp"%>
