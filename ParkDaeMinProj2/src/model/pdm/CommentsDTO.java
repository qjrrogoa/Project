package model.pdm;

import java.sql.Date;

public class CommentsDTO {
	String commentsno;
	String id;
	String no;
	String comments;
	Date regidate;
	
	public String getCommentsno() {
		return commentsno;
	}
	public void setCommentsno(String commentsno) {
		this.commentsno = commentsno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	

}
