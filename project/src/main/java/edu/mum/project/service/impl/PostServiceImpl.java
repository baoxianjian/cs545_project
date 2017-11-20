package edu.mum.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import edu.mum.project.domain.Post;
import edu.mum.project.repository.PostRepository;
import edu.mum.project.service.PostService;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostRepository postRepository;
	
	@Override
	public List<Post> getAll() {

		return (List<Post>)postRepository.findAll();
	}

	@Override
	public Post getById(Long id) {
		
		return postRepository.findOne(id);
	}

	@Override
	public Map<Integer, String> getTypeList() {
		Map<Integer, String> types = new HashMap<Integer, String>();
		types.put(1, "Online Sharing");
		types.put(3, "FaceToFace Sharing");
		return types;
	}

	@Override
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
	public Post save(Post post) {
		postRepository.save(post);
		return null;
	}

}
