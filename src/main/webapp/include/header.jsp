<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="bean.Cookies" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.MemberDTO" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<link href="../style.css" rel="stylesheet" type="text/css">
<jsp:useBean id="headerdao" class="bean.MemberDAO"></jsp:useBean>

<script language="javascript">  
	function goUrl(url) {
		window.location.href  = url;
		}  
</script>

<%
	String sid = (String)session.getAttribute("sid");
	Cookies cookies = new Cookies(request);
	String cid = cookies.getValue("cid");
	List<MemberDTO> headerlist =null;
	String rank = new String();
	

	if (sid != null) {
		headerlist = headerdao.getMemberInfo(sid);
		MemberDTO dto = headerlist.get(0);
		rank = dto.getRank();
	}
	if (cid != null) {
		headerlist = headerdao.getMemberInfo(cid);
		MemberDTO dto = headerlist.get(0);
		rank = dto.getRank();
	}
	
	
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
						<a href="../admin/admin.jsp">>관리자페이지
						</a>
					</span>
<%				}		
%>				<span class="sideicon2">
					<p><%=(sid==null) ? cid : sid%></p>
				</span>	

				<span class="sideicon1">
					<a href="#" onclick="window.open('../message/messageSave.jsp', 'message', 'width=355px, height=540px');">
						<img src="../s-member/image/note.png"><p>메세지</p>
					</a>
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