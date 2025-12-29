package br.tsi.questio.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AuthenticatorInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		final String URI = request.getRequestURI();
		boolean isAuthenticated = request.getSession().getAttribute("authUser") != null;
		
		if(isAuthenticated || URI.endsWith("login") || URI.endsWith("doLogin") || URI.contains("resources"))
			return true;
		
		response.sendRedirect("login");
		return false;
	}

}
