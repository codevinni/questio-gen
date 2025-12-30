<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Questões - Questio Gen</title>
	</head>
	
	<body>
	
		<c:import url="/WEB-INF/views/fragments/navbar.jsp" />
		
		Questões
		
		<form action="createQuestion" method="post">
			
			<label>Matéria:</label>
	        <select name="subjectId" required>
	            <c:forEach var="subject" items="${subjectsList}">
	                <option value="${subject.id}">
	                    ${subject.discipline.name} - ${subject.name} (${subject.grade.label})
	                </option>
	            </c:forEach>
	        </select>
			
			<br>
			
			<label>Enunciado da Questão:</label><br>
    		<textarea name="statement" rows="4" cols="50" required placeholder="Digite a pergunta aqui..."></textarea>
			
			<div>
		        <label>A</label><input type="text" name="optionA" required><br>
		        <label>B</label><input type="text" name="optionB" required><br>
		        <label>C</label><input type="text" name="optionC" required><br>
		        <label>D</label><input type="text" name="optionD" required><br>
    		</div>
			
			<label>Alternativa Correta:</label>
        	<select name="correctAnswer" required>
	            <option value="A">A</option>
	            <option value="B">B</option>
	            <option value="C">C</option>
	            <option value="D">D</option>
        	</select>
			
			<br>
			
			<input type="submit" value="Criar questão">
		</form>

		<c:choose>
		
		    <c:when test="${not empty questionsList}">
		        <table border="1">
		        
		            <thead>
		                <tr>
		                    <th>Enunciado</th>
		                    <th>Matéria</th>
		                    <th>Disciplina</th>
		                    <th>Série</th>
		                    <th>Bimestre</th>
		                    <th>Gabarito</th>
		                </tr>
		            </thead>
		            
		            <tbody>
		                <c:forEach var="question" items="${questionsList}">
		                    <tr>
		                        <td>${question.statement}</td>
		                        <td>${question.subject.name}</td>
		                        <td>${question.subject.discipline.name}</td>
		                        <td>${question.subject.grade.label}</td>
		                        <td>${question.subject.bimester.label}</td>
		                        <td>${question.correctAnswer}</td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		            
		        </table>
		    </c:when>
		    
		    <c:otherwise>
		        Nenhuma questão cadastrada
		    </c:otherwise>
		    
		</c:choose>

	</body>
</html>