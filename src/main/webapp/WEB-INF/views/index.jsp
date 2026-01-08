<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Início - Questio Gen</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
		</head>

		<body>

			<c:import url="/WEB-INF/views/fragments/navbar.jsp" />

			<div class="container">
				<div class="text-center" style="margin-top: 10vh;">
					<h1 class="card-main-title" style="font-size: 2.5rem;">
						Bem-vindo ao Questio Gen</h1>
					<p class="card-subtitle mb-4"
						style="max-width: 600px; margin-left: auto; margin-right: auto; font-size: 1.1rem;">
						Sua plataforma de geração de questionários.
					</p>

					<div class="card-grid home-grid" style="max-width: 800px; margin: 0 auto;">

						<c:if test="${authUser.role eq 'USER'}">
							<a href="quiz_setup" class="card btn-auto"
								style="min-height: 180px; justify-content: center;">
								<h3 class="card-title">Novo Teste</h3>
								<p class="card-subtitle">Inicie um novo questionário agora</p>
							</a>

							<a href="report" class="card btn-auto" style="min-height: 180px; justify-content: center;">
								<h3 class="card-title">Meus Resultados</h3>
								<p class="card-subtitle">Veja seu histórico de desempenho</p>
							</a>
						</c:if>

						<c:if test="${authUser.role eq 'ADMIN'}">
							<a href="users" class="card btn-auto" style="min-height: 180px; justify-content: center;">
								<h3 class="card-title">Gerenciar Usuários</h3>
								<p class="card-subtitle">Administre o acesso ao sistema</p>
							</a>

							<a href="report" class="card btn-auto" style="min-height: 180px; justify-content: center;">
								<h3 class="card-title">Relatórios Gerais</h3>
								<p class="card-subtitle">Acompanhe estatísticas globais</p>
							</a>
						</c:if>

					</div>
				</div>
			</div>

		</body>

		</html>