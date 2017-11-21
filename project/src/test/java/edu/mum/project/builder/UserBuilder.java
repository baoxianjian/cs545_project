package edu.mum.project.builder;

import edu.mum.project.domain.User;

public class UserBuilder {
	private User user;
	  
	public UserBuilder() {
		this.user = new User();
	}
	
    public UserBuilder withUserId(Long name) {
        this.user.setId(name);
        return this;
    }
	
    public UserBuilder withUserName(String name) {
        this.user.setUsername(name);
        return this;
    }
    
    public UserBuilder withEmail(String name) {
        this.user.setEmail(name);
        return this;
    }
    
    public UserBuilder withPassword(String name) {
        this.user.setPassword(name);
        return this;
    }

      public User build() {
        return user;
    }
}
