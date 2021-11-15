<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bean.SmemberDTO"%>
<%@ page import="bean.SmemberDAO"%>
<%@ page import="bean.FavoriteDTO"%>
<%@ page import="bean.FavoriteDAO"%>
<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="smember" class="bean.FavoriteDTO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심목록</title>
</head>
<body>
	 <%
	 	String sid = null;
	 	if(session.getAttribute("sid") != null){
	 		sid = (String) session.getAttribute("sid");
	 	}
	 	if(sid == null){
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
	 		script.println("location.href = 'login.jsp'");
	 		script.println("</script>");
	 	} 
	 	else{
		 	int Smember_num = 0; 
		 	if (request.getParameter("num") != null){
		 		Smember_num = Integer.parseInt(request.getParameter("num"));
		 	}
		 	/*if (Smember_num == 0){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('유효하지 않은 글입니다.')");
		 		script.println("location.href = 'login.jsp'");
		 		script.println("</script>");
		 	}*/
		 	FavoriteDAO fdao = new FavoriteDAO();
		 	SmemberDTO smdto = new SmemberDTO();
		 	
	 		int result = fdao.delete(sid, Smember_num);
	 	
	 if(result == 1) {
%>		<script type="text/javascript">
			alert("등록해제 되었습니다.");
			window.location = '/goworker/s-member/s-member_detail.jsp?num=<%=Smember_num%>';
		</script>
<%	} else {
%>		<script type="text/javascript">
			alert("잘못된 입력이 있습니다, 확인하세요.");
			history.go(-1);
		</script>
<%	}
}	 
%> 
</body>
</html>