<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.MemberDTO" %>
<%@ page import="bean.SmemberDTO" %>
<%@ page import="bean.SmemberDAO" %>
<%@ page import="bean.CommentDAO" %>
<%@ page import="bean.CommentDTO" %>
<%@ page import="bean.Comment_SmemberDTO" %>
<%@ page import="bean.Comment_SmemberDAO" %>
<%@ page import="bean.Comment_SprojectDTO" %>
<%@ page import="bean.Comment_SprojectDAO" %>
<%@ page import="bean.SprojectDTO" %>
<%@ page import="bean.SprojectDAO" %>
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>

<html>
<head>
<title>마이페이지</title>
</head><br>

<body>
<div class="input" >
      <input type="submit" value="프로젝트찾기" onclick=" window.location='/goworker/s-project/s-project_list.jsp' "/>
      <input type="submit" value="팀원찾기" onclick=" window.location='/goworker/s-member/s-member.jsp' "/>
      <input type="submit" value="관심목록" onclick=" window.location='favorite.jsp' "/>
</div><br/>

<%	
	String pageNum = request.getParameter("pageNum");
	int pageSize = 5;
	if(pageNum==null) {
	   pageNum = "1"; // 값이 안넘어오는경우 >> 첫페이지인경우 
	}
	int currentPage = Integer.parseInt(pageNum);
	int mstart = (currentPage - 1) * pageSize + 1;		
	int mend = currentPage * pageSize;
	
	SmemberDAO sdao = new SmemberDAO();
	int count = 0; 
	List<SmemberDTO> slist = null;	
	count = sdao.getMyCount(sid); // 나의 작성글수 
	if(count > 0){
		slist = sdao.getMyList(sid, mstart , mend );

	}
%>  
	<%
	if(rank != null){	
    if(rank.equals("member")){
	if(count == 0){%>
	<div>
		<table border="1">
		  <tr>
		   <th><a href="../s-member/s-member_input.jsp">나의멤버등록</a></th>
		  </tr>
		  <tr> 
			<th colspan="6">게시글이 없습니다</th>
		  </tr>
			</table>
		</div>	
	<%}else{%>
	<% 
	for(SmemberDTO dto : slist) { 
	Comment_SmemberDAO cpdao = new Comment_SmemberDAO();
    int ccount = cpdao.getCommentCount(dto.getNum());%>
	<div>
	<h2>나의 멤버</h2>
		<table class="mboard" style="table-layout:fixed" >
			<tr>
				<th><a href="/goworker/s-member/s-member_detail.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><%=dto.getId() %></a></th>
				<th>
				<%if(dto.getAvailable() == 1) { %>
				<img src="../s-member/image/switch-on.png" width="40px" height="36px"> 
				<%} else{ %>
				<img src="../s-member/image/switch-off.png" width="40px" height="36px">
				<%} %>
				</th>
				<th><%=dto.getField() %></th>
				<td><img src="../s-member/image/view.png" width="20px" height="20px"/><%=dto.getReadcount() %>
					<img src="../s-member/image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>
				</td>
			</tr>
			<tr>
				<th><%=dto.getCareer() %></th>
				<th><%=dto.getEmploytype() %></th>
				<th><%=dto.getLocation() %></th>
				<th><%=dto.getWorktype() %></th>
			</tr>
			<tr>
			<th colspan="3"
			style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"> <%=dto.getIntroduce() %>
			</th>
			<th><img src="../s-member/image/comment.png" width="20px" height="20px"/><%=ccount %></th>
			</tr>
		</table><br/>
	</div>
<%           }
	     }
       }
	}
