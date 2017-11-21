package edu.mum.project.domain;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class Post {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	@NotBlank
	private String title;
	
	@NotBlank
	private String content;
	

	@Transient
	private MultipartFile imageTemp;
	
	private String imagePath;

	private String video;
	
	@NotNull
	private Integer type;
	
	@Transient
	private Map<Integer, String> types;
	
	@Transient
	private String typeName;

	@Future
	@DateTimeFormat(pattern="MM-dd-yyyy")
	private Date showTime;
	
	private Integer memberLimit;
	
	private String location;
	
	@OneToMany
	private List<User> joinedUsers;
	
	@ManyToOne
	private User user;

	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
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


	public Date getShowTime() {
		return showTime;
	}


	public void setShowTime(Date showTime) {
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


	public List<User> getJoinedUsers() {
		return joinedUsers;
	}


	public void setJoinedUsers(List<User> joinedUsers) {
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
	
	
	public MultipartFile getImageTemp() {
		return imageTemp;
	}


	public void setImageTemp(MultipartFile image) {
		this.imageTemp = image;
	}
	
	public String getImagePath() {
		return imagePath;
	}


	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
	public Map<Integer, String> getTypeList() {
		if(types == null)
		{
			types = new HashMap<Integer, String>();
			types.put(1, "Online Sharing");
			types.put(3, "FaceToFace Sharing");
		}
		return types;
	}

	
	public String getTypeName() {
		
		return getTypeList().get(this.type);
	}


	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	
	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}

	
}
