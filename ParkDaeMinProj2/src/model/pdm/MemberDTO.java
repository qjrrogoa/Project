package model.pdm;

import java.sql.Date;

public class MemberDTO {
	String id;
	String password;
	String name;
	String gender;
	String inter;
	String grade;
	String intro;
	Date regidate;
	
	public MemberDTO() {
	}
	
	public MemberDTO(String id, String password, String name, String gender, String inter, String grade,
			String intro, Date regidate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.inter = inter;
		this.grade = grade;
		this.intro = intro;
		this.regidate = regidate;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getgender() {
		return gender;
	}
	public void setgender(String gender) {
		this.gender = gender;
	}
	public String getInter() {
		return inter;
	}
	public void setInter(String inter) {
		this.inter = inter;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	
	
}
