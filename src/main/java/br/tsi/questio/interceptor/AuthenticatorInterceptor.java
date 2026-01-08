package br.tsi.questio.interceptor;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.servlet.HandlerInterceptor;

import br.tsi.questio.enums.UserRole;
import br.tsi.questio.model.Account;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AuthenticatorInterceptor implements HandlerInterceptor{

	private static final List<String> USER_ROUTES = Arrays.asList(
			"/quiz_setup", "/quiz_selection", "/quiz_generate", "/quiz_execute", 
			"/quiz_finish", "/quiz_detail", "/report", "/doLogout", "/home", "/error" );
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String path = request.getServletPath();
		String context = request.getContextPath();
		
		Account user = (Account)request.getSession().getAttribute("authUser");
	
		if(path.contains("/resources") || path.equals("/login") || path.equals("/doLogin") || path.equals("/error") )
			return true;
		
		if(user == null) {
			response.sendRedirect(context + "/login");
			return false;
		} 
		else {
			
			if(user.getRole().equals(UserRole.USER)) {
				
				if(USER_ROUTES.contains(path))
					return true;
				
				response.sendRedirect(context + "/error");
				return false;
				
			}
			
			if(user.getRole().equals(UserRole.ADMIN))
				return true;
			
			return false;
		}
	}

}
