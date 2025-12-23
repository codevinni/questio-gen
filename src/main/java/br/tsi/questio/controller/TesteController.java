package br.tsi.questio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TesteController {

	public TesteController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping("/teste")
	public String teste() {
		return "index";
	}
	
}
