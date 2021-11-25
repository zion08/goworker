<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDAO" %> 
<%@ page import="bean.SmemberDTO" %>  
<%@ page import="java.util.List" %>
<%@ include file = "../include/header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<title>멤버 찾기</title>

<%		
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
	int available;
	if(avail==null) {
		available = 1;
	} else {
		available = Integer.parseInt(avail);
	}
	
			
	//글 리스트 출력 및 페이지 처리 관련
	List<SmemberDTO> list = null;		// 검색 결과 저장할 리스트
	String resultNone = new String();	// 검색 결과 없을때 사용
	
	int scount = 0;			//총 컨텐츠(글) 갯수
	
	String pageSizeStr = request.getParameter("pageSize"); //1개 페이지에 보여줄 컨텐츠(글) 갯수
	if (pageSizeStr == null) {
		pageSizeStr = "100";
	} 
	int pageSize = Integer.parseInt(pageSizeStr);	//1개 페이지에 보여줄 컨텐츠(글)
	
	
	if(pageNum==null) {
		pageNum = "1"; // 값이 안넘어오는경우 >> 첫페이지인경우 
	}
	int currentPage = Integer.parseInt(pageNum);	//현제 페이지=pageNum, String > Integer 변환
	int start = (currentPage - 1) * pageSize + 1;	//현재 페이지 기준으로 DB에 저장된 내용을 잘라서 들고와야 함		
	int end = currentPage * pageSize;
	
	int pageBlock = 10;	//페이지 버튼의 출력 단위
	int pageCount = 0;	//총 페이지 수
	int startPage = 0;	//페이지 버튼 시작 번호
	int endPage = 0;	//페이지 버튼 끝 번호
	
	
	//1st. 전체 컨텐츠 가져오기 
	SmemberDAO dao = new SmemberDAO();	// dao 객체 생성
	scount = dao.getSearchCount(career, field, worktype,	// 검색 결과 갯수 저장
			location, employtype, projecttype,
			available);
	
	if(scount > 0) {										// 검색 결과 저장
		list = dao.getSearchList(career, field, worktype, 	
								location, employtype, projecttype,
								available, start, end );
		
		//2nd. 페이지관련 변수 계산
		pageCount = scount / pageSize + (scount % pageSize == 0 ? 0 : 1);	//총 페이지 수
		startPage = (currentPage / 10)* 10 +1;		//페이지 버튼 시작 번호
		endPage = startPage + pageBlock -1;			//페이지 버튼 끝 번호		
	} else {
		resultNone = "검색결과가 없습니다...!!";	// 검색 결과 없을때 사용
	}

	
	// 검색 결과 확인용
	System.out.println("갯수: " + scount);
	System.out.println(list);
%>

<title>멤버 찾기</title>

<div class="searchfor-disply">
	<a href="javascript:doDisplay();">검색조건 보기</a>
</div>

<section class="section2" >
	<form action="s-member_search.jsp" method= "post" class="form-box1" id="checkboard">
		<ul class="searchfor">			
			<li>
				<label>경력</label> 
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
			</li>
			
			<li>
				<label>분야</label> 
				<select name="field">
					<option value="%">전체</option>
					<option value="dev">개발</option>
					<option value="plan">기획</option>
					<option value="design">디자인</option>
				</select>
			</li>
			
			<li>
				<label>업무 방식</label> 
				<select name="worktype">
					<option value="%">전체</option>
					<option value="online">원격</option>
					<option value="office">상주</option>
					<option value="discuss">협의</option>
				</select>
			</li>
			
			<li>
				<label>지역</label> 
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
			</li>
			
			<li>
				<label>활동 유형</label> 
				<select name="employtype">
						<option value="%">전체</option>
						<option value="sfree">개인 프리랜서</option>
						<option value="tfree">팀 프리랜서</option>
						<option value="sbusiness">개인 사업자</option>
						<option value="cbusiness">법인 사업자</option>
				</select>
			</li>
			
			<li>
				<label>프로젝트유형</label> 
				<select name="projecttype">
						<option value="%">전체</option>
						<option value="side">사이드 프로젝트</option>
						<option value="main">메인 프로젝트</option>
				</select>
			</li>
			
			<li>
				<label>구직 활동</label> 
				<select name="available">
						<option value="1">on</option>
						<option value="0">off</option>
				</select>
			</li>
			
		</ul>	
		
		<div class="wrapper-submit2">
			<input type="submit" value="검색" />
		</div>
	</form>
</section>


