package edu.mum.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class RoleInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		String userMessage="Hi, ";
		if(request.isUserInRole("ROLE_ADMIN")) {
			userMessage+="Administrator";
		}
		else if(request.isUserInRole("ROLE_USER")) {
			userMessage+="User";	
		}
		else {
			userMessage+="Visitor";
		}
		request.setAttribute("userMessage", userMessage);
		return true;
		
	}

 	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
 		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//System.out.println("Calling afterCompletion");
		return;
	}

}