package edu.mum.project.repository;

import org.springframework.data.repository.CrudRepository;

import edu.mum.project.domain.User;


public interface UserRepository extends CrudRepository<User,Long> {
	
}
