package edu.mum.project.validation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ ElementType.METHOD, ElementType.FIELD, ElementType.ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UsernameExistValidator.class)
public @interface UsernameExist {

	String message() default "user name does not exist";

	Class<?>[] groups() default {};

	public abstract Class<? extends Payload>[] payload() default {};

}