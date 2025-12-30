<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Usuários - Questio Gen</title>
	</head>
	
	<body>
	
		<c:import url="/WEB-INF/views/fragments/navbar.jsp" />
		
		Usuários
		
		<form action="createNewUser" method="post">
			Usuário: <input type="text" name="username">
			Senha: <input type="password" name="password">
			
			<input type="submit" value="Adicionar novo usuário">
		</form>

		<c:choose>
			<c:when test="${not empty usersList}">
			
				<table border="1">
				
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
			
			</c:when>
			<c:otherwise>Nenhum usuário cadastrado</c:otherwise>
		</c:choose>

	</body>
</html>