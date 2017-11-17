package edu.mum.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.mum.project.domain.User;
import edu.mum.project.repository.UserRepository;
import edu.mum.project.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	
	public List<User> getAll(){
		return (List<User>) userRepository.findAll();
	}
	
	public User save(User user) {
		return userRepository.save(user);
	}
}
