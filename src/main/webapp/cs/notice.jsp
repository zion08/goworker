<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.MemberDTO" %>
<%@ page import="bean.SmemberDAO" %>
<%@ page import="bean.SmemberDTO" %>
<%@ page import="bean.NoticeDTO" %>
<%@ page import="bean.NoticeDAO" %>
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>
<html>
<head>
<title>공지사항</title>
</head>
<body>	
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
<aside>
<tr>
 <td><a href="notice.jsp">공지사항</a></td><br>
 <td><a href="cs.jsp">문의사항</a></td>
</tr>
</aside>
<h2>공지사항</h2>
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
     <table border="1">
	<tr>
		<th>글번호</th><th>작성자</th><th>제목</th><th>작성일</th><th>조회</th>
	</tr>
	<%if(count == 0){%>
		<tr>
			<td colspan="6">저장된 글이 없습니다...!!</td>
		</tr>	
	<%}else{%>
	<%
    	for(NoticeDTO dto : list){%>
	<tr>
		<td><%=dto.getNum()%></td>
		<td><%=dto.getWriter()%></td>
		<td><a href="noticeContents.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><%=dto.getSubject()%></a></td> 	
		<td><%=dto.getRegdt()%></td>
		<td><%=dto.getReadcount()%></td>
	</tr>		
<%	}
}%>
</table> 
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
			<a href="notice.jsp?pageNum=<%=startPage-10%>">[이전]</a>
		<%}
		for(int i = startPage ; i <= endPage ; i++){
		%>	<a href="notice.jsp?pageNum=<%=i%>">[<%=i%>]</a> 	
	  <%}
		if(endPage < pageCount){%>
		<a href="notice.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
	<%}	
	}
%>
<%    
       // 로그인된 id 와 글작성자 비교
       if(sid != null){
	   if(sid.equals("admin")){
%>		<input type="button"  value="글쓰기" onclick="window.location='noticeWrite.jsp' "/>
<%  } 
}%>
<br />
<footer>
<hr color="skyblue" size="2"  align="center" />
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
</body>
<style>
            input[type=submit]{
                background-color: skyblue;
                border:none;
                color:white;
                border-radius: 5px;
                width:25%;
                height:35px;
                font-size: 14pt;
                margin-top:5px;
                shap:circle;
            }
            input[type=button]{
                background-color: skyblue;
                border:none;
                color:white;
                border-radius: 5px;
                width:10%;
                height:20px;
                font-size: 10pt;
                margin-top:5px;
            }
            
            #footer{
                text-align: right;
                font-size:12pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }

            aside{
                display:block;
                width:400px;
                margin:10px;
                padding:4px;
                text-align:center;
            }
            aside {
                float:left;
                width:104px;
                height:240px;
            }
    </style>  
 </html>
    