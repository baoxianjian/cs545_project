package edu.mum.project.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Post {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	private String title;
	
	private String content;
	
	private String image;
	
	private String video;
	
	private Integer type;
	
	private String showTime;
	
	private Integer memberLimit;
	
	private String location;
	
	@ManyToOne
	private User joinedUsers;
	
	@OneToMany(cascade = CascadeType.ALL)
	private List<Comment> comments;
	
	private Boolean deleted;
	
	private Integer dateline;
	
	
	public Post() {}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getVideo() {
		return video;
	}


	public void setVideo(String video) {
		this.video = video;
	}


	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}


	public String getShowTime() {
		return showTime;
	}


	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}


	public Integer getMemberLimit() {
		return memberLimit;
	}


	public void setMemberLimit(Integer memberLimit) {
		this.memberLimit = memberLimit;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public User getJoinedUsers() {
		return joinedUsers;
	}


	public void setJoinedUsers(User joinedUsers) {
		this.joinedUsers = joinedUsers;
	}


	public List<Comment> getComments() {
		return comments;
	}


	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}


	public Boolean getDeleted() {
		return deleted;
	}


	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}


	public Integer getDateline() {
		return dateline;
	}


	public void setDateline(Integer dateline) {
		this.dateline = dateline;
	};
	
	
	
}
