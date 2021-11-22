<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="bean.MemberDAO" %>
<%@ page import="bean.MemberDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file = "../include/header.jsp" %>


<%
	String path = request.getRealPath("uploadFile/profileFile"); //실제 경로
	String encoding = "UTF-8"; //한글 파일명 인코딩
	int size = 1024*1024*10; //파일 사이즈
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();	//파일명 중복방지 클래스
	MultipartRequest mr = new MultipartRequest(request,path,size,encoding,dp); //파라미터 받기 및 파일 업로드
	
	// 파일 이름 가져오기
	String profileimg = mr.getFilesystemName("profileimg");
	
	System.out.println(profileimg);	
	
	// 파일 이름 dto 저장
	MemberDTO dto = new MemberDTO();
	dto.setProfileImg(profileimg); 
	
	// 파일 이름 db 저장
	MemberDAO dao = new MemberDAO();
	int result = dao.updateProfileImg(profileimg, sid);
	
	
	
	if(result == 1) {
%>		<script type="text/javascript">
			alert("등록되었습니다.");
			window.location = 'modify.jsp';
		</script>
<%	} else {
%>		<script type="text/javascript">
			alert("잘못된 입력이 있습니다, 확인하세요.");
			history.go(-1);
		</script>
<%	}
%> 