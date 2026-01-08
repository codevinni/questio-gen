package br.tsi.questio.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String createUser(@Valid Account user, BindingResult result, Model model, RedirectAttributes redirectAttributes) {
		
		if(result.hasErrors()) {
			
			List<String> errors = new ArrayList<String>();
			
			for(var error : result.getAllErrors())
				errors.add(error.getDefaultMessage());
			
	        redirectAttributes.addFlashAttribute("errorsList", errors);
	       
		}
		else {
			user.setRole(UserRole.USER);
			new AccountDAO().add(user);
		}
		
		return "redirect:users";
	}
	
}
