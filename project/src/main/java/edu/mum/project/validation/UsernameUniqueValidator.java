package edu.mum.project.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import edu.mum.project.domain.User;
import edu.mum.project.service.UserService;


public class UsernameUniqueValidator implements ConstraintValidator<UsernameUnique, String> {
	@Autowired
	private UserService userService;

	@Override
	public void initialize(UsernameUnique arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isValid(String arg0, ConstraintValidatorContext arg1) {
		// TODO Auto-generated method stub
		char firstLetter = 0;
		try {
			firstLetter=arg0.charAt(0);
		} catch(Exception e) {}
		//user = userService.getProductById();
		return Character.isLetter(firstLetter);
	}

}
