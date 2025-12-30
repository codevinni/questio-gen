package br.tsi.questio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.tsi.questio.dao.DAO;
import br.tsi.questio.model.Question;
import br.tsi.questio.model.Subject;

@Controller
public class QuestionsController {

	@RequestMapping("/questions")
	public String showQuestionsPage(Model model) {
		
	    model.addAttribute("subjectsList", new DAO<Subject>(Subject.class).listAll());
	    model.addAttribute("questionsList", new DAO<Question>(Question.class).listAll());
	    
		return "admin/questions";
	}
	
	@RequestMapping("/createQuestion")
	public String createQuestion(Question question, @RequestParam("subjectId") Long subjectId) {
	    
	    Subject subject = new DAO<Subject>(Subject.class).searchById(subjectId);
	    question.setSubject(subject);
	    
	    new DAO<Question>(Question.class).add(question);
	    
	    return "redirect:questions";
	}
	
}
