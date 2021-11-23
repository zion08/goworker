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

<jsp:useBean class="bean.NoticeDTO"  id="dto" />
<jsp:setProperty property="num" name="dto" />

<html>
<head>
<title>공지사항</title>
</head>
<body>
<%		
      String id = null;
      if(session.getAttribute("sid") != null){
   	  sid = (String) session.getAttribute("sid");
      }
      int pageNumber = 1; //기본페이지
      if (request.getParameter("pageNumber") != null){
	  pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
      }
	%>
<%
	  String pageNum = request.getParameter("pageNum");
	  NoticeDAO dao = new NoticeDAO();
	  dao.readCountUp(dto);  // 조회수 증가 
	  dto = dao.getContent(dto);
%>
 <form>
   <table class="cs" border=1>
    <tr>
      <th width = "500px" align = "center">작성자 : <%=dto.getWriter() %> </th>
    </tr>
<tr>
      <th width = "500px" align = "center">작성일 : <%=dto.getRegdt() %> </th>
    </tr>
<tr>
      <th width = "500px" align = "center">제 목 : <%=dto.getSubject() %> </th>
    </tr>
<tr>
      <th width = "500px" hight = "300px" align = "center">내 용 : <%=dto.getContent() %> </th>
      
</tr>
<tr>
      <th width = "500px" align = "center">
      <%if(dto.getFilename() != null){ %>
	    첨부파일  : <img src="/goworker/fileSave/<%=dto.getFilename()%>" width = "100px" heigh = "100px">
      <%} %> </th>     
</tr>

</table>
</form>

<input type="button" value="목록" 
	   onclick=" window.location='notice.jsp?pageNum=<%=pageNum%>' "/>

<%
        
        // 로그인된 id 와 글작성자 비교
        if(sid!=null){
        if(sid.equals("admin")){
%>		<input type="button" value="글수정" onclick=" window.location='noticeUpdate.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>' "/>
		<input type="button" value="글삭제" onclick=" window.location='noticeDelete.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>' "/>	
<%  		}
      	}
%>
</body>
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
          <td><a href="/goworker/notice/notice.jsp">공지사항</a></td>
          
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