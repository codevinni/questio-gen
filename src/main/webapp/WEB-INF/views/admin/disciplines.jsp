<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Disciplina - Questio Gen</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
		</head>

		<body>

			<c:import url="/WEB-INF/views/fragments/navbar.jsp" />

			<div class="container">

				<div class="section-header">
					<h1 class="section-title">Disciplinas</h1>
				</div>

				<div class="form-container" style="margin-top: 0;">
					<p class="card-subtitle mb-4">Nova Disciplina</p>
					<form action="createDiscipline" method="post">
						<div class="form-group">
							<label>Nome</label>
							<input type="text" name="name" placeholder="Ex: Matemática, História...">
						</div>

						<button type="submit">Criar nova disciplina</button>
					</form>
				</div>

				<h2 class="section-title mt-4">Disciplinas Cadastradas</h2>
				<c:choose>
					<c:when test="${not empty disciplinesList}">
						<div class="table-responsive">
							<table>
								<thead>
									<tr>
										<th>Nome</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="discipline" items="${disciplinesList}">
										<tr>
											<td>${discipline.name}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:when>
					<c:otherwise>
						<div class="empty-state">
							<p>Nenhuma disciplina cadastrada</p>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</body>

		</html>