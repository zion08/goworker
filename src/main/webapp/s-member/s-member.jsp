<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDAO" %> 
<%@ page import="bean.SmemberDTO" %>  
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>

<%	
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	String my = request.getParameter("my");
	int pageSize = 5;
	if(pageNum==null) {
		pageNum = "1"; // 값이 안넘어오는경우 >> 첫페이지인경우 
	}
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage - 1) * pageSize + 1;		
	int end = currentPage * pageSize;
	
	SmemberDAO dao = new SmemberDAO();
	int count = 0; 
	List<SmemberDTO> list = null;	
	if(my == null) {		
		count = dao.getCount(); // 전체 글의 갯수
		if(count > 0) {
			list = dao.getAllList( start, end );	
		}	
%>

<title>멤버 찾기</title>

<script type="text/javascript">
	var bDisplay = true;
	
	function doDisplay(){
		var con = document.getElementById("checkboard");
		if(con.style.display=='none'){
			con.style.display = 'block';
		}else{
			con.style.display = 'none';
		}
	}
	
	function viewMine() {
		value = document.getElementsByName("id")[0].value;
		open('s-member_detail.jsp?id='+value,'confirm','width=500,height=500');
	}
</script>

<aside>
	<a href ="s-member_input.jsp">
		<input type="button" class=mInputButton value="멤버 등록하기">
	</a><br/>
</aside>

<section class="section1">
	<div>
		<a href="javascript:doDisplay();">검색조건 보기</a><br/>
	</div>


	<form action="s-member_search.jsp" method= "post" class="form-box1">
		<table border=1>
			<tr>
				<th>경력</th>	
				<td>
					<select name="career">
						<option value="all">전체</option>
						<option>신입</option>
						<option>1년차</option>
						<option>2년차</option>
						<option>3년차</option>
						<option>4년차</option>
						<option>5년차</option>
						<option>6년차</option>
						<option>7년차이상</option>
					</select>
				</td>
			</tr>

			
			<tr>
				<th>분야</th>
				<td>
					<select name="field">
						<option value="all">전체</option>
						<option>개발</option>
						<option>기획</option>
						<option>디자인</option>
					</select>
				</td>
			</tr>
		
			<tr>
				<th>업무 방식</th>	
				<td>
					<select name="worktype">
						<option>원격</option>
						<option>상주</option>
						<option>협의</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th>지역</th>
				<td>
					<select name="location">
						<option value="all">상관없음</option>
						<option>서울</option>
						<option>경기</option>
						<option>인천</option>
						<option>강원</option>
						<option>충북</option>
						<option>충남</option>
						<option>대전</option>
						<option>세종</option>
						<option>전북</option>
						<option>전남</option>
						<option>광주</option>
						<option>경북</option>
						<option>경남</option>
						<option>대구</option>
						<option>울산</option>
						<option>부산</option>
						<option>제주</option>
					</select>
				</td>	
			</tr>
			
			<tr>
			<th>활동 유형</th>
				<td>
					<select name="employtype">
						<option value="all">상관없음</option>
						<option value="개인">개인 프리랜서</option>
						<option value="팀">팀 프리랜서드</option>
						<option value="개인사업">개인 사업자</option>
						<option value="법인사업">법인 사업자</option>
					</select>
				</td>	
			</tr>
			
			<tr>
			<th>프로젝트 유형</th>
				<td>
					<select name="projecttype">
						<option value="사이드">사이드 프로젝트</option>
						<option value="메인">메인 프로젝트</option>
					</select>
				</td>	
			</tr>
			
			<tr>
			<th>구직활동여부</th>
				<td>
					<select name="available">
						<option value="1">on</option>
						<option value="0">off</option>
					</select> 
				</td>
			</tr>
		
			<tr>
				<td colspan=2 align="center">
					<input type="submit" value="검색" />
				</td>
			</tr>	
			
		</table>
	</form>
</section>

<section class="section3">
<% 
	for(SmemberDTO dto : list) { %>
	<div>
		<table class="mboard" >
			<tr>
				<th><a href="s-member_detail.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><%=dto.getId() %></a></th>
				<th>
				<%if(dto.getAvailable() == 1) { %>
				<img src="image/switch-on.png" width="40px" height="36px"> 
				<%} else{ %>
				<img src="image/switch-off.png" width="40px" height="36px">
				<%} %>
				</th>
				<th><%=dto.getField() %></th>
			</tr>
			<tr>
				<th><%=dto.getCareer() %></th>
				<th><%=dto.getEmploytype() %></th>
				<th><%=dto.getLocation() %></th>
				<th><%=dto.getWorktype() %></th>
			</tr>
			<tr>
			<td colspan="4"> <%=dto.getIntroduce() %>
			</td>
			</tr>
		</table><br/>
	</div>

<%}
}%>
</section>

<section class="section4">
<%
	if (count > 0) {
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / 10)* 10 +1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock -1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
		
		if (startPage >10) {
%>			<a href="s-member.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%		}
	
		for (int i = startPage ; i <= endPage ; i++) {
%> 			<a href="s-member.jsp?pageNum=<%=i%>">[<%=i %>] </a>
<%		}
	
		if(endPage < pageCount) {
%>		<a href="s-member.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
<%		}
	}
%>
</section>

<footer>
	<hr color="skyblue" size="2"  align="center" />
	
	<table width="500" align="right">
      
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
          		<td>사이트소개</td>
          		<td>
          			<a href="/goworker/s-member/s-member.jsp">팀원찾기</a>
         		</td>
          		<td>회원가입</td>
          		<td>공지사항</td> 
        	</tr>
        
        	<tr>
				<td>이용방법</td>
	          	<td>프로젝트찾기</td>
	          	<td>회원정보수정</td>
	         	 <td>Q&A</td>
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
