<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDAO" %> 
<%@ page import="bean.SmemberDTO" %>  
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>

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
	<a href ="s-member_input.jsp"><input type="button" class=mInputButton value="멤버 등록하기"></a><br/><br/>
</aside>

<%	// 인코딩
	request.setCharacterEncoding("UTF-8");
	
	// 파리미터 받기
	String pageNum = request.getParameter("pageNum");
	String my = request.getParameter("my");
	String career = request.getParameter("career");
	String field = request.getParameter("field");
	String worktype = request.getParameter("worktype");
	String location = request.getParameter("location");
	String employtype = request.getParameter("employtype");
	String projecttype = request.getParameter("projecttype");
	String period = request.getParameter("period");
	String avail = request.getParameter("available");
	
	// 문자 > 숫자 변환
	if (avail.isEmpty()) {
		avail = String.valueOf('1');
	}
	int available = Integer.parseInt(avail);
	
	// 페이지 처리
	int pageSize = 20;
	if(pageNum==null) {
		pageNum = "1"; // 값이 안넘어오는경우 >> 첫페이지인경우 
	}
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage - 1) * pageSize + 1;		
	int end = currentPage * pageSize;
	
	// dto 객체 생성
	SmemberDTO dto = new SmemberDTO();
	
	// dto에 파라미터 입력
	dto.setCareer(career);
	dto.setField(field);
	dto.setWorktype(worktype);
	dto.setLocation(location);
	dto.setEmploytype(employtype);
	dto.setProjecttype(projecttype);	
	dto.setAvailable(available);	
	
	// 입력값 확인용
	System.out.println("career: " + dto.getCareer());
	System.out.println("field: " + dto.getField());	
	System.out.println("worktype: " + dto.getWorktype());
	System.out.println("location: " + dto.getLocation());
	System.out.println("employtype: " + dto.getEmploytype());
	System.out.println("projecttype: " + dto.getProjecttype());
	System.out.println("available: " + dto.getAvailable());
	System.out.println(start);
	System.out.println(end);

	// dao 객체 생성
	SmemberDAO dao = new SmemberDAO();
	int scount = 0;					// 검색 결과 갯수 저장할 변수
	List<SmemberDTO> list = null;	// 검색 결과 저장할 리스트
	String resultNone = new String();		// 검색 결과 없을때 사용
			
	scount = dao.getSearchCount(career, field, worktype,	// 검색 결과 갯수 저장
								location, employtype, projecttype,
								available); 
	if(scount > 0) {		
		list = dao.getSearchList(career, field, worktype, 	// 검색 결과 저장
								location, employtype, projecttype,
								available, start, end );	
	} else {
		resultNone = "검색결과가 없습니다...!!";	// 검색 결과 없을때 사용
	}
	
	// 검색 결과 확인용
	System.out.println("갯수: " + scount);
	System.out.println(list);
%>


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


<section class="section1">

