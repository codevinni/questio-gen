<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	
	<nav>
		
		<a href="">Início</a>
		
		<c:if test="${authUser.role eq 'USER'}">
			<a href="">Novo Teste</a>
			<a href="">Meus Resultados</a>
		</c:if>
		
		<c:if test="${authUser.role eq 'ADMIN'}">
			<a href="users">Gerenciar Usuários</a>
			<a href="disciplines">Disciplinas</a>
			<a href="subjects">Materias</a>
			<a href="questions">Questões</a>
			<a href="">Relatório Geral</a>
		</c:if>
		
		<br>
		
		<c:if test="${not empty sessionScope.authUser}">
			${authUser.username} -> ${authUser.role}
			<a href="doLogout">Logout</a>
		</c:if>
		
		<br>
		<br>
	</nav>
	
</html>