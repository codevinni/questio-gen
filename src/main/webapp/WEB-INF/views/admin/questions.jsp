<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Questões - Questio Gen</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
		</head>

		<body>

			<c:import url="/WEB-INF/views/fragments/navbar.jsp" />

			<div class="container">

				<h1 class="section-title">Questões</h1>

				<div class="form-container" style="margin-top: 0; max-width: 800px;">
					<p class="card-subtitle mb-4">Nova Questão</p>

					<form action="createQuestion" method="post">

						<div class="form-group">
							<label>Matéria:</label>
							<select name="subjectId" required>
								<c:forEach var="subject" items="${subjectsList}">
									<option value="${subject.id}">
										${subject.discipline.name} - ${subject.name} (${subject.grade.label})
									</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<label>Enunciado da Questão:</label>
							<textarea name="statement" rows="4" required
								placeholder="Digite a pergunta aqui..."></textarea>
						</div>

						<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; margin-bottom: 1rem;">
							<div class="form-group">
								<label>Alternativa A</label>
								<input type="text" name="optionA" required>
							</div>
							<div class="form-group">
								<label>Alternativa B</label>
								<input type="text" name="optionB" required>
							</div>
							<div class="form-group">
								<label>Alternativa C</label>
								<input type="text" name="optionC" required>
							</div>
							<div class="form-group">
								<label>Alternativa D</label>
								<input type="text" name="optionD" required>
							</div>
						</div>

						<div class="form-group">
							<label>Alternativa Correta:</label>
							<select name="correctAnswer" required>
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
								<option value="D">D</option>
							</select>
						</div>

						<button type="submit">Criar questão</button>
					</form>
				</div>

				<h2 class="section-title mt-4">Questões Cadastradas</h2>
				<c:choose>
					<c:when test="${not empty questionsList}">
						<div class="table-responsive">
							<table>
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
						</div>
					</c:when>
					<c:otherwise>
						<div class="empty-state">
							<p>Nenhuma questão cadastrada</p>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</body>

		</html>