package br.tsi.questio.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.tsi.questio.dao.DAO;
import br.tsi.questio.dao.QuestionDAO;
import br.tsi.questio.dao.SubjectDAO;
import br.tsi.questio.enums.Bimester;
import br.tsi.questio.enums.SchoolGrade;
import br.tsi.questio.model.Account;
import br.tsi.questio.model.Discipline;
import br.tsi.questio.model.Question;
import br.tsi.questio.model.Quiz;
import br.tsi.questio.model.Subject;
import jakarta.servlet.http.HttpSession;

@Controller
public class QuizController {

	
	@RequestMapping("/quiz_setup")
	public String showSetupPage(Model model) {
		
		model.addAttribute("grades", SchoolGrade.values());
	    model.addAttribute("bimesters", Bimester.values());
	    model.addAttribute("disciplinesList", new DAO<Discipline>(Discipline.class).listAll());
	    
		return "user/setup-quiz";
	}
	
	@RequestMapping("/quiz_selection")
	public String selectSubject(Model model, @RequestParam("disciplineId") Long disciplineId, @RequestParam("grade") SchoolGrade grade, @RequestParam("bimester") Bimester bimester) {
		
		List<Subject> subjectsList =  new SubjectDAO().filteredFind(disciplineId, grade, bimester);
		
		if(subjectsList != null) {
			model.addAttribute("subjectsList", subjectsList);
			return "user/subject-selection";
		}
		
		return "redirect:quiz_setup";
	}
	
	@RequestMapping("/quiz_generate")
	public String generateQuiz(@RequestParam("subjectId") Long subjectId, Model model, HttpSession session) {
		
		Subject subject = new DAO<Subject>(Subject.class).searchById(subjectId);
		
		if(subject != null) {
			
			List<Question> questionsList = new QuestionDAO().filteredFind(subject);
			
			if(questionsList.size() > 0) {
				
				Quiz quiz = new Quiz();
				
				quiz.setQuestions(questionsList);
				quiz.setResult(0.0);
				quiz.setUser((Account)session.getAttribute("authUser"));
				
				new DAO<Quiz>(Quiz.class).add(quiz);
				
				return "redirect:/quiz_execute?id=" + quiz.getId();
			}
		}
		
		return "redirect:quiz_setup";
	}
	
	@RequestMapping("/quiz_execute")
	public String showQuiz(@RequestParam("id") Long quizId, Model model) {
		
		Quiz quiz = new DAO<Quiz>(Quiz.class).searchById(quizId);
		model.addAttribute("quiz", quiz);
	    
	    return "user/quiz";
	}
	

	@RequestMapping("/quiz_finish")
	public String finishQuiz(@RequestParam("quizId") Long quizId, @RequestParam Map<String, String> allParams, Model model) {
		
		Quiz quiz = new DAO<Quiz>(Quiz.class).searchById(quizId);
		
		if(quiz == null){
	        return "redirect:quiz_setup";
	    }
		
		int correctAnswers = 0;
		
		for(Question question : quiz.getQuestions()) {
			
			String param = "answer_" + question.getId();
	        String choice = allParams.get(param);
	        
	        if(choice != null && question.getCorrectAnswer().toString().equals(choice))
	        	correctAnswers++;
		}

		double score = ((double) correctAnswers / quiz.getQuestions().size()) * 10;
		
		quiz.setResult(score);
		quiz.setFinishedAt(LocalDateTime.now());
		
		new DAO<Quiz>(Quiz.class).update(quiz);
		
		return "redirect:report";
	}
	
	@RequestMapping("/quiz_detail")
	public String showDetail(@RequestParam("id") Long id, Model model) {
		
	    Quiz quiz = new DAO<Quiz>(Quiz.class).searchById(id);
	    
	    model.addAttribute("quiz", quiz);
	    return "detailed-quiz";
	}
	
	
}