<!-- 검색기능 페이징 구현 에러로 인한 페이지사이즈 조절 블락   
<form class="pagesize">
	<select name="pageSize">
		<option value="8">8개</option>
		<option value="12">12개</option>
		<option value="16">16개</option>
		<option value="20">20개</option>
		<option value="28">28개</option>
		<option value="36">36개</option>
		<option value="60">60개</option>
	</select>
	<input type="submit" value="확인" />
</form>
-->
<section class="section5">
<%	
	//3rd. 컨텐츠(글) 리스트 출력
	if (list == null) {		//작성된 글이 없을때
%>	<h2><%=resultNone%></h2>
<%	}

	//3rd. 컨텐츠(글) 리스트 출력
	if (list != null) {		//작성된 글이 있을떄
		for(SmemberDTO sdto : list) {
			//한글패치
			if((sdto.getCareer())==null){
				sdto.setCareer("미입력");
			}
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
			if((sdto.getField())==null) {
				sdto.setField("미입력"); 
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
			if((sdto.getEmploytype())==null){
				sdto.setEmploytype("미입력");
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
			if((sdto.getProjecttype())==null){
				sdto.setProjecttype("미입력");
			}
			if((sdto.getProjecttype()).equals("side")) {
				sdto.setProjecttype("사이드 프로젝트"); 
			}
			if((sdto.getProjecttype()).equals("main")) {
				sdto.setProjecttype("메인 프로젝트"); 
			}
			if((sdto.getProjecttype()).equals("sidemain")) {
				sdto.setProjecttype("둘 다"); 
			}
			if((sdto.getWorktype())==null) {
				sdto.setWorktype("미입력");
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
			
			if(sdto.getLang() == null){
				if((sdto.getField()).equals("기획")){
					sdto.setLang("기획");
				}
				if((sdto.getField()).equals("디자인")){
					sdto.setLang("디자인");
				}
				if((sdto.getField())==null){
					sdto.setLang("미입력");
				}
			}
			if((sdto.getLocation())==null) {
				sdto.setLocation("미입력");
			}
			if((sdto.getLocation()).equals("all")) {
				sdto.setLocation("전지역"); 
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
			if((sdto.getLocation()).equals("daejeon")) {
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
			if((sdto.getLocation()).equals("ulsan")) {
				sdto.setLocation("울산"); 
			}
			if((sdto.getLocation()).equals("busan")) {
				sdto.setLocation("부산"); 
			}
			if((sdto.getLocation()).equals("jeju")) {
				sdto.setLocation("제주"); 
			} 
			
%>			<div class="mboard">
				<ul class="mboard-inside">
					<li class="mb-merge-center">
						<a href="s-member_detail.jsp?num=<%=sdto.getNum()%>&pageNum=<%=pageNum%>">
							<span><%=sdto.getId() %></span>
						</a>
					</li>
					
					<li class="mb-center">
<%						if(sdto.getAvailable() == 1) { 
%>							<img src="image/switch-on.png" width="40px" height="36px"> 
<%						} else { 
%>							<img src="image/switch-off.png" width="40px" height="36px">
<%						} 
%>					</li>
					
					<li class="mb-center">
						<%= sdto.getField() %>
					</li>
					
					<li class="mb-merge-center">
						<%= sdto.getLang() %>
					</li>
					
					<li class="mb-center">
						경력: <%=sdto.getCareer()%>
					</li>
					
					<li class="mb-center">
						<%= sdto.getLocation() %>
					</li>
					
					<li class="mb-center">
						<%=sdto.getWorktype() %>
					</li>
					
					<li class="mb-center">
						<img src="image/thumbs.png" width="20px" height="20px"/>
						<%=sdto.getGood() %>
					</li>
				</ul>
			</div>
<%		}
	}
%>
</section>


<section class="section2">
<%	//4th. 페이지 버튼 출력			
	if(endPage > pageCount) {
		endPage = pageCount;
	}

	if (startPage > pageBlock) {
%>		<a href="s-member_search.jsp?pageNum=<%= startPage - pageBlock %>">[이전]</a>
<%	}
	
	for (int i = startPage ; i <= endPage ; i++) {
%> 		<a href="s-member_search.jsp?pageNum=<%=i%>">[<%=i %>] </a>
<%	}
	
	if(endPage < pageCount) {
%>		<a href="s-member_search.jsp?pageNum=<%= startPage + pageBlock %>">[다음]</a>
<%	}
%>
</section>


<%@ include file = "../include/footer.jsp" %>

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

