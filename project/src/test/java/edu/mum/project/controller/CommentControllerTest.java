package edu.mum.project.controller;

import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.hasProperty;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoMoreInteractions;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import edu.mum.project.builder.CommentBuilder;
import edu.mum.project.builder.CommentListBuilder;
import edu.mum.project.service.CommentService;
import edu.mum.project.service.PostService;
import edu.mum.project.service.UserService;

public class CommentControllerTest {

	@Mock
	private CommentService CommentServiceMock;
	
	private MockMvc mockMvc;
	
    @InjectMocks
    private  CommentController commentController;
    
    @Before
    public void setup() {
 
        // Process mock annotations
        MockitoAnnotations.initMocks(this);
 
        // Setup Spring test in standalone mode
        this.mockMvc = MockMvcBuilders.standaloneSetup(commentController).build();
 
    }
    
    @Test
    public void displayComments_getAll() throws Exception {
    	CommentListBuilder listComments=new CommentListBuilder();
    	CommentServiceMock.save(new CommentBuilder()
    			.withUserId(1L)
    			.withContent("fish").build());
    	CommentServiceMock.save(new CommentBuilder()
    			.withUserId(2L)
    			.withContent("egg").build());
    	when(CommentServiceMock.findAll()).thenReturn(listComments.build());
    	try {
 			mockMvc.perform(get("/comment/commentList1"))
 				.andExpect(status().isOk())
 				.andExpect(view().name("commentList"))
 			    .andExpect(forwardedUrl("commentList"))
 			    .andExpect(model().attribute("comments", hasSize(2)))
 			   .andExpect(model().attribute("comments", hasItem(
                       allOf(
                               hasProperty("id", is(1L)),
                       		hasProperty("content", is("fish"))
                       )
               )))
               .andExpect(model().attribute("comments", hasItem(
                       allOf(
                               hasProperty("id", is(2L)),
                       		hasProperty("content", is("egg"))
                       )
               )));	    
    } catch (AssertionError e) {
		System.out.println("SaveProduct Error Message: " + e.getMessage());
		throw e;
	}}
}
