package edu.mum.project.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.mum.project.domain.User;
import edu.mum.project.service.UserService;

@Controller
public class HomeController {
	@Autowired
	private UserService userService;
 
	@RequestMapping({"/","/welcome"})
	public String welcome(Model model) {
		
		model.addAttribute("greeting", "Welcome to Cuisine-share!!");
		model.addAttribute("tagline", "Share cuisine from all over the world!");
		
		/*User user=new User();
		user.setUserName("Fangxiao");
		user.setPassword("123456");
		user.setEmail("_jfx@163.com");
		user.setNationality("China");
		user.setGender("Male");
		user.setRole("Role_Admin");
		//user.setPhone("15975421089");
		
		
		userServiceImpl.save(user);
		List<User> user1=userServiceImpl.getAll();
		System.out.println(user1.get(0).getUserName());*/
		
		return "welcome";
	}
}
