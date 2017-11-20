package edu.mum.project.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.project.domain.User;
import edu.mum.project.service.impl.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@RequestMapping(value="/register")
	public String addUser(@ModelAttribute("newuser") User user) {
		return "register";
	}	
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String saveUser(@Valid @ModelAttribute("newuser") User user, BindingResult bindingResult,
			RedirectAttributes ra, HttpServletRequest request) {
		System.out.println(user.getUsername());
		if(bindingResult.hasErrors()) {
			return "register";
		}
		MultipartFile userImage=user.getUserImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		if (userImage != null && !userImage.isEmpty()) {
			try {
				userImage.transferTo(
					new File(rootDirectory+"resources\\image\\users\\"+user.getUsername()+".png"));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		User replyuser=userServiceImpl.save(user);
		ra.addFlashAttribute("user",replyuser);
		return("redirect:/welcome");
	}
	
	@RequestMapping("/welcome")
	public String otherProperties() {
		return "welcome";
	}
	
	@RequestMapping("/showuser")
	public String showUser(HttpServletRequest request,Model model) {
		User user=userServiceImpl.getUserByUsername(request.getUserPrincipal().getName());
		model.addAttribute("user",user);
		return "showuser";
	}
	
	@InitBinder
	public void initialiseBinder(WebDataBinder binder) {
	//binder.setDisallowedFields("title");
	binder.setDisallowedFields("id","enabled","posts","comments","serialVersionUID");
	/*binder.setAllowedFields("password", "verifyPassword","email","username",
				"nationality", "birthDate","gender","phone","description","UserImage");*/
	}
}
