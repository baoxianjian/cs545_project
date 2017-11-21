package edu.mum.project.domain;

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
import javax.validation.constraints.NotNull;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
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
	
	@JsonIgnore
	@Transient
	private MultipartFile image;
	
	private String imagePath;

	private String video;
	
	@NotNull
	private Integer type;
	
	@Transient
	private Map<Integer, String> types;
	
	@Transient
	private String typeName;

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
	
	
	public MultipartFile getImage() {
		return image;
	}


	public void setImage(MultipartFile image) {
		this.image = image;
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

	
	
}
