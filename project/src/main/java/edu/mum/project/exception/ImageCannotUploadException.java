package edu.mum.project.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Image can not upload exception.")
public class ImageCannotUploadException extends Exception {
	
	private static final long serialVersionUID = 101343123L;
	
	private String message;
	
	public ImageCannotUploadException(String message)
	{
		this.message = message;
	}
	
}
