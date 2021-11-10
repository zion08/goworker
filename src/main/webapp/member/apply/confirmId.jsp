<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bean.MemberDAO" %>
<title>check</title>

<jsp:useBean id="dto" class="bean.MemberDTO" />

<jsp:setProperty name="dto" property="*" />

<%
	MemberDAO dao = new MemberDAO();
	boolean result= dao.IdCheck(dto);
	String str="��밡��";
	if(result==true)
	{	
		str="���Ұ���";
	%>
	<script>
		alert("������� ���̵��Դϴ�.");
	</script>
  <%}else{%>
  	<script>
	 	alert("��� �����մϴ�."); 
	 </script>
  <%}
	%>

<script>
	function returnClose(){
		opener.document.getElementById("idCheck").innerHTML='<font color=red><%=str%></font>';
		self.close();
	}
</script>
	<input type="button" value="�ݱ�" onclick="returnClose();"/>
	