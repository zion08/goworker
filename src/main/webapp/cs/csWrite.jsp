<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.CsDAO" %>
<%@ page import="bean.CsDTO" %>
<%@ include file = "../include/header.jsp" %>
<%request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean class="bean.CsDTO"  id="dto" />
<jsp:setProperty property="*" name="dto" />

<html>
<head>
<title>문의사항</title>
</head>
<body>
<%		
      String id = null;
      if(session.getAttribute("sid") != null){
   	  sid = (String) session.getAttribute("sid");
      }

  	  String pageNum = request.getParameter("pageNum");
  	  CsDAO dao = new CsDAO();
  	  dto = dao.getContent(dto);
  		
      int pageNumber = 1; //기본페이지
      if (request.getParameter("pageNumber") != null){
	  pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
      }
	%>
<br/>
    <form action="csWritePro.jsp" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<input type="hidden" name="pageNum" value="<%=pageNum%>" />
		
		<table class="cs" border=1>
    	<h1>문의사항</h1>
    			 <input type="hidden" name="writer" value="<%=sid%>" />  <br />
    				 <tr>
			      <td width ="100px" align ="center">제 목</td>
			      <th width="300px" colspan=3 align="center">
    	          <input type="text" name="subject" />  <br />
    	          </th>
    	     </tr>
             <tr>	
			      <td width="100px" align="center">내 용</td>
			      <td width="300px" colspan=3 align="center">
			      <input type="text" size="100" name="content" id="content" style="width:500px;height:100px;" ></td>
		     </tr>
		     <tr>
		          <td width="100px" align="center">첨부파일</td>
			      <td width="300px" colspan=3 align="center">
    	          <input type="file" name="filename" /></td>
    	          <tr>   
              <%if(dto.getFilename() != null){%> 
    				[<%=dto.getFilename()%>]    
    				<input type="hidden" name="org" value="<%=dto.getFilename()%>" />					
    		  <%}else{%>
    				
    		  <%} %>
    	     <td colspan=2 align="center">
    	         <input type="submit" value="글쓰기" />
    	    </td>
		</tr>
		</table><br/>
		</form>
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
    
