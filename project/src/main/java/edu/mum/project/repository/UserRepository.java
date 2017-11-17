package edu.mum.project.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.project.domain.User;

@Repository
public interface UserRepository extends CrudRepository<User,Long> {
	
}
