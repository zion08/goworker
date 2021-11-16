<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.NoticeDAO" %>
<%@ page import="java.io.File" %>

<jsp:useBean class="bean.NoticeDTO"  id="dto" />
<jsp:setProperty property="num" name="dto" />
<%
	String pageNum = request.getParameter("pageNum");
	NoticeDAO dao = new NoticeDAO();
	String result = dao.deleteNotice(dto.getNum());
	if(result != null){
		String path = request.getRealPath("fileSave");
		File f = new File(path+"//"+result);
		f.delete();
	}
%>
<script>
	alert("삭제 되었습니다.");
	window.location="notice.jsp?pageNum=<%=pageNum%>";
</script>

