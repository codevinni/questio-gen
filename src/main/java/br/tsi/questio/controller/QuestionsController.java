package br.tsi.questio.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.tsi.questio.dao.DAO;
import br.tsi.questio.model.Question;
import br.tsi.questio.model.Subject;
import jakarta.validation.Valid;

@Controller
public class QuestionsController {

	@RequestMapping("/questions")
	public String showQuestionsPage(Model model) {
		
	    model.addAttribute("subjectsList", new DAO<Subject>(Subject.class).listAll());
	    model.addAttribute("questionsList", new DAO<Question>(Question.class).listAll());
	    
		return "admin/questions";
	}
	
	@RequestMapping("/createQuestion")
	public String createQuestion(@Valid Question question, BindingResult result, Model model, RedirectAttributes redirectAttributes, 
			@RequestParam("subjectId") Long subjectId) {
	    
		if(result.hasErrors()) {
			
			List<String> errors = new ArrayList<String>();
			
			for(var error : result.getAllErrors())
				errors.add(error.getDefaultMessage());
			
	        redirectAttributes.addFlashAttribute("errorsList", errors);
	       
		}
		else {
		
		    Subject subject = new DAO<Subject>(Subject.class).searchById(subjectId);
		    question.setSubject(subject);
		    
		    new DAO<Question>(Question.class).add(question);
		}
		
	    return "redirect:questions";
	}
	
}
