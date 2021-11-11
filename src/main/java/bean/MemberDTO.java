package bean;

import java.sql.Timestamp;

public class MemberDTO {
	private String id;
	private String email;
	private String password;
	private Timestamp reg;
	private int warn;
	
	
	public void setId(String id) {this.id=id;}
	public String getId() {return id;}
	
	public void setEmail(String email) {this.email=email;}
	public String getEmail() {return email;}
	
	public void setPassword(String password) {this.password=password;}
	public String getPassword() {return password;}
	
	public void setReg(Timestamp reg) {this.reg=reg;}
	public Timestamp getReg() {return reg;}
  
  public void setWarn(int warn) {this.warn=warn;}
  public int getWarn() {return warn;}

	
}
