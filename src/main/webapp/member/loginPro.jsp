<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bean.DAO" %>

<title>�α���Ȯ��</title>

<jsp:useBean id="dto" class="bean.DTO"/>
<jsp:setProperty property="*" name="dto" />

<%
	String chkbox=request.getParameter("logining"); // �������� üũ�ڽ��κ��� ���� ���� ���� ����.
	
	DAO dao = new DAO();
	boolean result = dao.loginCheck(dto); // �α��� Ȯ�� ��ü ����.
	if(result==true) // �α��� �Ǿ��� ��.
	{	
		if(chkbox==null)
		{
			session.setAttribute("email", dto.getEmail()); // ���� �̸�=�� ����
			session.setMaxInactiveInterval(60*60*3); // ���� �����ð� 3�ð�
			response.sendRedirect("main.jsp");
		}
		else if(chkbox.equals("yes")) // �α��� ���� ���� üũ�Ǿ� ������ ����. (�����)
		{
			
			response.addCookie(Cookies.createCookie("AUTH", dto.getEmail(), "/", 60*60*24*30)); // �̸��� AUTH�̰� ���� �Է��� �̸����� ��Ű�� ����.->�α��ο����Ǵܽ� ���
			response.sendRedirect("main.jsp");
		}
	}else
  	{%>
		<script>
			alert("���̵�/��й�ȣ �ٽ� �Է����ּ���.");
			history.go(-1);
		</script>  
  <%}%>
  