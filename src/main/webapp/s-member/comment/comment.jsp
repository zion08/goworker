<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "smember.comment.bean.Comment_SmemberDAO" %>
    <%@ page import = "smember.comment.bean.Comment_SmemberDTO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comment 작성폼</title>
	<link rel="stylesheet" href="commentstyle.css">


</head>

<%
/* String id = (String)session.getAttribute("id"); */

%>	
<center>
<body>

<jsp:useBean id="dto"  class="smember.comment.bean.Comment_SmemberDTO"/>
<jsp:setProperty property="*" name="dto" />

   
	<div class="titletext"><b>서비스 평가</b><br/></div>
  <div class="smallfont">실제 Go-Worker 이용자들이 남긴 평가입니다.</div>
<br>

<form action="comment/commentPro.jsp" name="writeform" method="post" >
		<input type="hidden" name="board_num" value="<%=dto.getBoard_num()%>"/>
  작성자: <input type="text" size="20"  name="comment_writerid" required> <br/><br/>
		<textarea class="form-control" cols="100" rows="5" name="comment_content" placeholder="댓글을 입력하세요." required></textarea><br/>		
		<input type="submit" value="댓글 쓰기"/>
		<input type="reset" value="다시 쓰기"/>
 </form>
 
 
</body>
</html>