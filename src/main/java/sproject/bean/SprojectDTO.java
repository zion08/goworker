package sproject.bean;

import java.sql.Timestamp;

public class SprojectDTO {
	private int num;
	private String id;
	private String lang;
	private String field;
	private String email;
	private String phone;
	private String kakao;
	private int favor;
	private int good;
	private int readcount;
	private Timestamp regdate;
	private String career;
	private String worktype;
	private String projecttype;
	private String employtype;
	private String period;
	private int pay;
	private String endProject;
	private String sent;
	private int pageNum;
	private String projectName;
	private String location;
	private String projectimg;
	private String projectdetail;
	private String introduce;
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	private int available;
	
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getProjectimg() {
		return projectimg;
	}
	public void setProjectimg(String projectimg) {
		this.projectimg = projectimg;
	}
	public String getProjectdetail() {
		return projectdetail;
	}
	public void setProjectdetail(String projectdetail) {
		this.projectdetail = projectdetail;
	}
	public int getAvailable() {
		return available;
	}
	public void setAvailable(int available) {
		this.available = available;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getKakao() {
		return kakao;
	}
	public void setKakao(String kakao) {
		this.kakao = kakao;
	}
	public int getFavor() {
		return favor;
	}
	public void setFavor(int favor) {
		this.favor = favor;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getWorktype() {
		return worktype;
	}
	public void setWorktype(String worktype) {
		this.worktype = worktype;
	}
	public String getProjecttype() {
		return projecttype;
	}
	public void setProjecttype(String projecttype) {
		this.projecttype = projecttype;
	}
	public String getEmploytype() {
		return employtype;
	}
	public void setEmploytype(String employtype) {
		this.employtype = employtype;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getEndProject() {
		return endProject;
	}
	public void setEndProject(String endProject) {
		this.endProject = endProject;
	}
	public String getSent() {
		return sent;
	}
	public void setSent(String sent) {
		this.sent = sent;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public void setProjectName(String projectName){
    	this.projectName=projectName;
    }
	public String getProjectName () {
        return projectName;
    }
	public void setLocation(String location){
    	this.location=location;
    }
	public String getLocation () {
        return location;
    }	
}