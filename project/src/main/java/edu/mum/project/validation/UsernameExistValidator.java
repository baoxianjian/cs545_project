package edu.mum.project.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import edu.mum.project.domain.User;
import edu.mum.project.service.UserService;


public class UsernameExistValidator implements ConstraintValidator<UsernameExist, String> {
	@Autowired
	private UserService userService;

	@Override
	public void initialize(UsernameExist arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isValid(String arg0, ConstraintValidatorContext arg1) {
		// TODO Auto-generated method stub
		User user = null;
		try {
			user=userService.getUserByUsername(arg0);
		} catch(Exception e) {}
		//user = userService.getProductById();
		return user!=null?true:false;
	}

}
