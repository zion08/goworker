<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.NoticeDAO" %>
<%@ page import="java.io.File" %>

<jsp:useBean class="bean.NoticeDTO"  id="dto" />
<jsp:setProperty property="num" name="dto" />
<%
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	NoticeDAO dao = new NoticeDAO();
	String result = dao.deleteNotice(num);
	if(result != null){
		String path = request.getRealPath("fileSave");
		File f = new File(path+"//"+result);
		f.delete();
	}
%>
<script>
	alert("삭제 되었습니다.");
	window.location="/goworker/admin/admin_notice.jsp?pageNum=<%=pageNum%>";
</script>

