<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bean.SmemberDTO"%>
<%@ page import="bean.SmemberDAO"%>
<%@ page import="bean.FavoriteDTO"%>
<%@ page import="bean.FavoriteDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">

<title>관심목록</title>
</head>
<body>
	<%
		String sid = null;
		if(session.getAttribute("sid") != null){
			sid = (String) session.getAttribute("sid");
		}
		int pageNum = 1; //기본페이지
		if (request.getParameter("pageNumber") != null){
			pageNum = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		    <a class="navbar-brand" href="index.jsp">
		       <img src="/goworker/s-member/image/logo.png" width="50" height="50"/><br/>
			</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a></li>
				<li><a href="bbs.jsp?boardID=2&pageNumber=1">자유 게시판</a></li>
			</ul>
			<%
				if(sid == null){		//로그인이 되어있지 않은 경우
			%>
			<ul class="nav navbar-nav navbar-right">
         		<li class="dropdown">
           			<a href="#" class="dropdown-toggle" 
            		data-toggle="dropdown" role="button" aria-haspopup="true" 
            		aria-expanded="false">접속하기<span class="caret"></span></a>
        		<ul class="dropdown-menu">
              		<li><a href="login.jsp">로그인</a></li>
              		<li><a href="join.jsp">회원가입</a></li>
            		</ul>    
         		</li>
       		</ul>
			<% 
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
         		<li class="dropdown">
           			<a href="#" class="dropdown-toggle" 
            		data-toggle="dropdown" role="button" aria-haspopup="true" 
            		aria-expanded="false">회원관리<span class="caret"></span></a>
        		<ul class="dropdown-menu">
        			<li><a href="modify.jsp">비밀번호수정</a></li>
        			<li><a href="logout.jsp">로그아웃</a></li>
              		<li><a href="delect.jsp">회원탈퇴</a></li>
            	</ul>    
         		</li>
       		</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
		<h1>관심목록<br></h1>
		<p><%=sid %>님이 하신 좋아요목록입니다.<br><br></p>

		<div class="container">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
						request.setCharacterEncoding("UTF-8");
						String my = request.getParameter("my");
						int pageSize = 5;
						
					int currentPage = pageNum;
					/*	int start = (currentPage - 1) * pageSize + 1;		
						int end = currentPage * pageSize; */
						
						FavoriteDAO fdao = new FavoriteDAO();
						int count = 0;
						List<SmemberDTO> list = null;
						count = fdao.getfavCount(sid);
						
			
				
				System.out.println(count);
				
				list= fdao.getFavlist(sid);	
				
			for(SmemberDTO dto : list){
				System.out.println(dto);%>
			<tr>
				<td><%= dto.getNum() %></td>
				<td><a href="/goworker/s-member/s-member_detail.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><%=dto.getId() %></a></td>
				<td><%= dto.getRegdate() %></td>
			</tr>
				<%}%>
				
					</tbody>
				</table>
				<form name = "p_search">
					<input type="button" value="검색" onclick="nwindow()"/>
				</form>				
			</div>
		</div>
	</div>	
	<%
	if (count > 0) {
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / 10)* 10 +1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock -1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
		
		if (startPage >10) {
%>			<a href="favorite.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%		}
	
		for (int i = startPage ; i <= endPage ; i++) {
%> 			<a href="favorite.jsp?pageNum=<%=i%>">[<%=i %>] </a>
<%		}
	
		if(endPage < pageCount) {
%>		<a href="favorite.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%		}
	}
%>
	<script>
	function nwindow(boardID){
		window.name = "parant";
		var url= "search.jsp?boardID="+boardID;
		window.open(url,"","width=250,height=200,left=300");
	}
</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>