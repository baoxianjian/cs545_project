package edu.mum.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.project.service.PostService;
import edu.mum.project.domain.Post;


@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
	
	@RequestMapping(value="/post/list", method=RequestMethod.GET)
	public String getList(Model model){
		
		List<Post> posts = postService.getAll();

		model.addAttribute("posts",posts);
		return "post-list";
	}
	
	@RequestMapping(value="/post/add", method=RequestMethod.GET)
	public String form(@ModelAttribute("post") Post post, Model model){
		
		
		Map<Integer, String> types = postService.getTypeList();
		
		model.addAttribute("types",types);
		return "post-form";
	}
	
}
