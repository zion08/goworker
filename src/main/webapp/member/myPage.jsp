<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.MemberDTO" %>
<%@ page import="bean.SmemberDTO" %>
<%@ page import="bean.SmemberDAO" %>
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
      <input type="submit" value="프로젝트찾기" onclick=" window.location='/goworker/s-project/list.jsp' "/>
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
	int start = (currentPage - 1) * pageSize + 1;		
	int end = currentPage * pageSize;
	
	SmemberDAO dao = new SmemberDAO();
	int count = 0; 
	List<SmemberDTO> list = null;	
	count = dao.getMyCount(sid); // 나의 작성글수 
	if(count > 0){
		list = dao.getMyList(sid, start , end );

	}
%>  
	<%
	if(rank != null)	
    if(rank.equals("member"))
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
	for(SmemberDTO dto : list) { %>
	<div>
	<h2>나의 멤버</h2>
		<table class="mboard" style="table-layout:fixed" >
			<tr>
				<th><a href="/goworker/s-member/s-member_detail.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><%=dto.getId() %></a></th>
				<th>
				<%if(dto.getAvailable() == 1) { %>
				<img src="image/switch-on.png" width="40px" height="36px"> 
				<%} else{ %>
				<img src="image/switch-off.png" width="40px" height="36px">
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
			<td colspan="4"
			style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"> <%=dto.getIntroduce() %>
			</td>
			</tr>
		</table><br/>
	</div>
<%}
	}
%><br/>
<% 
   SprojectDAO pdao = new SprojectDAO();
    int pcount = 0;
   List<SprojectDTO> plist = null;
   
   pcount = pdao.getMyCount(sid); // 나의 작성글수 
   if(pcount > 0){
      plist = pdao.getMyList(sid, start, end);
   }

   %>
      <%
      if(rank != null)	
      if(rank.equals("manager"))
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
<% for(SprojectDTO dto : plist){%>
    <table border="1">
    <h2>나의 프로젝트</h2>
   <tr>
      <th>글번호</th><th>제목</th><th>작성자</th><th>경력</th><th>예상기간</th><th>예상금액</th><th>프로젝트 타입</th><th>지역</th><th>작성일</th>
   </tr>
   <tr>
      <td><%=dto.getNum() %></td>
      <td><a href="../s-project/s-project_input.jsp?num=<%=dto.getNum() %>&pageNum=<%=pageNum %>"><%=dto.getSubject() %></a></td>
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
</body>
  
</body>
<br/>
<%@ include file = "/include/footer.jsp" %>
</html>