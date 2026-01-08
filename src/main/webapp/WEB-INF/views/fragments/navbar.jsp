<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	
	<nav>
		
		<a href="home">Início</a>
		
		<c:if test="${authUser.role eq 'USER'}">
			<a href="quiz_setup">Novo Teste</a>
			<a href="report">Meus Resultados</a>
		</c:if>
		
		<c:if test="${authUser.role eq 'ADMIN'}">
			<a href="users">Gerenciar Usuários</a>
			<a href="disciplines">Disciplinas</a>
			<a href="subjects">Materias</a>
			<a href="questions">Questões</a>
			<a href="report">Relatório Geral</a>
		</c:if>
		
		<br>
		
		<c:if test="${not empty sessionScope.authUser}">
			${authUser.username} -> ${authUser.role}
			<a href="doLogout">Logout</a>
		</c:if>
		
		<br>
		
		<c:if test="${not empty errorMsg}">
		    <div style="background-color: #f8d7da; color: #721c24; padding: 10px; border: 1px solid #f5c6cb; text-align: center;">
		        ${errorMsg}
		    </div>
		</c:if>
		
		<c:if test="${not empty errorsList}">
		    <div style="background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; padding: 15px; margin: 10px; border-radius: 5px;">
		        <ul style="margin-bottom: 0;">
		            <c:forEach var="error" items="${errorsList}">
		                <li>${error}</li>
		            </c:forEach>
		        </ul>
		    </div>
		</c:if>
		
		<br>
	</nav>
	
</html>