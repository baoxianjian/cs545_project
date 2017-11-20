package edu.mum.project.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	//如果使用*标，是否需要更改字段属性
	@Column(name="rating")
	private int rating;
	
	@Column(name="content")
	private String content;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@Column(name="post")
	private Post post;
	
	@Column(name="deleted")
	private boolean deleted;
	
	@Column(name="dateline")
	@DateTimeFormat(pattern="MM-DD-YYYYHH:mm:ss")
	private Date dateline;
	
	
	
	public long getId() {
		return id;
	}



	public void setId(long id) {
		this.id = id;
	}



	public int getRating() {
		return rating;
	}



	public void setRating(int rating) {
		this.rating = rating;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Post getPost() {
		return post;
	}



	public void setPost(Post post) {
		this.post = post;
	}



	public boolean isDeleted() {
		return deleted;
	}



	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}



	public Date getDateline() {
		return dateline;
	}



	public void setDateline(Date dateline) {
		this.dateline = dateline;
	}



	public Comment() {};
}
