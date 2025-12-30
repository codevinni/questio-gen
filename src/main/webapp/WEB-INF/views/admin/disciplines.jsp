<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Disciplina - Questio Gen</title>
	</head>
	
	<body>
	
		<c:import url="/WEB-INF/views/fragments/navbar.jsp" />
		
		Disciplina
		
		<form action="createDiscipline" method="post">
			Nome: <input type="text" name="name">
	
			<input type="submit" value="Criar nova disciplina">
		</form>

		<c:choose>
			<c:when test="${not empty disciplinesList}">
			
				<table border="1">
				
					<thead>
						<tr>
							<th>Nome</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="discipline" items="${disciplinesList}">
							<tr>
								<td>${discipline.name}</td>
							</tr>
						</c:forEach>
					</tbody>
				
				</table>
			
			</c:when>
			<c:otherwise>Nenhuma disciplina cadastrada</c:otherwise>
		</c:choose>

	</body>
</html>