<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.BoardDAO" %>
<%@ page import="bean.BoardDTO" %>
<%@ page import="bean.Cookies" %>
<%@ page import="java.util.List"%>
<%@ include file = "../include/header.jsp" %>

<title>게시물내용</title>
<jsp:useBean class="bean.BoardDTO" id="dto" />
<jsp:setProperty property="num" name="dto" />

<%
	if(sid==null){ // 로그인 확인 => 수정 버튼 클릭시 사용
		sid=cid;
	}
	String pageNum=request.getParameter("pageNum"); 
	
	BoardDAO dao = new BoardDAO();
	dao.readCountUp(dto); //조회수 증가 함수 호출
	dto = dao.getContent(dto); // 글 내용 호출 함수
	int count = dao.getCount(); //총게시글 수 함수
	dao.getNext(dto); // 다음글 버튼 구현 함수
	dao.getPrev(dto); // 이전글 버튼 구현 함수
	int prev=dto.getNum_prev();
	int next=dto.getNum_next();
	
%>			

<%-- 게시글 내용 화면 --%>
<section class="section2">
	<div class="detail-box">
		<ul class="detail-inside">
			<li>
				<label>제목</label>
				<p><%=dto.getSubject() %></p>
			</li>
			
			<li>
				<label>작성자</label>
				<p><%=dto.getWriter() %></p>
			</li>
						
			<li>
				<label>등록일</label>
				<p><%=dto.getReg() %></p>
			</li>
						
			<li id="detail-img">
				<label>첨부파일
					<a href="javascript:doDisplay();">
						[접기/보기]
					</a>
				</label>
				
				<p id="checkboard">
<%					if(dto.getFilename() != null) { %>
						<img src = "../uploadFile/boardFile/<%=dto.getFilename()%>">
<%					} else { 
%>						등록된 이미지가 없습니다.
<%					} 
%>				</p>
			</li>
			
			<li id="detail-content">
				<label>내용</label>
				<p><%=dto.getContent()%></p>
			</li>		
		</ul>	
	</div>
</section>
	
<%-- 하단 버튼 구현 --%>
<section class="section2">	
	
	<%if(prev>=1){%>
		<a href="content.jsp?num=<%=prev%>&pageNum=<%=pageNum%>">[이전글]</a>
	<%}%>
		<a href="board.jsp?pageNum=<%=pageNum%>">[목록]</a>
	<%if(next>0){%>
		<a href="content.jsp?num=<%=next%>&pageNum=<%=pageNum%>">[다음글]</a>
	<%}%>
</section>

	
<%-- 게시물 삭제 기능 구현 --%>
<section class="section2">	
<%	if(sid!=null){ 
		if(sid.equals(dto.getWriter()))
		{
%>			<form action="edit.jsp" method="post" >
				<input type="hidden" name="pageNum" value="<%=pageNum%>" />
				<input type="hidden" name="num" value="<%=dto.getNum()%>">
				<input type="hidden" name="pageNum" value="<%=pageNum%>%>">
				<input type="submit" value="수 정" />
			</form>
			 
			<form action="delete.jsp" method="post" >
				<input type="hidden" name="num" value="<%=dto.getNum()%>" />
				<input type="hidden" name="pageNum" value="<%=pageNum%>" />
				<input type="submit" value="삭 제" />
			</form>
<%		}
	}
%>	
</section>

<%@ include file="../include/footer.jsp"%>


<script type="text/javascript">
	var bDisplay = true;

	function doDisplay() {
		var con = document.getElementById("checkboard");
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}
</script>