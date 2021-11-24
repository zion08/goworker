<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="bean.SprojectDAO" %>
<%@ page import="bean.SprojectDTO" %>
<%@ page import="java.util.List" %>
<%@ include file="../include/header.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>


<%	 
	//현제 페이지 설정, request로 받는 파라미터는 항상 String
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	
	//글 리스트 출력 및 페이지 처리 관련
	List<SprojectDTO> list = null;	//컨텐츠 내용 저장할 list
	
	int count = 0;		//총 컨텐츠(글) 갯수	
	String pageSizeStr = request.getParameter("pageSize"); //1개 페이지에 보여줄 컨텐츠(글) 갯수
	if (pageSizeStr == null) {
		pageSizeStr = "8";
	} 
	int pageSize = Integer.parseInt(pageSizeStr);
	
	int currentPage = Integer.parseInt(pageNum);	//현제 페이지=pageNum, String > Integer 변환
	int start = (currentPage - 1) * pageSize + 1;	//현재 페이지 기준으로 DB에 저장된 내용을 잘라서 들고와야 함
	int end = currentPage * pageSize;
	
	int pageBlock = 10;	//페이지 버튼의 출력 단위
	int pageCount;	//총 페이지 수
	int startPage;	//페이지 버튼 시작 번호
	int endPage;	//페이지 버튼 끝 번호 

	
	
	//1st. 전체 컨텐츠 가져오기
	SprojectDAO dao = new SprojectDAO();
	count = dao.getCount();
	if (count > 0) {
		list = dao.getAllList(start, end);
	}
	
	//2nd. 페이지관련 변수 계산
	pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);	//총 페이지 수
	startPage = (currentPage / 10) * 10 + 1;	//페이지 버튼 시작 번호
	endPage = startPage + pageBlock -1;			//페이지 버튼 끝 번호

%>

<title>프로젝트 찾기</title>

<div class="searchfor-disply">
	<a href="javascript:doDisplay();">검색조건 보기</a>
</div>

<section class="section2">
	<form action="s-project_search.jsp" method="post" class="form-box1" id="checkboard">
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
					<option value="%">전지역</option>
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
						<option value="tfree">팀 프리랜서드</option>
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
				<label>예상 기간</label> 
				<select name="period">
						<option value="%">전체</option>
						<option value="7">7일</option>
						<option value="30">30일</option>
						<option value="90">90일</option>
						<option value="180">180일</option>
						<option value="365">1년</option>
						<option value="2">2년이상</option>
				</select>
			</li>

			<li>
				<label>예상 급여</label> 
				<select name="pay">
					<option value="%">전체</option>
					<option value="100">100만원</option>
					<option value="200">200만원</option>
					<option value="300">300만원</option>
					<option value="400">400만원</option>
					<option value="500">500만원</option>
					<option value="600">600만원</option>
					<option value="700">700만원</option>
					<option value="800">800만원</option>
					<option value="900">900만원</option>
					<option value="1000">1000만원</option>
					<option value="2000">2000만원</option>
					<option value="3000">3000만원</option>
					<option value="4000">4000만원</option>
					<option value="5000">5000만원</option>
					<option value="10000">10000만원이상</option>
				</select>
			</li>
			
			<li>
				<label>모집</label> 
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

<form class="pagesize">
	<select name="pageSize">
		<option value="8">8개</option>
		<option value="12">12개</option>
		<option value="16">16개</option>
		<option value="20">20개</option>
		<option value="28">28개</option>
		<option value="36">36개</option>
	</select>
	<input type="submit" value="확인" />
</form>


<section class="section5">
<%	
	//3rd. 컨텐츠(글) 리스트 출력
	if (list == null) {		//작성된 글이 없을때
%>	<h1>작성된 글이 없습니다.</h1>
<%	}
%>

<%	//3rd. 컨텐츠(글) 리스트 출력
	if (list != null) {		//작성된 글이 있을떄
		for (SprojectDTO dto : list) {
			//한글패치
			if((dto.getCareer())==null) {
				dto.setCareer("미입력");
			}
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
			if((dto.getField())==null) {
				dto.setField("미입력"); 
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
			if((dto.getEmploytype())==null){
				dto.setEmploytype("미입력");
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
			if((dto.getProjecttype())==null){
				dto.setProjecttype("미입력");
			}
			if((dto.getProjecttype()).equals("side")) {
				dto.setProjecttype("사이드 프로젝트"); 
			}
			if((dto.getProjecttype()).equals("main")) {
				dto.setProjecttype("메인 프로젝트"); 
			}
			if((dto.getProjecttype()).equals("sidemain")) {
				dto.setProjecttype("둘 다");
			}
			if((dto.getWorktype())==null) {
				dto.setWorktype("미입력");
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
			
			if(dto.getLang() == null){
				if((dto.getField()).equals("기획")){
					dto.setLang("기획");
				}
				if((dto.getField()).equals("디자인")){
					dto.setLang("디자인");
				}
				if((dto.getField())==null){
					dto.setLang("미입력");
				}
			}
			if((dto.getLocation())==null) {
				dto.setLocation("미입력");
			}
			if((dto.getLocation()).equals("all")) {
				dto.setLocation("전지역"); 
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
			if((dto.getLocation()).equals("daejeon")) {
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
			
%>			<div class="mboard">
				<ul class="mboard-inside">
					<li class="mb-merge-center">
						<a href="s-project_detail.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>">
							<span><%=dto.getSubject()%></span>
						</a>
					<li class="mb-center">
<%						if (dto.getAvailable() == 1) {
%>							<img src="image/switch-on.png" width="40px" height="36px"> 
<%						} else {
%>							<img src="image/switch-off.png" width="40px" height="36px"> 
<% 						}
%>					</li>
		
					<li class="mb-center">
						<%= dto.getField()%>
					</li>
					
					<li class="mb-merge-center">
						<%= dto.getLang() %>
					</li>
					
					<li class="mb-center">
						요구 경력: <%=dto.getCareer() %>
					</li>
										
					<li class="mb-center">
						<%= dto.getLocation() %>
					</li>
				
					<li class="mb-center">
						예상 기간: <%=dto.getPeriod() %>일
					</li>

					<li class="mb-center">
						<img src="image/thumbs.png" width="20px" height="20px" />
						<%=dto.getGood()%>
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
%>		<a href="s-project.jsp?pageNum=<%= startPage - pageBlock %>">[이전]</a>
<%	}
	
	for (int i = startPage ; i <= endPage ; i++) {
%> 		<a href="s-project.jsp?pageNum=<%=i%>">[<%=i %>] </a>
<%	}
	
	if(endPage < pageCount) {
%>		<a href="s-project.jsp?pageNum=<%= startPage + pageBlock %>">[다음]</a>
<%	}
%>
</section>

<%@ include file="../include/footer.jsp"%>



<script type="text/javascript">
	var bDisplay = true;

	function doDisplay() {
		var con = document.getElementById("checkboard");
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}

	function viewMine() {
		value = document.getElementsByName("id")[0].value;
		open('s-project_detail.jsp?id=' + value, 'confirm',
				'width=500,height=500');
	}	
</script>
