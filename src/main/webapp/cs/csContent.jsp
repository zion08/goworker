<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="bean.CsDTO" %>
<%@ page import="bean.CsDAO" %>
<%@ page import="bean.Comment_CsDTO" %>
<%@ page import="bean.Comment_CsDAO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>
<jsp:useBean class="bean.CsDTO"  id="dto" />
<jsp:setProperty property="num" name="dto" />

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
      int pageNumber = 1; //기본페이지
      if (request.getParameter("pageNumber") != null){
	  pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터는 꼭 이런식으로 바꿔줘야됨
      }
	%>
<%
	 String pageNum = request.getParameter("pageNum");
	 CsDAO dao = new CsDAO();
	 dao.readCountUp(dto);  // 조회수 증가 
	 dto = dao.getContent(dto);
%>
 <form>
   <table class="comments" border="1" width="535px" align="center">
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
<!-- 댓글 작성 폼 -->
<%
	int comment_num=0, comment_ref=1, comment_step=0, comment_level=0;
	if(request.getParameter("comment_num") != null){
		comment_num=Integer.parseInt(request.getParameter("comment_num"));
		comment_ref=Integer.parseInt(request.getParameter("comment_ref"));
		comment_step=Integer.parseInt(request.getParameter("comment_step"));
		comment_level=Integer.parseInt(request.getParameter("comment_level"));
	}
	
	
	Comment_CsDAO cd = new Comment_CsDAO();	
	int comment_count = 0;
	int board_num = dto.getNum();
	
%>
<section class="section1">	

	<table class="comments" border="1" width="535px" align="center">
			<tr>
				<td align="left" colspan="3" width="530px" style="font-size:15px">
			</tr>	
		</table>


	<form action="comment/commentPro.jsp" name="writeform" method="get" >
			<input type="hidden" name="board_num" value="<%=dto.getNum()%>"/>
			<input type="hidden" name="comment_num" value="<%=comment_num%>"/>
			<input type="hidden" name="comment_ref" value="<%=comment_ref%>"/>
			<input type="hidden" name="comment_step" value="<%=comment_step%>"/>
			<input type="hidden" name="comment_level" value="<%=comment_level%>"/>
			<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
				
		<table class="comments" border=1>
<%
        String aid = (String)session.getAttribute("sid");
        // 로그인된 id 와 글작성자 비교
	    if(aid != null){
		if(aid.equals("admin")){%>
			<tr>

				<td width="60" align="center">작성자</td>
				<td width="200px" colspan=3 align="center">
					<%=sid %><input type="hidden" name="comment_writerid" value="<%=sid%>"/>
				</td>

			</tr>
			
			<tr>	
				<td width="60px" align="center">내 용</td>
				<td width="300px" colspan=3 align="center">
					<input type="text" size="100" name="comment_content" id="comment_content" style="width:465px;height:100px;" placeholder="댓글을 입력해주세요." required;></td>
			</tr>
			
			<tr>
				<td colspan=2 align="center">
					<input type="submit" value="댓글 쓰기"/>
					<input type="reset" value="다시 작성"/>
				</td>
			</tr>
		</table><br/>	
	</form>
</section>
<%  	}
	}
%>
<!-- 댓글 리스트 -->
<% 	
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
	Comment_CsDAO cdao = new Comment_CsDAO();
	int count = 0; 
	List<Comment_CsDTO> list = null;	
			
	count = cdao.getCount(); // 전체 글의 갯수
	if(count > 0) {
	list = cdao.getComment(dto.getNum());	
	}
	
%>
<% 
		if(count > 0) { 
			for(Comment_CsDTO cdto : list)  {
%>
<section class="section1">

	<table class="comments" border="1" width="535px" align="center">
		<tr>
			<td width="60px">작성자</td>
			<td width="350px" align="center">내 용</td>
			<td width="60px" align="center" >작성일</td>
			<td width="40px" align="center">버튼</td>
		</tr>	
			<tr>	
				<td align="center">
					<img src="../s-member/image/image.jpg" width="50" height="50"><br/>
						<%=cdto.getComment_writerid() %><input type="hidden" name="comment_writerid" value="<%=cdto.getComment_writerid() %>" />
				</td>
				 
				<td>
<%					int wid=0; 
					if(cdto.getComment_level()>0){
						// 답글일때에만 Re_level()의 값이 0 이상이다. / 답글일때에만 조건문 수행
						wid=10*(cdto.getComment_level());
						// 답글 들여쓰기 사이즈(width의 값으로 넣을 변수와 값 저장해서 아래에 대입)
%>						<img src="../s-member/image/white.jpg" width="<%=wid%>" height="16">
						<img src="../s-member/image/re.gif">
<%					} else {
%>						<img src="../s-member/image/white.jpg" width="<%=wid%>" height="16">	  	 
<%					}
%>	  	 			<%=cdto.getComment_content() %> 
				</td>
				
				<td align="center">
					<%=sdf.format(cdto.getComment_regdate()) %>
				</td>
				
        <% if(sid !=null) {
            if(sid.equals(cdto.getComment_writerid())||aid.equals("admin")) { %>					
			
			<td  align="center">
				<form action="/goworker/cs/comment/commentDelete.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref() %>"  method="post" >
					<input type="button" value="수정" onclick="window.open('/goworker/cs/comment/commentUpdate.jsp?comment_num=<%=cdto.getComment_num()%>','update','width=800,height=300');"/>
					<input type="submit" value="삭제" onclick="comment_removeCheck()" />
	 				<input type="button" value="답글" onclick="window.open('/goworker/cs/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&pageNum=<%=pageNum%>','reply','width=600,height=300');" />
	 				<%}else{ %>
	 				
	 				<td algin="center">
	 					<input type="button" value="답글" onclick="window.open('/goworker/cs/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&pageNum=<%=pageNum%>','reply','width=600,height=300');" />
	 				</td>
	 			</form>
	 		</td>
	 	</tr>					
		<%}
		}
	}%>
</table><br/>
</section>

<input type="button" value="목록" 
	   onclick=" window.location='cs.jsp?pageNum=<%=pageNum%>' "/>

<%
        String csid = (String)session.getAttribute("sid");
        // 로그인된 id 와 글작성자 비교
	    if(csid != null){
		if(csid.equals(dto.getWriter()) || csid.equals("admin")){
%>		<input type="button" value="글수정" onclick=" window.location='csUpdate.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>' "/>
		<input type="button" value="글삭제" onclick=" window.location='csDelete.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>' "/>	
<%  	     }
	   }
%>
<% }
%>

</body>
 <br/>
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
    











