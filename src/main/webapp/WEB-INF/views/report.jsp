<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Relatórios - Questio Gen</title>
	</head>
	
	<body>
	
		<c:import url="/WEB-INF/views/fragments/navbar.jsp" />
		
		Histórico de Questionários
		
		<c:forEach var="q" items="${quizes}">
	       
			<a href="quiz_detail?id=${q.id}" style="text-decoration: none; color: inherit;">
		        <div style="margin-bottom: 20px; border: 1px solid #ccc; padding: 10px;">
		            <p><strong>Matéria:</strong> ${q.questions[0].subject.name} (${q.questions[0].subject.discipline.name})</p>
		            <p>${q.questions[0].subject.grade.label} - ${q.questions[0].subject.bimester.label}</p>
		            <p>Data: ${q.finishedAt}</p>
		            
		            <c:if test="${authUser.role == 'ADMIN'}">
		                <p>Estudante: ${q.user.username}</p>
		            </c:if>
		            <small>Clique para ver detalhes</small>
		        </div>
		    </a>	        

	    </c:forEach>
	    
	    <c:if test="${empty quizes}">
        	<p>Nenhum resultado encontrado</p>
    	</c:if>
	    
	</body>
</html>