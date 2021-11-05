<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="bean.SMTPAuthenticatior"%>

<%@page import="java.util.Properties"%>
<%@page import="javax.mail.*" %>


<%@page import="org.apache.commons.mail.EmailAttachment"%>
<%@page import="org.apache.commons.mail.MultiPartEmail"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.*"%>
<%@page import="javax.activation.*"%>

<%
	request.setCharacterEncoding("utf-8");
 
	
	String project = request.getParameter("project");
	String name = request.getParameter("name");
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	String number = request.getParameter("number");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
 	
	Properties p = new Properties(); // 정보를 담을 객체
 
	p.put("mail.smtp.host","smtp.gmail.com"); // gmaill SMTP
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");

 
try{
    Authenticator auth = new SMTPAuthenticatior();
    Session ses = Session.getInstance(p, auth);
     
    ses.setDebug(true);
    
	// 수신하는 메일에 보여지는 출력 값
    StringBuffer buffer = new StringBuffer();
    	buffer.append("<h3>프로젝트 명 :<h3>");
    	buffer.append(project+""+"<br/><br/>");
    	buffer.append("<h3>보내는 사람 이름 :</h3>");
   	 	buffer.append(name+"<br/><br/>");    
    	buffer.append("<h3>연락처 :</h3>");
    	buffer.append(number+"<br/><br/>");   
    	buffer.append("<h3>제 목 :</h3>");
    	buffer.append(subject+"<br/><br/>");
    	buffer.append("<h3>내 용 :</h3>");
    	buffer.append(content+"<br/><br/>");
    
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체  
	msg.setSubject(subject); //  제목 

    
	Address fromAddr = new InternetAddress(from);
	msg.setFrom(fromAddr);	// 보내는 사람

	Address toAddr = new InternetAddress(to);
	msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람 
	
	msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용(인코딩)
	Transport.send(msg); // 전송   

	
} catch(Exception e){
    e.printStackTrace();
    out.println("<메일 발송을 실패 했습니다. 정보를 다시 확인해주세요.");
    return;
}
	out.println("<br/><br/><center><h3>메일 발송이 성공적으로 완료되었습니다!!</h3> <br/><br/> 빠른 시일내에 답변드리도록 하겠습니다. <br/><br/> 문의 남겨주셔서 감사합니다.</center>");// 성공 시

%>

