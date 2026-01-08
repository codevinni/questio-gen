<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Quiz - Questio Gen</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
			<style>
				/* Custom quiz styles */
				.quiz-option {
					display: block;
					padding: 10px;
					border: 1px solid var(--border-color);
					border-radius: var(--radius-md);
					margin-bottom: 0.5rem;
					cursor: pointer;
					transition: background 0.2s;
				}

				.quiz-option:hover {
					background-color: #f8fafc;
					border-color: var(--primary-color);
				}

				.quiz-option input[type="radio"] {
					margin-right: 10px;
				}
			</style>
		</head>

		<body>

			<c:import url="/WEB-INF/views/fragments/navbar.jsp" />

			<div class="container">

				<div class="section-header">
					<h1 class="section-title">Responder Teste</h1>
				</div>

				<form action="quiz_finish" method="post">

					<input type="hidden" name="quizId" value="${quiz.id}">

					<c:forEach var="question" items="${quiz.questions}" varStatus="status">

						<div class="question-block">
							<h3 style="margin-bottom: 1rem; font-size: 1.2rem;">${status.count}. ${question.statement}
							</h3>

							<label class="quiz-option">
								<input type="radio" name="answer_${question.id}" value="A" required>
								A) ${question.optionA}
							</label>

							<label class="quiz-option">
								<input type="radio" name="answer_${question.id}" value="B">
								B) ${question.optionB}
							</label>

							<label class="quiz-option">
								<input type="radio" name="answer_${question.id}" value="C">
								C) ${question.optionC}
							</label>

							<label class="quiz-option">
								<input type="radio" name="answer_${question.id}" value="D">
								D) ${question.optionD}
							</label>

						</div>
					</c:forEach>

					<div style="max-width: 300px; margin: 2rem auto;">
						<button type="submit">Finalizar Teste</button>
					</div>

				</form>

			</div>

		</body>

		</html>