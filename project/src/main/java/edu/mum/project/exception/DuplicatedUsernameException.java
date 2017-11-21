package edu.mum.project.exception;

//Either activate @ResponseStatus OR "activate method in @ControllerAdvice
//@ResponseStatus(value=HttpStatus.NOT_FOUND, reason="Username has been used")
public class DuplicatedUsernameException  extends RuntimeException {
		private static final long serialVersionUID = 3935230281455340039L;
}
