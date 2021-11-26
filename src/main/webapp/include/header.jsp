<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="bean.Cookies" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.MemberDTO" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<link href="../style.css" rel="stylesheet" type="text/css">
<jsp:useBean id="headerdao" class="bean.MemberDAO"></jsp:useBean>
<jsp:useBean id="mgdao" class="bean.MessageDAO"/>
<script language="javascript">  
	function goUrl(url) {
		window.location.href  = url;
		}  
</script>

<%
	String sid = (String)session.getAttribute("sid");
	Cookies cookies = new Cookies(request);
	String cid = cookies.getValue("cid");

	if (cid != null) {
		sid = cid;
	}
		
	String rank = headerdao.getRank(sid);
	
	//안읽은 메세지 갯수
	int countNewMessage = mgdao.getCountNewMessage(sid);
%>


<header>    
			<div class="logo" onclick="window.location='/goworker/main/index.jsp'">
			</div>	
		
<%	if (sid == null && cid == null) {
%>			<div class="wrapper-sideicon">			
				<span class="sideicon3" >
					<a href="/goworker/member/apply.jsp">가입하기
					</a>
				</span>			
				<span class="sideicon3">
					<a href="/goworker/member/login.jsp">로그인
					</a>
				</span>
			</div>
<%	} else {
%>			
            <div class="wrapper-sideicon">	
<%            	if (rank.equals("member")) {
%>					<span class="sideicon2">
						<a href="../s-member/s-member_input.jsp">멤버등록
						</a>
					</span>
<%           	} else if (rank.equals("manager")) {
%>					<span class="sideicon2">
						<a href="../s-project/s-project_input.jsp">프로젝트등록
						</a>
					</span>
<%				} else {
%>					<span class="sideicon2">
						<a href="../admin/admin.jsp">관리자페이지
						</a>
					</span>
<%				}		
%>				<span class="sideicon2">
					<p><%=sid%></p>
				</span>	

				<span class="sideicon1">
					<a href="#" onclick="window.open('../message/messageSave.jsp', 'message', 'width=355px, height=540px');">
						<img src="../s-member/image/note.png"><p>메세지<span>(<%=countNewMessage%>)</span></p>
					</a>
				</span>

				<span class="sideicon1">
	               <select onchange="goUrl(this.options[this.selectedIndex].value)">
		               <option value="../member/myPage.jsp">회원관리
		               <option value="../member/myPage.jsp">마이페이지</option>
		               <option value="../member/favorite.jsp">관심목록</option>
		               <option value="../member/modify.jsp">회원정보수정</option>
		               <option value="../cs/cs.jsp">나의문의사항</option> 
		               <option value="../member/logout.jsp">로그아웃</option>
		               <option value="../member/delete.jsp">회원탈퇴</option>
	               </select>
               </span>					
			</div>
<%}
%>
</header>
<hr color="#DFD8CA" size="2"  align="center" />