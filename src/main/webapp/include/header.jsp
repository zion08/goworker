<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="bean.Cookies" %>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<link href="../style.css" rel="stylesheet" type="text/css">
<%	String sid = (String)session.getAttribute("sid"); %>

<script language="javascript">  
	function goUrl(url) {
		window.location.href  = url;
		}  
</script>

<%	
	String sid = (String)session.getAttribute("sid"); 
	Cookies cookies = new Cookies(request);
	String cid = cookies.getValue("cid");
%>


<header>    
			<div class="logo" onclick="window.location='/goworker/main/index.jsp'">
			</div>	
<%	if (sid == null) {
%>			
			
<%	if (sid == null && cid == null) {
%>			<div class="wrapper-title">
				<span class="title">
					GoWorker<br/>함께 나아갈 동료와 프로젝트를 찾으세요! 
				</span>
			</div>
			<div class="wrapper-sideicon">			
				<span class="sideicon2" >
					<a href="/goworker/member/apply.jsp">가입하기
					</a>
				</span>			
				<span class="sideicon2">
					<a href="/goworker/member/login.jsp">로그인
					</a>
				</span>
			</div>
<%	} else {
%>			<div class="wrapper-title">
				<span class="title">
					GoWorker<br/>함께 나아갈 동료와 프로젝트를 찾으세요! 
				</span>
			</div>

            <div class="wrapper-sideicon">	
<%            	if (rank=="") {
%>					<span class="sideicon2">
						<p>프로젝트등록</p>
					</span>
<%           	} else if (rank=="") {
%>
<%				} else {
				
%>				}		
				<span class="sideicon2">
					<p><%=(sid==null) ? cid : sid%></p>
				</span>	

				<span class="sideicon1">
					<a href="#" onclick="window.open('../message/messageSave.jsp', 'message', 'width=355px, height=540px');">
						<img src="../s-member/image/note.png"><p>메세지</p>
					</a>
				</span>

				<span class="sideicon2">
					<p><%=(sid==null) ? cid : sid%>님</p>
				</span>	
				<span class="sideicon1">
	               <select onchange="goUrl(this.options[this.selectedIndex].value)">
		               <option value="../member/myPage.jsp">회원관리
		               <option value="../member/myPage.jsp">마이페이지</option>
		               <option value="../member/favorite.jsp">관심목록</option>
		               <option value="../member/modify.jsp">비밀번호수정</option> 
		               <option value="../member/logout.jsp">로그아웃</option>
		               <option value="../member/delete.jsp">회원탈퇴</option>
	               </select>
               </span>					
			</div>
<%	}
%>
</header>
<hr color="#DFD8CA" size="2"  align="center" />