package edu.mum.project.service;

import java.util.List;

import edu.mum.project.domain.Comment;


public interface CommentService {
	
	public Comment save(Comment comment);
	public List<Comment> findAll();
	
}
