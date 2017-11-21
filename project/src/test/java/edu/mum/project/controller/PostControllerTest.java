package edu.mum.project.controller;

import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.hasProperty;
import static org.hamcrest.Matchers.is;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import edu.mum.project.service.PostService;
import edu.mum.project.service.UserService;

public class PostControllerTest {

	@Mock
	private PostService PostServiceMock;
	
	private MockMvc mockMvc;
	
    @InjectMocks
    private  PostController postController;
    
    @Before
    public void setup() {
 
        // Process mock annotations
        MockitoAnnotations.initMocks(this);
 
        // Setup Spring test in standalone mode
        this.mockMvc = MockMvcBuilders.standaloneSetup(postController).build();
 
    }
    
    @Test
    public void saveUser_Post() throws Exception {
    	try {
 			mockMvc.perform(post("/post/add")
			    .param("title", "chicken")
			    .param("content", "Welcome to XXX to eat"))
 			    .andExpect(status().isOk())
 			    .andExpect(forwardedUrl("post-form"));	    
    } catch (AssertionError e) {
		System.out.println("SaveProduct Error Message: " + e.getMessage());
		throw e;
	}}
}
