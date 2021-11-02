package sproject.comment.bean;

import java.sql.Timestamp;

public class Comment_SprojectDTO {

	
	private int comment_num;
	private int board_num;
	private String comment_writerid;
	private String comment_content;
	private Timestamp comment_regdate;
	private int comment_ref;
	private int comment_step;
	private int comment_level;
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getComment_writerid() {
		return comment_writerid;
	}
	public void setComment_writerid(String comment_writerid) {
		this.comment_writerid = comment_writerid;
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
	public int getComment_ref() {
		return comment_ref;
	}
	public void setComment_ref(int comment_ref) {
		this.comment_ref = comment_ref;
	}
	public int getComment_step() {
		return comment_step;
	}
	public void setComment_step(int comment_step) {
		this.comment_step = comment_step;
	}
	public int getComment_level() {
		return comment_level;
	}
	public void setComment_level(int comment_level) {
		this.comment_level = comment_level;
	}
}
