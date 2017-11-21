package edu.mum.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.mum.project.domain.User;
import edu.mum.project.repository.UserRepository;
import edu.mum.project.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	
 	@Autowired
 	BCryptPasswordEncoder passwordEncoder;
	
	public List<User> getAll(){
		return (List<User>) userRepository.findAll();
	}
	
	public User save(User user) {
		String encodedPassword =
				passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		return userRepository.save(user);
	}
	
	public User getById(Long UserId) {
		return userRepository.findOne(UserId);
	}

	@Override
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return userRepository.findByUsername(username);
	}

	@Override
	public User getUserByUserId(Long id) {
		// TODO Auto-generated method stub
		return userRepository.findOne(id);
	}

	@Override
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void delete(User user) {
		// TODO Auto-generated method stub
		userRepository.delete(user);
	}
}