<%	
	if (scount == 0) { 
%> 		<p><%=resultNone%></p>	
<%	} 

 /*if(scount > 0) { 
	
	if((sdto.getCareer()).equals("new")) {
		sdto.setCareer("신입"); 
	}
	if((sdto.getCareer()).equals("1")) {
		sdto.setCareer("1년차"); 
	}
	if((sdto.getCareer()).equals("2")) {
		sdto.setCareer("2년차"); 
	}
	if((sdto.getCareer()).equals("3")) {
		sdto.setCareer("3년차"); 
	}
	if((sdto.getCareer()).equals("4")) {
		sdto.setCareer("4년차"); 
	}
	if((sdto.getCareer()).equals("5")) {
		sdto.setCareer("5년차"); 
	}
	if((sdto.getCareer()).equals("6")) {
		sdto.setCareer("6년차"); 
	}
	if((sdto.getCareer()).equals("7")) {
		sdto.setCareer("7년차 이상"); 
	}
	if((sdto.getField()).equals("dev")) {
		sdto.setField("개발"); 
	}
	if((sdto.getField()).equals("plan")) {
		sdto.setField("기획"); 
	}
	if((sdto.getField()).equals("design")) {
		sdto.setField("디자인"); 
	}
	if((sdto.getEmploytype()).equals("sfree")) {
		sdto.setEmploytype("개인 프리랜서"); 
	}
	if((sdto.getEmploytype()).equals("tfree")) {
		sdto.setEmploytype("팀 프리랜서"); 
	}
	if((sdto.getEmploytype()).equals("sbusiness")) {
		sdto.setEmploytype("개인 사업자"); 
	}
	if((sdto.getEmploytype()).equals("cbusiness")) {
		sdto.setEmploytype("법인 사업자"); 
	}
	if((sdto.getProjecttype()).equals("side")) {
		sdto.setProjecttype("사이드 프로젝트"); 
	}
	if((sdto.getProjecttype()).equals("main")) {
		sdto.setProjecttype("메인 프로젝트"); 
	}
	if((sdto.getWorktype()).equals("online")){
		sdto.setWorktype("원격"); 
	}
	if((sdto.getWorktype()).equals("office")){
		sdto.setWorktype("상주"); 
	}
	if((sdto.getWorktype()).equals("discuss")){
		sdto.setWorktype("협의"); 
	}

	if((sdto.getLocation()).equals("online")) {
		sdto.setLocation("원격"); 
	}
	if((sdto.getLocation()).equals("seoul")) {
		sdto.setLocation("서울"); 
	}
	if((sdto.getLocation()).equals("gyunggi")) {
		sdto.setLocation("경기"); 
	}
	if((sdto.getLocation()).equals("incheon")) {
		sdto.setLocation("인천"); 
	}
	if((sdto.getLocation()).equals("gangwon")) {
		sdto.setLocation("강원"); 
	}
	if((sdto.getLocation()).equals("chungbuk")) {
		sdto.setLocation("충북"); 
	}
	if((sdto.getLocation()).equals("chungnam")) {
		sdto.setLocation("충남"); 
	}
	if((sdto.getLocation()).equals("deajeon")) {
		sdto.setLocation("대전"); 
	}
	if((sdto.getLocation()).equals("sejong")) {
		sdto.setLocation("세종"); 
	}
	if((sdto.getLocation()).equals("jeonbuk")) {
		sdto.setLocation("전북"); 
	}
	if((sdto.getLocation()).equals("jeonnam")) {
		sdto.setLocation("전남"); 
	}
	if((sdto.getLocation()).equals("gwangju")) {
		sdto.setLocation("광주"); 
	}
	if((sdto.getLocation()).equals("gyungbuk")) {
		sdto.setLocation("경북"); 
	}
	if((sdto.getLocation()).equals("gyungnam")) {
		sdto.setLocation("경남"); 
	}
	if((sdto.getLocation()).equals("daegu")) {
		sdto.setLocation("대구"); 
	}
	if((sdto.getLocation()).equals("busan")) {
		sdto.setLocation("부산"); 
	}
	if((sdto.getLocation()).equals("jeju")) {
		sdto.setLocation("제주"); 
	}	
	*/
  
	if (scount > 0) {
					
		for(SmemberDTO sdto : list) {
%>				<input type="button" value="메세지" onclick="window.open('../message/message.jsp?num=<%=sdto.getNum() %>','message','width=300, height=150');" >	
					<table class="mboard">
						<tr>
							<th>
								<a href="s-member_detail.jsp?num=<%=sdto.getNum()%>&pageNum=<%=pageNum%>"><%=sdto.getId() %>
								</a>
							</th>
							<th>
<%								if( sdto.getAvailable() == 1) { 
%>										<img src="image/switch-on.png" width="40px" height="36px"> 
<%									} else { 
%>										<img src="image/switch-off.png" width="40px" height="36px">
<%									} 
%>							</th>
							<th>
								<%=sdto.getField() %>
							</th>
							<td>
								<img src="image/view.png" width="20px" height="20px"/><%=dto.getReadcount() %>
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
					</table>
					<!-- </form> -->
				<br/>
			
<%		}
%>

<%	}	
%>	
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