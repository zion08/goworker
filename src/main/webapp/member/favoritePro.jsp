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
		 	if (request.getParameter("smember_num") != null){
		 		Smember_num = Integer.parseInt(request.getParameter("smember_num"));
		 	}
		 	if (Smember_num == 0){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('유효하지 않은 글입니다.')");
		 		script.println("location.href = 'login.jsp'");
		 		script.println("</script>");
		 	}
		 	FavoriteDAO fdao = new FavoriteDAO();
		 	SmemberDTO smdto = new SmemberDTO();
			ArrayList<FavoriteDTO> list = fdao.getfavorite(sid, smdto.getNum());
			int result = 0;
			if (list.isEmpty()){
				result = fdao.write(sid, smdto.getNum());
			}
			else{
				result = fdao.delete(sid, smdto.getNum());
			}
	 		if (result == -1){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('평가를 실패했습니다.')");
		 		script.println("history.back()");
		 		script.println("</script>");
		 	}
	 		
	 		else{
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("location.href=document.referrer;");
		 		script.println("</script>");
		 	}
	 	}
	 %>
</body>
</html>