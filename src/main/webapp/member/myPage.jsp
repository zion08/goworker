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
	System.out.println(count);
	System.out.println(sid);
%>
	<%if(count == 0){%>
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
		<table class="mboard" >
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
				<td><img src="../image/view.png" width="20px" height="20px"/><%=dto.getReadcount() %>
					<img src="../image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>
				</td>
			</tr>
			<tr>
				<th><%=dto.getCareer() %></th>
				<th><%=dto.getEmploytype() %></th>
				<th><%=dto.getLocation() %></th>
				<th><%=dto.getWorktype() %></th>
			</tr>
			<tr>
			<td colspan="4"> <%=dto.getIntroduce() %>
			</td>
			</tr>
		</table><br/>
	</div>
<%}
	}
%><br/>

<br/>
<footer>
<hr color="skyblue" size="2" align="center"><br/>
<table  align="right">
      
      <thead align="center">
        <tr>
          <th></th>
          <th>메인</th>
          <th>회원</th>
          <th>고객센터</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><a href="">사이트소개</a></td>
          <td><a href="/goworker/s-member/s-member.jsp">팀원찾기</a></td>
          <td>회원가입</td>
          <td><a href="/goworker/cs/notice.jsp">공지사항</a></td>
          
        </tr>
        <tr>
          <td>이용방법</td>
          <td>프로젝트찾기</td>
          <td>회원정보수정</td>
          <td><a href="/goworker/cs/cs.jsp">Q&A</a></td>
        </tr>
        <tr>
          <td></td>
          <td>프로젝트만들기</td>
          <td>회원탈퇴</td>
          <td></td>
        </tr>
        <tr>
            <td></td>
            <td>취업정보</td>
            <td></td>
            <td></td>
          </tr>
        <tr>
          <td></td>
          <td>커뮤니티</td>
          <td></td>
          <td></td>
        </tr>
      </tbody>
      
    </table>
</footer>
<style>
            
            #footer{
                text-align: right;
                font-size:12pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }
            </style>
</html>