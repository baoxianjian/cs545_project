package edu.mum.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.mum.project.domain.Comment;
import edu.mum.project.repository.CommentRepository;
import edu.mum.project.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentRepository commentRepository;

	@Override
	public Comment save(Comment comment) {
		return commentRepository.save(comment);		
	}

	@Override
	public List<Comment> findAll() {
		return (List<Comment>)commentRepository.findAll();
	}

}
