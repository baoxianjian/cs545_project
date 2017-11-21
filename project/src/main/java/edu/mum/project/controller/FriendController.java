package edu.mum.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.mum.project.domain.Friend;
import edu.mum.project.domain.User;
import edu.mum.project.service.UserService;

@RequestMapping("/friend")
@Controller
public class FriendController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/addfriend")
	public String chooseFriend() {
		return "addfriend";
	}
	
	@CrossOrigin(origins = { "*" },maxAge = 6000)
	@RequestMapping(value="/addfriend",method=RequestMethod.POST)
	public @ResponseBody Friend addFriend(@Valid @RequestBody Friend friend,
				HttpServletRequest request) {
		System.out.println(friend.getUsername());
		User user=userService.getUserByUsername(request.getUserPrincipal().getName());
		user.getFriends().add(friend);
		return friend;
	}
}
