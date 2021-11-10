<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">

<%	String sid = (String)session.getAttribute("sid"); %>
	
	<header>
			<div class="logo" onclick="window.location='/goworker/main/index.jsp'">
			</div>	
<%	if (sid == null) {
%>			<div class="wrapper-sideicon">			
				<span class="sideicon2" >
					<a href="/goworker/member/apply.jsp">가입하기
					</a>
				</span>
				
				<span class="sideicon2">
					<a href="/goworker/login-test.jsp">로그인	<!-- 로그인 완성 후, 주소 변경 할것 -->
					</a>
				</span>
			</div>
<%	} else {
%>			<div class="wrapper-sideicon">		
				<span class="sideicon1">
					<a href="" >
						<img src="../s-member/image/note.png"><p>메세지</p>
					</a>
				</span>
				
				<span class="sideicon2">
					<p><%=sid%></p>
				</span>				
			</div>

<%	}
%>	</header>


<hr color="skyblue" size="2"  align="center" />