package bean;

import java.sql.Timestamp;

public class BoardDTO {
	private int num;
	private String writer;
	private	String subject;
	private String content;
	private String category;
	private String filename;
	private Timestamp reg;
	private	int readcount;
	private int good;
	private int rownum;
	private int num_prev;
	private int num_next;
	
	public int getNum_prev() {
		return num_prev;
	}
	public void setNum_prev(int num_prev) {
		this.num_prev = num_prev;
	}
	public int getNum_next() {
		return num_next;
	}
	public void setNum_next(int num_next) {
		this.num_next = num_next;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename=filename;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category=category;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
		public String getWriter() {
			return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public void setRowNum(int rownum) {
		this.rownum=rownum;
	}
	public int getRowNum() {
		return rownum;
	}
}
