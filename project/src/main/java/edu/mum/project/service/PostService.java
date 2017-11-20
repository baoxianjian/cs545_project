package edu.mum.project.service;

import java.util.List;
import java.util.Map;

import edu.mum.project.domain.Post;

public interface PostService {

	public List<Post> getAll();

	public Post getById(Long id);
	
	public Map<Integer, String> getTypeList();
	
	public Post save(Post post);
	
}
