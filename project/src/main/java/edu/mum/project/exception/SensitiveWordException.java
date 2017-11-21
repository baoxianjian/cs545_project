package edu.mum.project.exception;

import java.util.Arrays;
import java.util.List;

public class SensitiveWordException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String message="You can't use Sensitive Word as username:";
	private String username=null;
	//private List<String> SensitiveWords=Arrays.asList("fuck","Obama");
	
	public SensitiveWordException() {}
	
	public SensitiveWordException(String username, String message) {
		this.username=username;
		if(message!=null) this.message=message;
	}

	public String getMessage() {
		return message+username;
	}

	public String getUsername() {
		return username;
	}
}
