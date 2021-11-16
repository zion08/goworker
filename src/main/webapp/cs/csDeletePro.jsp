<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.CsDAO" %>
<%@ page import="java.io.File" %>

<jsp:useBean class="bean.CsDTO"  id="dto" />
<jsp:setProperty property="num" name="dto" />
<%
	String pageNum = request.getParameter("pageNum");
	CsDAO dao = new CsDAO();
	String result = dao.deleteCs(dto.getNum());
	if(result != null){
		String path = request.getRealPath("fileSave");
		File f = new File(path+"//"+result);
		f.delete();
	}
%>
<script>
	alert("삭제 되었습니다.");
	window.location="cs.jsp?pageNum=<%=pageNum%>";
</script>

