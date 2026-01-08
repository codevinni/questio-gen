<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Relatórios - Questio Gen</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
		</head>

		<body>

			<c:import url="/WEB-INF/views/fragments/navbar.jsp" />

			<div class="container">
				<h1 class="card-main-title">Histórico de Questionários</h1>

				<div class="card-grid">
					<c:forEach var="q" items="${quizes}">

						<a href="${q.finishedAt != null or authUser.role == 'ADMIN' ? 'quiz_detail' : 'quiz_execute'}?id=${q.id}"
							class="card">

							<div style="display: flex; justify-content: space-between; align-items: start;">
								<div>
									<p class="card-title" style="margin-bottom: 0.5rem;">${q.questions[0].subject.name}
									</p>
									<p class="card-subtitle">${q.questions[0].subject.discipline.name}</p>
								</div>

								<c:choose>
									<c:when test="${q.finishedAt != null}">
										<span class="status-completed">Concluído</span>
									</c:when>
									<c:otherwise>
										<span class="status-pending">Em andamento</span>
									</c:otherwise>
								</c:choose>
							</div>

							<p style="margin-top: 1rem; color: var(--text-muted); font-size: 0.9rem;">
								${q.questions[0].subject.grade.label} - ${q.questions[0].subject.bimester.label}
							</p>

							<c:if test="${q.finishedAt != null}">
								<p
									style="color: var(--text-muted); font-size: 0.8rem; margin-top: auto; padding-top: 1rem;">
									Finalizado em: ${q.formattedFinishedAt}
								</p>
							</c:if>

							<c:if test="${authUser.role == 'ADMIN'}">
								<p style="margin-top: 0.5rem; font-weight: 500;">Estudante: ${q.user.username}</p>
							</c:if>
						</a>

					</c:forEach>
				</div>

				<c:if test="${empty quizes}">
					<div class="empty-state">
						<p>Nenhum resultado encontrado</p>
					</div>
				</c:if>
			</div>

		</body>

		</html>