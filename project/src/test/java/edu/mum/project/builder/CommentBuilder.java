package edu.mum.project.builder;

import edu.mum.project.domain.Comment;

public class CommentBuilder {
	private Comment comment;
	  
	public CommentBuilder() {
		this.comment = new Comment();
	}
	
    public CommentBuilder withUserId(Long name) {
        this.comment.setId(name);
        return this;
    }
    
    public CommentBuilder withContent(String name) {
        this.comment.setContent(name);
        return this;
    }

      public Comment build() {
        return comment;
    }
}
