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
				<h1 class="card-main-title">Selecione uma Matéria</h1>

				<div class="card-grid card-grid-constrained">
					<c:forEach var="subject" items="${subjectsList}">
						<form action="quiz_generate" method="post" class="card-form-wrapper">
							<input type="hidden" name="subjectId" value="${subject.id}">

							<button type="submit" class="card card-btn">
								<span class="card-title">${subject.name}</span>
							</button>
						</form>
					</c:forEach>
				</div>
			</div>

		</body>

		</html>