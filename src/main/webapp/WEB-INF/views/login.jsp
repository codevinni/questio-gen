<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Login - Questio Gen</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
		</head>

		<body>

			<div class="container"
				style="display: flex; align-items: center; justify-content: center; min-height: 100vh;">

				<div class="card" style="max-width: 400px; width: 100%; padding: 2.5rem;">
					<div style="text-align: center; margin-bottom: 2rem;">
						<h1 class="card-main-title">Questio Gen</h1>
						<p class="card-subtitle">Entre para continuar</p>
					</div>

					<form action="doLogin" method="post">
						<div class="form-group">
							<label>Usuário</label>
							<input type="text" name="username" required placeholder="Seu usuário">
						</div>

						<div class="form-group">
							<label>Senha</label>
							<input type="password" name="password" required placeholder="Sua senha">
						</div>

						<button type="submit" style="width: 100%; margin-top: 1rem;">Entrar</button>
					</form>
				</div>

			</div>

		</body>

		</html>