package edu.mum.project.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.project.domain.Post;

@Repository
public interface PostRepository extends CrudRepository<Post,Long> {

	
}
