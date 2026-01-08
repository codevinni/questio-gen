<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Novo Teste - Questio Gen</title>
	</head>
	
	<body>
	
		<c:import url="/WEB-INF/views/fragments/navbar.jsp" />
		
		Seleção de matéria
		<c:forEach var="subject" items="${subjectsList}">
			<form action="quiz_generate" method="post">
			
	            <input type="hidden" name="subjectId" value="${subject.id}">
	            
	            <button type="submit">
	                  ${subject.name}
	            </button>
	            
	        </form>
		</c:forEach>
	</body>
</html>