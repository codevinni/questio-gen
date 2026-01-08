package br.tsi.questio.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.tsi.questio.dao.QuizDAO;
import br.tsi.questio.enums.UserRole;
import br.tsi.questio.model.Account;
import br.tsi.questio.model.Quiz;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReportController {

	@RequestMapping("/report")
	public String showReport(Model model, HttpSession session) {
		
		Account account = (Account)session.getAttribute("authUser");
		
		List<Quiz> quizes;
		
		if(account.getRole().equals(UserRole.USER))
			quizes = new QuizDAO().filteredFind(account);
		else
			quizes = new QuizDAO().listAll();
		
		model.addAttribute("quizes", quizes);
		return "report";
	}
}