%><br/>
<% 
   SprojectDAO pdao = new SprojectDAO();
    int pcount = 0;
   List<SprojectDTO> plist = null;
   
   pcount = pdao.getMyCount(sid); // 나의 작성글수 
   if(pcount > 0){
      plist = pdao.getMyList(sid, mstart, mend);
   }

   %>
      <%
      if(rank != null){	
      if(rank.equals("manager")){
      if(pcount == 0){ %>
      <div>
      <table border="1">
        <tr>
         <th><a href="../s-project/s-project_input.jsp">나의 프로젝트등록</a></th>
        </tr>
        <tr> 
         <th colspan="9">게시글이 없습니다</th>
        </tr>
         </table>
   </div>
   <%}else{  %>
<% for(SprojectDTO dto : plist){
	Comment_SprojectDAO cpdao = new Comment_SprojectDAO();
   int ccount = cpdao.getCommentCount(dto.getNum());%>
    <table  border=1 width="610px" style="table-layout:fixed">
    <h2>나의 프로젝트</h2>
   <tr>
      <th width="60">글번호</th>
      <th width="60">작성자</th>
      <th width="150">제목</th>
      <th width="70">좋아요</th>
      <th width="60">조회수</th>
      <th width="180">작성일</th>
      <th width="60">댓글수</th>
   </tr>
   <tr>
      <th width="60"><%=dto.getNum() %></th>
      <th width="60"><%=dto.getId() %></th>
      <th width="150" style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">
      <a href="../s-project/s-project_detail.jsp?num=<%=dto.getNum() %>&pageNum=<%=pageNum %>"><%=dto.getSubject() %></a></td>
      </th>
      <th width="70"><img src="../s-member/image/thumbs.png" width="20px" height="20px"><%=dto.getGood() %></th>
      <th width="60"><%=dto.getReadcount() %></th> 
      <th width="180"><%=dto.getRegdate() %></th>
      <th width="60"><%=ccount %></th>
   </tr>   
<%             } 
            }
         }
      } %>
</table>
<br/>
<h2>나의 댓글목록</h2>
<%	
	int start = (currentPage - 1) * pageSize + 1;		
	int end = currentPage * pageSize;
	
	CommentDAO dao = new CommentDAO();
	int ccount = 0; 
	List<CommentDTO> list = null;	
	ccount = dao.getMyCount(sid); // 나의 작성글수 
	if(ccount > 0){
		list = dao.getMyComment(sid, start, end);		
	}
	System.out.println(ccount);
	System.out.println(start);
	System.out.println(end);
	
%> 
	<table  border=1 width="660px" style="table-layout:fixed">
		<tr>
			<th maxwidth="120">게시판명</th>
			<th width="70">아이디</th>
			<th width="200">댓글내용</th>
			<th width="70">좋아요</th>
			<th width="180">작성일시</th>
		</tr>
	</table>
<% 	
	if(ccount !=0) {
		
	if(ccount >0) {
	for(CommentDTO cdto : list) {
		%>
	<div>
		<form action="/goworker/admin/admin_commentUpdate.jsp" method="post">
		<table  border=1 width="660px" style="table-layout:fixed">
			<tr>
				<th maxwidth="120"> <%=cdto.getBoard_name() %> <input type="hidden" name="board_name" value= "<%=cdto.getBoard_name() %>" /></th>
				<input type="hidden" name="board_num" value= "<%=cdto.getBoard_num() %>" />
				<input type="hidden" name="comment_num" value= "<%=cdto.getComment_num() %>" />
				</th>
				<th width="70"><%=cdto.getComment_writerid()%></th>
				<th width="200" style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">
              <%
                 if(cdto.getBoard_name().equals("멤버찾기")){%>
                 <a href = "/goworker/s-member/s-member_detail.jsp?num=<%=cdto.getBoard_num() %>"><%=cdto.getComment_content()%></a>	 
              <%}
                 if(cdto.getBoard_name().equals("프로젝트찾기")){%>
                 <a href = "/goworker/s-project/s-project_detail.jsp?num=<%=cdto.getBoard_num() %>"><%=cdto.getComment_content()%></a>	 
              <%}
                 if(cdto.getBoard_name().equals("프로젝트만들기")){%>
                 <a href = "/goworker/makeproject/makeproject_detail.jsp?num=<%=cdto.getBoard_num() %>"><%=cdto.getComment_content()%></a>
              <%}%>   
          		</th>
				<th width="70"><img src="../s-member/image/thumbs.png" width="20px" height="20px"><%=cdto.getComment_good() %></th>
				<th width="180"><%=cdto.getComment_regdate()%></th>
			</tr>
		</table>
		</form>
	</div>
<%}
	}
%>

<%
	if (ccount > 0) {
		int pageCount = ccount / pageSize + (ccount % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / 10)* 10 +1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock -1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
		
		if (startPage >10) {
%>			<a href="myPage.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%		}
	
		for (int i = startPage ; i <= endPage ; i++) {
%> 			<a href="myPage.jsp?pageNum=<%=i%>">[<%=i %>] </a>
<%		}
	
		if(endPage < pageCount) {
%>		<a href="myPage.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%		}
	}
}else{%>
	작성된 댓글이 없습니다 .
<%}
%> 
</body>
<br/>
<%@ include file = "/include/footer.jsp" %>
 </html>  