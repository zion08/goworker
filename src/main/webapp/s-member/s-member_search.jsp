<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDAO" %> 
<%@ page import="bean.SmemberDTO" %>  
<%@ page import="java.util.List" %>



<%	
		


	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	String my = request.getParameter("my");
	
	String career = request.getParameter("career");
	String field = request.getParameter("field");
	String worktype = request.getParameter("worktype");
	String location = request.getParameter("location");
	String employtype = request.getParameter("employtype");
	String period = request.getParameter("period");
	String avail = request.getParameter("available");
	int available = Integer.parseInt(avail);
	
	
	int pageSize = 20;
	if(pageNum==null) {
		pageNum = "1"; // 값이 안넘어오는경우 >> 첫페이지인경우 
	}
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage - 1) * pageSize + 1;		
	int end = currentPage * pageSize;
	
	
	
	
	
	SmemberDTO dto = new SmemberDTO();
	
		dto.setCareer(career);
		//career = dto.getCareer();
	
		dto.setField(field);
		//field = dto.getField();
	
		dto.setWorktype(worktype);
		//worktype = dto.getWorktype();

		dto.setLocation(location);
		//location = dto.getLocation();

		dto.setEmploytype(employtype);
		//employtype = dto.getEmploytype();
	
		dto.setAvailable(available);
		//available = dto.getAvailable();
	
	System.out.println(dto.getCareer());
	System.out.println(dto.getWorktype());
	System.out.println(dto.getLocation());
	System.out.println(dto.getEmploytype());
	System.out.println(dto.getAvailable());
	System.out.println(start);
	System.out.println(end);

	
	
	

			
	
	
	SmemberDAO dao = new SmemberDAO();
	int scount = 0; 
	List<SmemberDTO> list = null;	
			
		scount = dao.getSearchCount( career ,field, worktype, location,employtype ,available); // 전체 글의 갯수
		if(scount > 0) {
			list = dao.getSearchList( career ,field, worktype, location,employtype ,available, start, end );	
		}
		System.out.println(scount);
		System.out.println(list);
		
	
%>


<html>
<link href="style.css" rel="stylesheet" type="text/css">
<title>멤버 찾기</title>
<style>
	aside{display: flex;
	}
	section {
			 display: table; margin-left: auto; margin-right: auto;
	}
	.mboard{ border-style : groove;
			width: 400px;
			height : 120px;
			text-align : center;
			border-radius : 5%;
	}
	.mInputButton {
	text-align : center;
	width : 150px;
	height : 70px;
	border-style : groove;
	border-radius : 7%;
	}
</style>
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
<header>
	<div class="logo">
		<a href="/goworker/main/index.jsp"><img src="image/logo.png" width= "80" height="80"/></a>
		
	</div>
	<div class="sideicon" align="right" width="400" height="70">
		<br/>
		<a href="">쪽지함</a>&emsp;
		<input type="button" name="signin" value="가입하기" class="sign"/>&emsp;
		<input type="button" name="login" value="로그인" class="login"/>&emsp;
	</div>


</header>
<hr color="skyblue" size="2"  align="center" />


<aside>
<a href ="s-member_input.jsp"><input type="button" class=mInputButton value="멤버 등록하기"></a><br/><br/>

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
						<option>원격</option>
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
	<%if(scount > 0) { 
		for(SmemberDTO sdto : list) { 
		%>
	<div>
		<table class="mboard" >
			<tr>
				<th><a href="s-member_detail.jsp?num=<%=sdto.getNum()%>&pageNum=<%=pageNum%>"><%=sdto.getId() %></a></th>
				<th>
				<%if(sdto.getAvailable() == 1) { %>
				<img src="image/switch-on.png" width="40px" height="36px"> 
				<%} else{ %>
				<img src="image/switch-off.png" width="40px" height="36px">
				<%} %>
				</th>
				<th><%=sdto.getField() %></th>
				<td><img src="image/view.png" width="20px" height="20px"/><%=dto.getReadcount() %>
					<img src="image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>
				</td>
			</tr>
			<tr>
				<th><%=sdto.getCareer() %></th>
				<th><%=sdto.getEmploytype() %></th>
				<th><%=sdto.getLocation() %></th>
				<th><%=sdto.getWorktype() %></th>
			</tr>
			<tr>
			<td colspan="4"> <%=sdto.getIntroduce() %>
			</td>
			</tr>
		</table><br/>
		
	</div>
		<%} 
			
		
		}else {%> 
		검색결과가 없습니다...!!
		
		<%}%>	

	



</section>
<section class="section4">
<%
	if (scount > 0) {
		int pageCount = scount / pageSize + (scount % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / 10)* 10 +1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock -1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
		
		if (startPage >10) {
%>			<a href="s-member_search.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%		}
	
		for (int i = startPage ; i <= endPage ; i++) {
%> 			<a href="s-member_search.jsp?pageNum=<%=i%>">[<%=i %>] </a>
<%		}
	
		if(endPage < pageCount) {
%>		<a href="s-member_search.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
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
          <td><a href="/goworker/s-member/s-member.jsp">팀원찾기</a></td>
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

</html>