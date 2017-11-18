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
	private List<User> joinedUsers;
	
	@OneToMany(cascade = CascadeType.ALL)
	private List<Comment> comments;
	
	private Boolean deleted;
	
	private Integer dateline;
	

	
	
	
	public Post() {};
}
