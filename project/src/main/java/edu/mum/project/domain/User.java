package edu.mum.project.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	@NotBlank
	@Size(min=4,max=50)
	private String userName;
	
	@NotEmpty
	private String password;
	
	@Email
	@NotEmpty
	private String email;
	
	@NotEmpty
	private String nationlity;
	
	@Past
	@DateTimeFormat(pattern="MM-dd-yyyy")
	private Date borthDate;
	
	@NotNull
	private String gender;
	
	private String role;
	
	@NotBlank
	private String phone;
	
	private String description;
	
	private String dateline;
	
	@OneToMany(cascade = CascadeType.ALL)
	private List<Post> posts;
	
	@OneToMany(cascade = CascadeType.ALL)
	private List<Comment> comments;
	
	public User() {};
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNationlity() {
		return nationlity;
	}
	public void setNationlity(String nationlity) {
		this.nationlity = nationlity;
	}
	public Date getBorthDate() {
		return borthDate;
	}
	public void setBorthDate(Date borthDate) {
		this.borthDate = borthDate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDateline() {
		return dateline;
	}
	public void setDateline(String dateline) {
		this.dateline = dateline;
	}
	public List<Post> getPosts() {
		return posts;
	}
	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
}
