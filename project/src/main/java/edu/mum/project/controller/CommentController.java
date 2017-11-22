package edu.mum.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.project.domain.Comment;
import edu.mum.project.domain.Post;
import edu.mum.project.domain.User;
import edu.mum.project.service.CommentService;
import edu.mum.project.service.PostService;
import edu.mum.project.service.UserService;


@RequestMapping(value="comment")
@Controller
public class CommentController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private PostService postService;
	
	@RequestMapping(value= {"","/"},method=RequestMethod.GET)
	public @ResponseBody List<Comment> commentList(Model model) {
		List<Comment> comments = commentService.findAll();
//		model.addAttribute("comments",comments);
//		model.addAttribute("grating", "This is comments");
		return comments;
	}

	
	@CrossOrigin(origins = { "*" },maxAge = 6000)
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public @ResponseBody Comment saveComment(@Valid @RequestBody Comment comment,@RequestParam("postid") Long postid,BindingResult bindingResult,HttpServletRequest request,Model model) {
//		if(bindingResult.hasErrors()) {
//			//return "comment";
//		}
//		W
//		Comment saveComment=commentServiceImpl.save(comment);
//		redirectAttributes.addFlashAttribute("comment", saveComment);
//		return "redirect:/commentList";
		//User user=userService.getUserByUsername(request.getUserPrincipal().getName());
		
		System.out.println(comment.getId());
		//comment.setId(0);
		Post post = postService.getById(postid);
		comment.setPost(post);
		
		User user=userService.getUserByUsername(request.getUserPrincipal().getName());
		comment.setUser(user);
		
		Comment saveComment = commentService.save(comment);
		
		System.out.println(saveComment.getId());
		
		List<Comment> comments = post.getComments();
		comments.add(saveComment);
		post.setComments(comments);
		postService.save(post);
		
		

//		List<Comment> myComments = user.getComments();
//		myComments.add(saveComment);
//		user.setComments(myComments);
		//userService.save(user);

		
		
		
		
		saveComment.setPost(null);
		saveComment.setUser(null);
		
		return saveComment;
	}
	
	@RequestMapping(value="/commentList1",method=RequestMethod.GET)
	public String displayComments(Model model) {
		List<Comment> comments = commentService.findAll();
		model.addAttribute("comments", comments);
		return "commentList";
	}

}
