package edu.mum.project.builder;

import java.util.Arrays;
import java.util.List;

import edu.mum.project.domain.Comment;

public class CommentListBuilder {
	public CommentBuilder commentBuilderOne = new CommentBuilder()
			.withUserId(1L)
			.withContent("fish");
	
	public CommentBuilder commentBuilderTwo = new CommentBuilder()
			.withUserId(2L)
			.withContent("egg");
	
	public List<Comment> build() {
		Comment first=commentBuilderOne.build();
		Comment second=commentBuilderTwo.build();
		return (List<Comment>) Arrays.asList(first, second);
	}
}
