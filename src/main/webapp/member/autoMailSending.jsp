<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Properties"%>

<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.AddressException" %>
<%@page import="javax.mail.MessagingException" %>
<%@page import="java.io.UnsupportedEncodingException" %>

<%@page import = "bean.SMTPAuthenticatior" %>
<%@page import = "bean.NewPassword" %>

<%
	String email = (String)session.getAttribute("email"); // 이메일 호출
	String npv = (String)session.getAttribute("password"); // 암호 호출
%>

<%
	/* SMTP 서버에 접속하기 위한 정보들 */
	Properties prop = System.getProperties(); // Properties 클래스는 시스템의 속성을 객체로 생성하는 클래스이다. Hashtable을 상속받은 클래스로 속성과 값은 1:1로 저장이 된다.
	prop.put("mail.smtp.starttls.enable", "true");//- 로그인시 TLS를 사용할 것인지 설정
	prop.put("mail.smtp.host", "smtp.gmail.com"); //- 이메일 발송을 처리해줄 SMTP서버
	prop.put("mail.smtp.auth", "true"); //- SMTP 서버의 인증을 사용한다는 의미
	prop.put("mail.smtp.port", "587"); //- TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		
	Authenticator auth  = new SMTPAuthenticatior(); 
	Session se = Session.getDefaultInstance(prop, auth);
	//- SMTP~.java 에서 Authenticator를 상속받아 생성한 SMTP~ 클래스를 받아 세션을 생성한다.
	//- getDefaultInstance의 첫 번째 파라미터는 앞서 설정한 메일 처리 환경이다.
	MimeMessage msg = new MimeMessage(se); 
	//- MimeMessage는 Message (추상)클래스를 상속받은 인터넷 메일을 위한 클래스이다. 
	//- 위에서 생성한 세션을 담아 msg 객체를 생성한다.
	try {
		msg.setSentDate(new Date());//- 보내는 날짜 지정
		msg.setFrom(new InternetAddress("goworker123@gmail.com","운영자"));
		//- Message 클래스의 setFrom() 메소드를 사용하여 발송자를 지정한다. 발송자의 메일, 발송자명
		//- InternetAddress 클래스는 이메일 주소를 나타날 때 사용하는 클래스이다.
		InternetAddress to = new InternetAddress(email);//- 수신자의 메일을 생성한다.
		msg.setRecipient(Message.RecipientType.TO, to); 
		//- Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정한다. 
		//- setRecipient() 메소드로 수신자, 참조, 숨은 참조 설정이 가능하다.
		msg.setSubject("[goworker] 새 비밀번호 안내", "UTF-8");//- 메일의 제목 지정
		String text = "안녕하세요 새 비번은: " + npv + " 입니다. 로그인 후 비밀번호 변경 바랍니다.";
		msg.setText(text , "UTF-8" ); //- 메일의 내용 입력
		
		Transport.send(msg);//- Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분이다.
		
		} catch (AddressException ae) {
			System.out.println("AddressException : "+ ae.getMessage());
		} catch (MessagingException me) { // - 메일 계정인증 관련 예외 처리
			System.out.println("MessagingException : "+ me.getMessage());
		} catch (UnsupportedEncodingException e) { //- 지원되지 않는 인코딩을 사용할 경우 예외 처리
			System.out.println("UnsupportedEncodingException : "+ e.getMessage());
		}
%>
	
