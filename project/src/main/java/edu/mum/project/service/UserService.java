package edu.mum.project.service;

import java.util.List;

import edu.mum.project.domain.User;

public interface UserService {
	public List<User> getAll();
	
	public User save(User user);
	
	public User getUserByUsername(String username);
	
	public User getUserByUserId(Long id);
	
	public void delete(User user);
}
