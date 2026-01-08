<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Usuários - Questio Gen</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
		</head>

		<body>

			<c:import url="/WEB-INF/views/fragments/navbar.jsp" />

			<div class="container">

				<div class="section-header">
					<h1 class="section-title">Gerenciar Usuários</h1>
				</div>

				<div class="form-container" style="margin-top: 0;">
					<p class="card-subtitle mb-4">Cadastrar Novo Usuário</p>
					<form action="createNewUser" method="post">
						<div class="form-group">
							<label>Usuário</label>
							<input type="text" name="username" placeholder="Digite o nome de usuário">
						</div>

						<div class="form-group">
							<label>Senha</label>
							<input type="password" name="password" placeholder="Digite a senha">
						</div>

						<button type="submit">Adicionar novo usuário</button>
					</form>
				</div>

				<h2 class="section-title mt-4">Lista de Usuários</h2>
				<c:choose>
					<c:when test="${not empty usersList}">
						<div class="table-responsive">
							<table>
								<thead>
									<tr>
										<th>Nome de usuário</th>
										<th>Perfil</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${usersList}">
										<tr>
											<td>${user.username}</td>
											<td>${user.role}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:when>
					<c:otherwise>
						<div class="empty-state">
							<p>Nenhum usuário cadastrado</p>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</body>

		</html>