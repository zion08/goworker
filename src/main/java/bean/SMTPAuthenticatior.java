package bean;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
public class SMTPAuthenticatior extends Authenticator{
    
    PasswordAuthentication pa;
    
    public SMTPAuthenticatior() {
        String mail_id = "goworker123@gmail.com";
        String mail_pw = "goworker123123";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
