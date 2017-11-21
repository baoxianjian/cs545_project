package edu.mum.project.domain;

import org.hibernate.validator.constraints.NotEmpty;

import edu.mum.project.validation.UsernameExist;

public class Friend {
	@NotEmpty
	@UsernameExist
	private String username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
