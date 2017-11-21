package edu.mum.project.service;

import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.hasProperty;
import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import edu.mum.project.builder.UserBuilder;
import edu.mum.project.domain.User;
import edu.mum.project.repository.UserRepository;
import edu.mum.project.service.impl.UserServiceImpl;

public class UserServiceTest {
	@Mock
	private UserRepository userRepository;
	
    @InjectMocks
    private UserServiceImpl userService;
    
    private UserBuilder userBuilder;
    
    @Before
    public void setup() {
    	 MockitoAnnotations.initMocks(this);
    	 userBuilder=new UserBuilder()
    			 .withUserId(1L)
    			 .withUserName("Jiang")
    			 .withEmail("jfx@163.com")
    			 .withPassword("123");
    }
    
    @Test
    public void findOne() throws Exception {
    	User user=userBuilder.withUserName("Fang").build();
    	when(userRepository.findOne(user.getId())).thenReturn(user);
    	User productFound = userService.getUserByUserId(1L);
    	
		assertThat(productFound, allOf(
				hasProperty("id", is(user.getId())),
		 		hasProperty("username", is(user.getUsername())),
				hasProperty("password", is(user.getPassword())),
		        hasProperty("email", is(user.getEmail()))	
				));
    }
}
