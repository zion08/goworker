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


<title>문의사항</title>
<br/>

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
<section class="section1">
	<table border=1  align="center" >
	    <tr>
	      <td align="center"width="90px" height="4"   align="center">작성자</td>
	      <td align="center">
	      <%=dto.getWriter() %> </td>
	      <td align="right" width="200px">
	      <%=dto.getRegdt() %> </td>
	    </tr>
	    <tr>
	      <td align="center"  width="90px" height="4">제목</td>
	      <td  colspan="2" align="center" style="font-size:18px">
	      <%=dto.getSubject() %></td>
	    </tr>
	    <tr>
	      <td align="center" width="90px" >내 용</td>
	       <td colspan="2" >
			<textarea name="content" id="content"  maxlength="2000px"  
			style="font-size:14px" cols="62" rows="10"  readonly><%=dto.getContent() %></textarea>	      
           </td>	    
	     </tr>
	    <tr>
<%      if(dto.getFilename() != null){ %>
	      <td align="center" width="90px">첨부파일</td>
	      <td colspan="2" align="center">
		  <img src="../uploadFile/csFile/<%=dto.getFilename()%>" width = "300px"height="300px">
	      </td>				    
	     </tr>
	<%} %> 
	</table>
</section>
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
<%
    // 로그인이 관리자일때
	if(sid != null){
    if(rank.equals("admin")){%>
	  <section class="section1">	
	    <form action="comment/commentPro.jsp" name="writeform" method="get" >
			<input type="hidden" name="board_num" value="<%=dto.getNum()%>"/>
			<input type="hidden" name="comment_num" value="<%=comment_num%>"/>
			<input type="hidden" name="comment_ref" value="<%=comment_ref%>"/>
			<input type="hidden" name="comment_step" value="<%=comment_step%>"/>
			<input type="hidden" name="comment_level" value="<%=comment_level%>"/>
			<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
			
		<table class="comments" border=1>
			<tr>
				<td width="90" align="center">작성자</td>
				<td width="200px" colspan=3 align="center">
					<%=sid %><input type="hidden" name="comment_writerid" value="<%=sid%>"/>
				</td>
			</tr>
			
			<tr>	
				<td width="90px" align="center">내 용</td>
				<td width="300px" colspan=3 align="center">
					<input type="text" size="100" name="comment_content" id="comment_content" style="width:465px;height:100px;" placeholder="댓글을 입력해주세요." required></td>
			</tr>
			
			<tr>
				<td colspan=2 align="center">
					<input type="submit" value="댓글 쓰기"/>
					<input type="reset" value="다시 작성"/>
				</td>
			</tr>
		</table><br/>	
	</form>
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

	<table class="comments" border="1" width="566px" align="center">
		<tr>
			<td width="60px" align="center">작성자</td>
 			<td width="300px" align="center">내용</td>
 			<td width="80px" align="center">작성일</td>
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
			
 <%   if(sid !=null) {
         if(sid.equals(cdto.getComment_writerid())||rank.equals("admin")) { %>								
			<td  align="center">
				<form action="/goworker/cs/comment/commentDelete.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref() %>"  method="post" >
					<input type="button" value="수정" onclick="window.open('/goworker/cs/comment/commentUpdate.jsp?comment_num=<%=cdto.getComment_num()%>','update','width=800,height=300');"/>
					<input type="submit" value="삭제" onclick="comment_removeCheck()" />
	 				<input type="button" value="답글" onclick="window.open('/goworker/cs/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&pageNum=<%=pageNum%>','reply','width=600,height=300');" />
	 	    </td>				
	 	     <%}else{ %>	 				
	 		       <td algin="center">
	 			      <input type="button" value="답글" onclick="window.open('/goworker/cs/comment/commentReply.jsp?comment_num=<%=cdto.getComment_num() %>&board_num=<%=dto.getNum() %>&comment_ref=<%=cdto.getComment_ref()%>&comment_step=<%=cdto.getComment_step()%>&comment_level=<%=cdto.getComment_level()%>&pageNum=<%=pageNum%>','reply','width=600,height=300');" />
	 		       </td>
	 			</form> 			
	 	     </tr>				
          <% 	}
            }%>
<%       }
	}
%>
     </table><br/>
   </section>
</section>
<br/>
<center>
<form action="csDelete.jsp" method="post" align="center">
     <input type="button" value="목록" 
	   onclick=" window.location='cs.jsp?pageNum=<%=pageNum%>' "/>

<%
        
        // 로그인된 id 와 글작성자 비교 또는 관리자 일때 조건
	    if(sid != null){
		if(sid.equals(dto.getWriter()) || rank.equals("admin")){
%>	
        <input type="button" value="글수정" onclick=" window.location='csUpdate.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>' "/>
		<input type="submit" value="글삭제" onclick="button_event()"/>
			 <input type="hidden" name="num" value="<%=dto.getNum() %>" />
				</form>	
<%  	     }
	   }


	if(rank.equals("admin")) {%>
<input type="button" value="문의사항/관리자" onclick="window.location='/goworker/admin/admin_cs.jsp'" />
	<%} %>
</center>
 <br/>
 
   	<script>
  	function button_event(){

  		if (confirm("정말 삭제하시겠습니까??") == true){ 
  		    document.form.submit();
  		    window.loction='/goworker/cs/csDelete.jsp';
  			} 
  		}
 	
 		function comment_removeCheck(){
 			if(confirm("삭제 시, 복구가 되지 않습니다. \n 정말로 삭제하시겠습니까??") == true) {
 				document.form.submit;
 				window.location='/goworker/cs/comment/commentDelete.jsp';
 			}
 		}
 	</script>
 	
<%@ include file = "/include/footer.jsp" %>

    











