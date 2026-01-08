<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Matéria - Questio Gen</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
		</head>

		<body>

			<c:import url="/WEB-INF/views/fragments/navbar.jsp" />

			<div class="container">

				<h1 class="section-title">Matérias</h1>

				<div class="form-container" style="margin-top: 0;">
					<p class="card-subtitle mb-4">Nova Matéria</p>

					<form action="createSubject" method="post">

						<div class="form-group">
							<label>Nome</label>
							<input type="text" name="name" placeholder="Ex: Álgebra Linear">
						</div>

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

						<button type="submit">Adicionar nova matéria</button>

					</form>
				</div>

				<h2 class="section-title mt-4">Matérias Cadastradas</h2>
				<c:choose>
					<c:when test="${not empty subjectsList}">

						<div class="table-responsive">
							<table>
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
						</div>

					</c:when>
					<c:otherwise>
						<div class="empty-state">
							<p>Nenhuma matéria cadastrada</p>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</body>

		</html>