<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login - Questio Gen</title>
	</head>
	
	<body>
	
		Página de login
		<br>
		<br>
	
		<form action="doLogin" method="post">
			Usuário: <input type="text" name="username">
			Senha: <input type="password" name="password">
			<input type="submit" value="Fazer Login">
		</form>
	
	</body>
</html>