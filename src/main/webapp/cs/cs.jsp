<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.MemberDTO" %>
<%@ page import="bean.SmemberDAO" %>
<%@ page import="bean.SmemberDTO" %>
<%@ page import="bean.CsDTO" %>
<%@ page import="bean.CsDAO" %>
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>
<html>
<html>
<head>
<title>문의사항</title>
</head>
<aside>
<tr>
 <td><a href="notice.jsp">공지사항</a></td><br>
 <td><a href="cs.jsp">문의사항</a></td>
</tr>
</aside>
<h2>문의사항</h2>
<%
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	String my = request.getParameter("my");
	
	String id = (String)session.getAttribute("sid");
	 
	if(pageNum == null){		
		pageNum="1";	
	}	
	
	int currentPage = Integer.parseInt(pageNum); 
	int start = (currentPage-1) * pageSize + 1;  
	int end = currentPage * pageSize;
	CsDAO dao = new CsDAO();
		
	int count = 0;
	List<CsDTO> list = null;
	
	if(id !=null){
	if(id.equals("admin"))	
		count = dao.getCount(); // 전체글 수 
    if(count > 0){
	    list = dao.getAllList( start , end );
	}else{
		count = dao.getMyCount(id); // 나의 작성글수 
		if(count > 0){
			list = dao.getMyList(id, start , end ); 
		}
	}
}
	
%>
<table border="1">
	<tr>
		<th>글번호</th><th>작성자</th><th>제목</th> <th>내용</th><th>작성일</th><th>조회</th>
	</tr>
	<%if(count == 0){%>
		<tr>
			<td colspan="6">저장된 글이 없습니다...!!</td>
		</tr>	
	<%}else{%>
	<%
    	for(CsDTO dto : list){%>
	<tr>
		<td><%=dto.getNum()%></td>
		<td><%=dto.getWriter()%></td>
		<td><a href="csContent.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><%=dto.getSubject()%></a></td> 	
		<td><%=dto.getContent()%></td>
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
			<a href="list.jsp?pageNum=<%=startPage-10%>">[이전]</a>
		<%}
		for(int i = startPage ; i <= endPage ; i++){
		%>	<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a> 	
	  <%}
		if(endPage < pageCount){%>
		<a href="list.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
	<%}	
	}
%>
<%
	if(id != null){
%>		<input type="button"  value="글쓰기" onclick="window.location='csWrite.jsp' "/>
<%  } %>
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
    