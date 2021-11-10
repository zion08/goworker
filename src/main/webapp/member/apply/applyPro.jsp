<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bean.MemberDAO" %>
<title>ȸ������Ȯ��â</title>

<jsp:useBean id="dto" class="bean.MemberDTO" />
<jsp:setProperty name="dto" property="*" />

<%
	MemberDAO dao = new MemberDAO();
	int result = dao.memberInput(dto);
%>

<%
	if(result==1){ %>
		<script>
			alert("ȸ������ ����");
			window.location="/member/login/login.jsp";
		</script>
<%	}else{ %>
		<script>
			alert("�߸��Է�");
			history.go(-1);
		</script>
<%	} %>
