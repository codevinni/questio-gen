<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Quiz - Questio Gen</title>
	</head>
	
	<body>
	
		<c:import url="/WEB-INF/views/fragments/navbar.jsp" />
		
		Teste
		
		<form action="quiz_finish" method="post">
		
			<input type="hidden" name="quizId" value="${quiz.id}">
		
			<c:forEach var="question" items="${quiz.questions}">
				
				<h3>${question.statement}</h3>
				
				<label>
		            <input type="radio" name="answer_${question.id}" value="A" required> 
		            A) ${question.optionA}
	        	</label><br>
	        
	        	<label>
		            <input type="radio" name="answer_${question.id}" value="B"> 
		            B) ${question.optionB}
	        	</label><br>
	        
		        <label>
		            <input type="radio" name="answer_${question.id}" value="C"> 
		            C) ${question.optionC}
		        </label><br>
	        
		        <label>
		            <input type="radio" name="answer_${question.id}" value="D"> 
		            D) ${question.optionD}
		        </label><br>
		        
				
			</c:forEach>
			
			<input type="submit" value="Finalizar">
			
		</form>
			
	</body>
</html>