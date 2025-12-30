package br.tsi.questio.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.tsi.questio.dao.AccountDAO;
import br.tsi.questio.dao.DAO;
import br.tsi.questio.enums.UserRole;
import br.tsi.questio.model.Account;
import jakarta.validation.Valid;

@Controller
public class UsersController {

	@RequestMapping("/users")
	public String showUsersPage(Model model) {
		
		List<Account> list = new DAO<Account>(Account.class).listAll();
		List<Account> usersList = new ArrayList<Account>();
		
		for(Account user : list)
			if(user.getRole().equals(UserRole.USER))
				usersList.add(user);
		
		model.addAttribute("usersList", usersList);
		
		return "admin/users";
	}
	
	@RequestMapping("/createNewUser")
	public String createUser(@Valid Account user) {
		user.setRole(UserRole.USER);
		new AccountDAO().add(user);
		return "redirect:users";
	}
	
}
