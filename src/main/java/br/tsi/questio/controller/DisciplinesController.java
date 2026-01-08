package br.tsi.questio.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.tsi.questio.dao.DAO;
import br.tsi.questio.model.Discipline;
import jakarta.validation.Valid;

@Controller
public class DisciplinesController {
	
	@RequestMapping("/disciplines")
	public String showDisciplinesPage(Model model) {
		
		List<Discipline> disciplinesList = new DAO<Discipline>(Discipline.class).listAll();
		model.addAttribute("disciplinesList", disciplinesList);
		
		return "admin/disciplines";
	}
	
	@RequestMapping("/createDiscipline")
	public String createDiscipline(@Valid Discipline discipline, BindingResult result, Model model, RedirectAttributes redirectAttributes) {
		
		if(result.hasErrors()) {
			
			List<String> errors = new ArrayList<String>();
			
			for(var error : result.getAllErrors())
				errors.add(error.getDefaultMessage());
			
	        redirectAttributes.addFlashAttribute("errorsList", errors);
	       
		}
		else {
			new DAO<Discipline>(Discipline.class).add(discipline);
		}
		
		return "redirect:disciplines";
	}
}
