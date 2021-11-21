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

<section class="section1" >
	<div>
		<a href="javascript:doDisplay();">검색조건 보기</a><br/>
	</div>

	<form action="s-member_search.jsp" method= "post" class="form-box1">
		<table border=1 id="checkboard">
			<tr>
				<th>경력</th>	
				<td>
					<select name="career">
						<option value="%">전체</option>
						<option value="new">신입</option>
						<option value="1">1년차</option>
						<option value="2">2년차</option>
						<option value="3">3년차</option>
						<option value="4">4년차</option>
						<option value="5">5년차</option>
						<option value="6">6년차</option>
						<option value="7">7년차이상</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th>분야</th>
				<td>
					<select name="field">
						<option value="%">전체</option>
						<option value="dev">개발</option>
						<option value="plan">기획</option>
						<option value="design">디자인</option>
					</select>
				</td>
			</tr>
		
			<tr>
				<th>업무 방식</th>	
				<td>
					<select name="worktype">
						<option value="%">전체</option>
						<option value="online">원격</option>
						<option value="office">상주</option>
						<option value="discuss">협의</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th>지역</th>
				<td>
					<select name="location">
						<option value="%">원격</option>
						<option value="seoul">서울</option>
						<option value="gyunggi">경기</option>
						<option value="incheon">인천</option>
						<option value="gangwon">강원</option>
						<option value="chungbuk">충북</option>
						<option value="chungnam">충남</option>
						<option value="daejeon">대전</option>
						<option value="sejong">세종</option>
						<option value="jeonbuk">전북</option>
						<option value="jeonnam">전남</option>
						<option value="gwangju">광주</option>
						<option value="gyungbuk">경북</option>
						<option value="gyungnam">경남</option>
						<option value="daegu">대구</option>
						<option value="ulsan">울산</option>
						<option value="busan">부산</option>
						<option value="jeju">제주</option>
					</select>
				</td>	
			</tr>
			
			<tr>
			<th>활동 유형</th>
				<td>
					<select name="employtype">
						<option value="%">전체</option>
						<option value="sfree">개인 프리랜서</option>
						<option value="tfree">팀 프리랜서드</option>
						<option value="sbusiness">개인 사업자</option>
						<option value="cbusiness">법인 사업자</option>
					</select>
				</td>	
			</tr>
			
			<tr>
			<th>프로젝트 유형</th>
				<td>
					<select name="projecttype">
						<option value="%">전체</option>
						<option value="side">사이드 프로젝트</option>
						<option value="main">메인 프로젝트</option>
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
<% /*
if((dto.getCareer()).equals("new")) {
	dto.setCareer("신입"); 
}
if((dto.getCareer()).equals("1")) {
	dto.setCareer("1년차"); 
}
if((dto.getCareer()).equals("2")) {
	dto.setCareer("2년차"); 
}
if((dto.getCareer()).equals("3")) {
	dto.setCareer("3년차"); 
}
if((dto.getCareer()).equals("4")) {
	dto.setCareer("4년차"); 
}
if((dto.getCareer()).equals("5")) {
	dto.setCareer("5년차"); 
}
if((dto.getCareer()).equals("6")) {
	dto.setCareer("6년차"); 
}
if((dto.getCareer()).equals("7")) {
	dto.setCareer("7년차 이상"); 
}
if((dto.getField()).equals("dev")) {
	dto.setField("개발"); 
}
if((dto.getField()).equals("plan")) {
	dto.setField("기획"); 
}
if((dto.getField()).equals("design")) {
	dto.setField("디자인"); 
}
if((dto.getEmploytype()).equals("sfree")) {
	dto.setEmploytype("개인 프리랜서"); 
}
if((dto.getEmploytype()).equals("tfree")) {
	dto.setEmploytype("팀 프리랜서"); 
}
if((dto.getEmploytype()).equals("sbusiness")) {
	dto.setEmploytype("개인 사업자"); 
}
if((dto.getEmploytype()).equals("cbusiness")) {
	dto.setEmploytype("법인 사업자"); 
}
if((dto.getProjecttype()).equals("side")) {
	dto.setProjecttype("사이드 프로젝트"); 
}
if((dto.getProjecttype()).equals("main")) {
	dto.setProjecttype("메인 프로젝트"); 
}
if((dto.getWorktype()).equals("online")){
	dto.setWorktype("원격"); 
}
if((dto.getWorktype()).equals("office")){
	dto.setWorktype("상주"); 
}
if((dto.getWorktype()).equals("discuss")){
	dto.setWorktype("협의"); 
}

if((dto.getLocation()).equals("online")) {
	dto.setLocation("원격"); 
}
if((dto.getLocation()).equals("seoul")) {
	dto.setLocation("서울"); 
}
if((dto.getLocation()).equals("gyunggi")) {
	dto.setLocation("경기"); 
}
if((dto.getLocation()).equals("incheon")) {
	dto.setLocation("인천"); 
}
if((dto.getLocation()).equals("gangwon")) {
	dto.setLocation("강원"); 
}
if((dto.getLocation()).equals("chungbuk")) {
	dto.setLocation("충북"); 
}
if((dto.getLocation()).equals("chungnam")) {
	dto.setLocation("충남"); 
}
if((dto.getLocation()).equals("deajeon")) {
	dto.setLocation("대전"); 
}
if((dto.getLocation()).equals("sejong")) {
	dto.setLocation("세종"); 
}
if((dto.getLocation()).equals("jeonbuk")) {
	dto.setLocation("전북"); 
}
if((dto.getLocation()).equals("jeonnam")) {
	dto.setLocation("전남"); 
}
if((dto.getLocation()).equals("gwangju")) {
	dto.setLocation("광주"); 
}
if((dto.getLocation()).equals("gyungbuk")) {
	dto.setLocation("경북"); 
}
if((dto.getLocation()).equals("gyungnam")) {
	dto.setLocation("경남"); 
}
if((dto.getLocation()).equals("daegu")) {
	dto.setLocation("대구"); 
}
if((dto.getLocation()).equals("busan")) {
	dto.setLocation("부산"); 
}
if((dto.getLocation()).equals("jeju")) {
	dto.setLocation("제주"); 
}	
*/
%>
				

	
	<div>
		<input type="button" value="메세지" onclick="window.open('../message/message.jsp?num=<%=dto.getNum()%>','message','width=355px, height=540px');" >
		<table class="mboard" style="table-layout:fixed" >
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
				<td><img src="image/view.png" width="20px" height="20px"/><%=dto.getReadcount() %>
					<img src="image/thumbs.png" width="20px" height="20px"/><%=dto.getGood() %>
				</td>
			</tr>
			<tr>
				<th><%=dto.getCareer() %></th>
				<th><%=dto.getEmploytype() %></th>
				<th><%=dto.getLocation() %></th>
				<th><%=dto.getWorktype() %></th>
			</tr>
			<tr>
			<td colspan="4" style="text-overflow:ellipsis; white-space:nowrap; overflow:hidden;"> <%=dto.getIntroduce() %>
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

<%@ include file = "../include/footer.jsp" %>