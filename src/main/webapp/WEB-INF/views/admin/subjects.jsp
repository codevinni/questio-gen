<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Matéria - Questio Gen</title>
	</head>
	
	<body>
	
		<c:import url="/WEB-INF/views/fragments/navbar.jsp" />
		
		Matérias
		
		<form action="createSubject" method="post">
		
			Nome: <input type="text" name="name">
			
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
			
			<input type="submit" value="Adicionar nova matéria">
			
		</form>

		<c:choose>
			<c:when test="${not empty subjectsList}">
			
				<table border="1">
				
					<thead>
						<tr>
							<th>Nome</th>
							<th>Disciplina</th>
							<th>Série</th>
							<th>Bimestre</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="subject" items="${subjectsList}">
							<tr>
								<td>${subject.name}</td>
								<td>${subject.discipline.name}</td>
								<td>${subject.grade.label}</td>
								<td>${subject.bimester.label}</td>
							</tr>
						</c:forEach>
					</tbody>
				
				</table>
			
			</c:when>
			<c:otherwise>Nenhuma matéria cadastrada</c:otherwise>
		</c:choose>

	</body>
</html>