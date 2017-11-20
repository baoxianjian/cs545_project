package edu.mum.project.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.project.domain.Comment;

@Repository
public interface CommentRepository extends CrudRepository<Comment,Long>{
	
}
