package br.tsi.questio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/home")
    public String home() {
        return "index";
    }

    @RequestMapping("/error")
    public String accessDenied() {
        return "access-error";
    }
}
