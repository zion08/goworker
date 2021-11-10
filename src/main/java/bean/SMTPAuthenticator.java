package bean;
	import javax.mail.PasswordAuthentication;

	public class SMTPAuthenticator extends javax.mail.Authenticator {
	    public PasswordAuthentication getPasswordAuthentication() {
	        // 네이버나 Gmail 사용자 계정 설정.
	        // Gmail의 경우 @gmail.com을 제외한 아이디만 입력한다.
	        return new PasswordAuthentication("damhee6624@gmail.com", "Fkdlswl13^");
	    }
	    public PasswordAuthentication getPasswordAuthentication(String email, String newPassword) {
	    	// 임시로 만듬. 
	    	// email = "gowork.team01@gmail.com";
	    	// newPassword = "team1234";
	    	return new PasswordAuthentication(email , newPassword);
	    }
	}
