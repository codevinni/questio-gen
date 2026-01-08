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
import br.tsi.questio.enums.Bimester;
import br.tsi.questio.enums.SchoolGrade;
import br.tsi.questio.model.Discipline;
import br.tsi.questio.model.Subject;
import jakarta.validation.Valid;

@Controller
public class SubjectsController {

	@RequestMapping("/subjects")
	private String showSubjectsPage(Model model) {
		
		model.addAttribute("grades", SchoolGrade.values());
	    model.addAttribute("bimesters", Bimester.values());
	    model.addAttribute("disciplinesList", new DAO<Discipline>(Discipline.class).listAll());
	    model.addAttribute("subjectsList", new DAO<Subject>(Subject.class).listAll());
	    
	    return "admin/subjects";
	}
	
	@RequestMapping("/createSubject")
	public String createSubject(@Valid Subject subject, BindingResult result, 
			Model model, RedirectAttributes redirectAttributes, @RequestParam("disciplineId") Long disciplineId) {
		
		if(result.hasErrors()) {
			
			List<String> errors = new ArrayList<String>();
			
			for(var error : result.getAllErrors())
				errors.add(error.getDefaultMessage());
			
	        redirectAttributes.addFlashAttribute("errorsList", errors);
	       
		}
		else {
			Discipline discipline = new DAO<Discipline>(Discipline.class).searchById(disciplineId); 
			subject.setDiscipline(discipline);
			
			new DAO<Subject>(Subject.class).add(subject);
		}
		
		return "redirect:subjects";
	}
	
}
