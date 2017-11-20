package edu.mum.project.controller;

import java.util.List;

import javax.validation.Valid;

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
	
	@RequestMapping(value="/comments",method=RequestMethod.GET)
	public String addComments(@ModelAttribute("comment") Comment comment,Model model) {
		model.addAttribute("comment",comment);
		return "comments";
	}
	
	@RequestMapping(value="/comments",method=RequestMethod.POST)
	public String saveComments(@Valid @ModelAttribute("comment") Comment comment,BindingResult bindingResult,RedirectAttributes redirectAttributes,Model model) {
		if(bindingResult.hasErrors()) {
			return "comments";
		}
		Comment saveComment=commentServiceImpl.save(comment);
		redirectAttributes.addFlashAttribute("comment", comment);
		return "redirect:/commentList";
	}
	
	@RequestMapping(value="/commentList",method=RequestMethod.GET)
	public String displayComments(Model model) {
		List<Comment> comments = commentServiceImpl.findAll();
		model.addAttribute("comments", comments);
		return "CommentList";
	}

}
