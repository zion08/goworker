<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<link href="../style.css" rel="stylesheet" type="text/css">


<%	String sid = (String)session.getAttribute("sid"); %>
<header>
            <script language="javascript">  
               function goUrl(url)   
               { window.location.href  = url;     }  
            </script>
            
			<div class="logo" onclick="window.location='/goworker/main/index.jsp'">
			</div>	
<%	if (sid == null) {
%>			<div class="wrapper-sideicon">			
				<span class="sideicon2" >
					<a href="/goworker/member/apply.jsp">가입하기
					</a>
				</span>			
				<span class="sideicon2">
					<a href="/goworker/member/login.jsp">로그인	<!-- 로그인 완성 후, 주소 변경 할것 -->
					</a>
				</span>
			</div>
<%	} else {
%>			
            <div class="wrapper-sideicon">			
				<span class="sideicon1">
					<a href="#" onclick="window.open('../message/messageSave.jsp', 'message', 'width=355px, height=540px');">
						<img src="../s-member/image/note.png"><p>메세지</p>
					</a>
				</span>
				<span class="sideicon2">
					<p><%=sid%></p>
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
%></header>
<hr color="skyblue" size="2"  align="center" />