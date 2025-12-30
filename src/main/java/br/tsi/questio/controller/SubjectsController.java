package br.tsi.questio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String createSubject(@Valid Subject subject, @RequestParam("disciplineId") Long disciplineId) {
		
		Discipline discipline = new DAO<Discipline>(Discipline.class).searchById(disciplineId); 
		subject.setDiscipline(discipline);
		
		new DAO<Subject>(Subject.class).add(subject);
		
		return "redirect:subjects";
	}
	
}
