package br.tsi.questio.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String createDiscipline(@Valid Discipline discipline) {
		new DAO<Discipline>(Discipline.class).add(discipline);
		return "redirect:disciplines";
	}
}
