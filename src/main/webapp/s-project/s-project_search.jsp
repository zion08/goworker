<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="bean.SprojectDTO" %>
<%@ page import="bean.SprojectDAO" %>
<%@ page import="java.util.List" %>
<link href="../style.css" rel="stylesheet" type="text/css">

<title>프로젝트 검색</title>
<h1>프로젝트 검색</h1>
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
	<a href ="s-project_input.jsp"><input type="button" class=mInputButton value="멤버 등록하기"></a><br/><br/>
</aside>

<% 
	String pageNum = request.getParameter("pageNum");
	String my = request.getParameter("my");
	String career = request.getParameter("career");
	String field = request.getParameter("field");
	String worktype = request.getParameter("worktype");
	String location = request.getParameter("location");
	String employtype = request.getParameter("employtype");
	String projecttype = request.getParameter("projecttype");
	String period = request.getParameter("period");
	String spay = request.getParameter("pay");
	String avail = request.getParameter("available");
	
	if (avail.isEmpty()) {
		avail = String.valueOf('1');
	}
	int available = Integer.parseInt(avail);
	int pay = Integer.parseInt(spay);
	
	int pageSize = 20;
	if(pageNum==null) {
		pageNum = "1"; // 값이 안넘어오는경우 >> 첫페이지인경우 
	}
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage - 1) * pageSize + 1;		
	int end = currentPage * pageSize;
	
	SprojectDTO dto = new SprojectDTO();
	
	dto.setCareer(career);
	dto.setField(field);
	dto.setWorktype(worktype);
	dto.setLocation(location);
	dto.setEmploytype(employtype);
	dto.setProjecttype(projecttype);	
	dto.setAvailable(available);	
	dto.setPeriod(period);
	dto.setPay(pay);
	
	SprojectDAO dao = new SprojectDAO();
	int scount = 0;					
	List<SprojectDTO> list = null;	
	String resultNone = new String();		
			
	scount = dao.getSearchCount(career, field, worktype,	// 검색 결과 갯수 저장
			location, employtype, projecttype, period, pay,
			available); 
	if(scount > 0) {		
		list = dao.getSearchList(career, field, worktype, 	
								location, employtype, projecttype, period, pay,
								available, start, end );	
	} else {
		resultNone = "검색결과가 없습니다...!!";	// 검색 결과 없을때 사용
	}
%>
<section class="section1">
	<div>
		<a href="javascript:doDisplay();">검색조건 보기</a><br/>
	</div>

	<form action="s-project_search.jsp" method= "post" class="form-box1">
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
			
			<tr>
				<th>예상 기간</th>	
				<td>
					<select name="periond">
						<option value="%">전체</option>
						<option value="7">7일</option>
						<option value="30">30일</option>
						<option value="90">90일</option>
						<option value="180">180일</option>
						<option value="365">1년</option>
						<option value="2">2년이상</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th>예상 급여</th>	
				<td>
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

	if (scount > 0) {
					
		for(SprojectDTO sdto : list) {
%>				<input type="button" value="메세지" onclick="window.open('../message/message.jsp?num=<%=sdto.getNum() %>','message','width=355px, height=540px');" >		
					<table class="mboard">
						<tr>
							<th>
								<a href="s-project_detail.jsp?num=<%=sdto.getNum()%>&pageNum=<%=pageNum%>"><%=sdto.getId() %>
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
							<th><%=sdto.getPeriod() %></th>
							<th><%=sdto.getPay() %></th>
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
	%>			<a href="s-proejct.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
	<%		}
		
			for (int i = startPage ; i <= endPage ; i++) {
	%> 			<a href="s-project.jsp?pageNum=<%=i%>">[<%=i %>] </a>
	<%		}
		
			if(endPage < pageCount) {
	%>		<a href="s-proejct.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
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