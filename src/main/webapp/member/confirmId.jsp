<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bean.DAO" %>
<title>check</title>

<jsp:useBean id="dto" class="bean.DTO" />
<jsp:setProperty name="dto" property="*" />

<%
	DAO dao = new DAO();
	boolean result= dao.idCheck(dto);
	String str="사용가능";
	if(result==true)
	{	
		str="사용불가능";
	%>
	<script>
		alert("사용중인 아이디입니다.");
	</script>
  <%}else{%>
  	<script>
	 	alert("사용 가능합니다."); 
	 </script>
  <%}
	%>

<script>
	function returnClose(){
		opener.document.getElementById("idCheck").innerHTML='<font color=red><%=str%></font>';
		self.close();
	}
</script>
	<input type="button" value="닫기" onclick="returnClose();"/>
	