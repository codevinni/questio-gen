<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Novo Teste - Questio Gen</title>
	</head>
	
	<body>
	
		<c:import url="/WEB-INF/views/fragments/navbar.jsp" />
		
		Filtros
		
		<form action="quiz_selection" method="post">
		
			<label>Disciplina</label>
			<select name="disciplineId">
				<c:forEach var="discipline" items="${disciplinesList}">
					<option value="${discipline.id}">${discipline.name}</option>
				</c:forEach>
			</select>
		
			<label>Série</label>
			<select name="grade">
				<c:forEach var="grade" items="${grades}">
					<option value="${grade}">${grade.label}</option>
				</c:forEach>
			</select>
			
			<label>Bimestre</label>
			<select name="bimester">
				<c:forEach var="bimester" items="${bimesters}">
					<option value="${bimester}">${bimester.label}</option>
				</c:forEach>
			</select>
			
			<input type="submit" value="Avançar">
			
		</form>

	</body>
</html>