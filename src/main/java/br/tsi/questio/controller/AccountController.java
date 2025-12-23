package br.tsi.questio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.tsi.questio.dao.AccountDAO;
import br.tsi.questio.model.Account;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AccountController {

	@RequestMapping("/login")
	public String goToLogin() {
		return "login";
	}

	@RequestMapping("/doLogin")
	public String doLogin(Account user, HttpSession session) {

		if (new AccountDAO().authenticate(user) != null) {
			session.setAttribute("authUser", user);
			return "redirect:teste";
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("/doLogout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
	
	@RequestMapping("createNewUser")
	public String create(@Valid Account user) {
		new AccountDAO().add(user);
		return "redirect:login";
	}
	
}
