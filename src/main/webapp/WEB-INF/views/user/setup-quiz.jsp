<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Novo Teste - Questio Gen</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
		</head>

		<body>

			<c:import url="/WEB-INF/views/fragments/navbar.jsp" />

			<div class="container">

				<h1 class="section-title">Filtrar Matérias</h1>

				<div class="form-container" style="margin-top: 2rem;">
					<p class="card-subtitle mb-4">Selecione os critérios para encontrar sua matéria</p>

					<form action="quiz_selection" method="post">

						<div class="form-group">
							<label>Disciplina</label>
							<select name="disciplineId">
								<c:forEach var="discipline" items="${disciplinesList}">
									<option value="${discipline.id}">${discipline.name}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<label>Série</label>
							<select name="grade">
								<c:forEach var="grade" items="${grades}">
									<option value="${grade}">${grade.label}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<label>Bimestre</label>
							<select name="bimester">
								<c:forEach var="bimester" items="${bimesters}">
									<option value="${bimester}">${bimester.label}</option>
								</c:forEach>
							</select>
						</div>

						<button type="submit">Avançar</button>

					</form>
				</div>
			</div>

		</body>

		</html>