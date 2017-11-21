package edu.mum.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.project.domain.Comment;
import edu.mum.project.service.impl.CommentServiceImpl;

@Controller
public class CommentController {
	
	@Autowired
	private CommentServiceImpl commentServiceImpl;
	
	@RequestMapping(value= "/comments",method=RequestMethod.GET)
	public String addComments(Model model) {
		List<Comment> comments = commentServiceImpl.findAll();
		model.addAttribute("comments",comments);
		model.addAttribute("grating", "This is comments");
		return "comments";
	}
	
	@RequestMapping(value="/addComment",method=RequestMethod.GET)
	public String addComment(@ModelAttribute("comment") Comment comment,Model model) {
		model.addAttribute("comment", comment);
		return "comments";
	}
	
	@RequestMapping(value="/addComment",method=RequestMethod.POST)
	public String saveComment(@ModelAttribute("comment") Comment comment,BindingResult bindingResult,RedirectAttributes redirectAttributes,HttpServletRequest request,Model model) {
		if(bindingResult.hasErrors()) {
			return "comment";
		}
		
		Comment saveComment=commentServiceImpl.save(comment);
		redirectAttributes.addFlashAttribute("comment", saveComment);
		return "redirect:/commentList";
	}
	
	@RequestMapping(value="/commentList",method=RequestMethod.GET)
	public String displayComments(Model model) {
		List<Comment> comments = commentServiceImpl.findAll();
		model.addAttribute("comments", comments);
		return "commentList";
	}

}
