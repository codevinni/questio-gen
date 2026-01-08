package br.tsi.questio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.tsi.questio.dao.AccountDAO;
import br.tsi.questio.model.Account;
import jakarta.servlet.http.HttpSession;

@Controller
public class AccountController {

	@RequestMapping("/login")
	public String goToLogin() {
		return "login";
	}

	@RequestMapping("/doLogin")
	public String doLogin(Account user, HttpSession session) {

		Account authenticatedUser = new AccountDAO().authenticate(user);
		
		if (authenticatedUser != null) {
			session.setAttribute("authUser", authenticatedUser);
			return "redirect:home";
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("/doLogout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
	
}
