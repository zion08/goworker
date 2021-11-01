<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDAO" %> 
<%@ page import="bean.SmemberDTO" %>  
<%@ page import="java.util.List" %>



<%	
		


	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	String my = request.getParameter("my");
	String num = request.getParameter("num");
	String career = request.getParameter("career");
	String field = request.getParameter("field");
	String worktype = request.getParameter("worktype");
	String location = request.getParameter("location");
	String employtype = request.getParameter("employtype");
	String period = request.getParameter("period");
	String avail = request.getParameter("available");
	int available = Integer.parseInt(avail);
	String all = "all";
	int pageSize = 10;
	if(pageNum==null) {
		pageNum = "1"; // 값이 안넘어오는경우 >> 첫페이지인경우 
	}
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage - 1) * pageSize + 1;		
	int end = currentPage * pageSize;
	
	
	
	
	
	SmemberDTO dto = new SmemberDTO();
	/*if (career.equals(all)) {
		dto.setCareer("'신입','1년차','2년차','3년차','4년차','5년차','6년차','7년차 이상'");
	} else {
		dto.setCareer(career);
	}
	
	if (field.equals(all)) {
		dto.setField("'개발','기획','디자인','기타'");
	} else {
		dto.setField(field);
	}
	
	if (worktype.equals(all)) {
		dto.setWorktype("'온라인','사무실','의견조율'");
	} else {
		dto.setWorktype(worktype);	
	}
	
	if (location.equals(all)) {
		dto.setLocation("'서울','경기','인천','강원','충북','충남','대전','세종','전북','전남','광주','경북','경남','대구','울산','부산','제주'");	
	} else {
		dto.setLocation(location);
	}
	
	if (employtype.equals(all)) {
		dto.setEmploytype("'토이','계약직','정규직'");
	} else {
		dto.setEmploytype(employtype);	
	}*/
	
	dto.setCareer(career);
	dto.setField(field);
	dto.setWorktype(worktype);
	dto.setLocation(location);
	dto.setEmploytype(employtype);	
	dto.setAvailable(available);
	
	System.out.println(dto.getCareer());
	System.out.println(dto.getWorktype());
	System.out.println(dto.getLocation()  );
	System.out.println(dto.getEmploytype());
	System.out.println(start);
	System.out.println(end);
	System.out.println(period);
	
	
	

			
	
	
	SmemberDAO dao = new SmemberDAO();
	int count = 0; 
	List<SmemberDTO> list = null;	
	if(my == null) {		
		count = dao.getSearchCount(career,field,worktype,location,employtype,available); // 전체 글의 갯수
		if(count > 0) {
			list = dao.getSearchList( career,field,worktype,location,employtype,available, start, end );	
		}	
		System.out.println(count);
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
<section>

<a href="javascript:doDisplay();"> 검색조건 보기</a><br/><br/>

<div id="checkboard">
	<form action="s-member_search.jsp" method= "post" >
	<table border=1>
		<tr>
			<th>경력</th>	
			<td>
			<select name="career">
				<option value="all">전체</option>
				<option value="신입">신입</option>
				<option value="1년차">1년차</option>
				<option value="2년차">2년차</option>
				<option value="3년차">3년차</option>
				<option value="4년차">4년차</option>
				<option value="5년차">5년차</option>
				<option value="6년차">6년차</option>
				<option value="7년차이상">7년차이상</option>
			</select>
			</td>
		</tr>
		<tr>
		<th>분야</th>
		<td><select name="field">
				<option value="all">전체</option>
				<option value="개발">개발</option>
				<option value="기획">기획</option>
				<option value="디자인">디자인</option>
				<option value="기타">기타</option>
		</select>
			
		</td>
	</tr>
	
		<tr>
			<th>업무방식</th>	
			<td><select name="worktype">
			<option value="all">전체</option>
				<option value="온라인">온라인</option>
				<option value="사무실">사무실</option>
				<option value="의견조율">의견조율</option>
				</select>
			</td>
		</tr>
		<tr>
		<th>지역</th>
		<td><select name="location">
			<option value="all">상관없음</option>
			<option value="서울">서울</option>
			<option value="경기">경기</option>
			<option value="인천">인천</option>
			<option value="강원">강원</option>
			<option value="충북">충북</option>
			<option value="충남">충남</option>
			<option value="대전">대전</option>
			<option value="세종">세종</option>
			<option value="전북">전북</option>
			<option value="전남">전남</option>
			<option value="광주">광주</option>
			<option value="경북">경북</option>
			<option value="경남">경남</option>
			<option value="대구">대구</option>
			<option value="울산">울산</option>
			<option value="부산">부산</option>
			<option value="제주">제주</option>
		</select></td>	
	</tr>
	<tr>
		<th>고용타입</th>
		<td><select name="employtype">
			<option value="all">전체</option>
			<option value="토이">토이/사이드</option>
			<option value="계약직">계약직</option>
			<option value="정규직">정규직</option>
		</select></td>	
	</tr>
	
	<tr>
		<th>구직활동여부</th>
		<td><select name="available">
				<option value="1">on</option>
				<option value="2">off</option>
		</select> 
			
		</td>
	<tr>
		<td colspan=2 align="center"> <input type="submit" value="검색" />
		</td>
	</tr>	
	
	</table>
	</form>
</div>

</section><br/>
<section>
	<div>
		<table class="mboard" >
			<tr>
				<th><a href="s-member_detail.jsp">Limtaehoon</a></th>
				<td><img src="image/switch-on.png" width="40px" height="36px">
				</td>
				<th>개발</th>
			</tr>
			<tr>
				<th>신입</th>
				<th>상관없음</th>
				<th>경기</th>
				<th>온라인</th>
			</tr>
			<tr>
			<td colspan="4"> 간단한 소개글 자리 이지만 간단하진 않고  <br/>
					그렇다고 안간단하면 보기 힘듬  
			</td>
			</tr>
		</table>
	</div>


</section>
<section>
	<%if(count > 0) { 
		for(SmemberDTO sdto : list) { 
		%>
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
	
<%		}
	}		
}%>
	



</section>
<section>
<%
	if(count > 0){
	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	
	int startPage = (currentPage / 10)* 10 +1;
	int pageBlock = 10;
	int endPage = startPage + pageBlock -1;
	if(endPage > pageCount) {
		endPage = pageCount;
	}
	if(startPage >10) { %>
		<a href="s-member.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
	<%}
	
	for(int i = startPage ; i <= endPage ; i++) {
		%> <a href="s-member.jsp?pageNum=<%=i%>">[<%=i %>] </a>
	<%}
	
	if(endPage < pageCount) {%>
		<a href="s-member.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
	<%}
	
	
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