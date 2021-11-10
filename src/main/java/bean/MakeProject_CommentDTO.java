package bean;

import java.sql.Timestamp;

public class MakeProject_CommentDTO {
	private int num;
	private int comment_num;
	private String id;
	private String comment_content;
	private Timestamp comment_regdate;
	private int comment_good;
	private int ref;
	private int re_step;
	private int re_level;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Timestamp getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(Timestamp comment_regdate) {
		this.comment_regdate = comment_regdate;
	}
	public int getComment_good() {
		return comment_good;
	}
	public void setComment_good(int comment_good) {
		this.comment_good = comment_good;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	
	
	
}
