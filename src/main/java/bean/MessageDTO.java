package bean;

import java.sql.Timestamp;

public class MessageDTO {
	private String message;
	private String idtarget;
	private String idsender;
	private Timestamp regdate;
	private int readcheck;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getIdTarget() {
		return idtarget;
	}
	public void setIdTarget(String idtarget) {
		this.idtarget = idtarget;
	}
	
	public String getIdSender() {
		return idsender;
	}
	public void setIdSender(String idsender) {
		this.idsender = idsender;
	}
	
	public Timestamp getRegDate() {
		return regdate;
	}
	public void setRegDate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public int getReadCheck() {
		return readcheck;
	}
	public void setReadCheck(int readcheck) {
		this.readcheck = readcheck;
	}
}
