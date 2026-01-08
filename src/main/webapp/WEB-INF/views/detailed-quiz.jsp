<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalhes do Questionário - Questiogen</title>
</head>
<body>

    <c:import url="/WEB-INF/views/fragments/navbar.jsp" />

    <div style="background-color: #f4f4f4; padding: 20px; margin-bottom: 30px;">
        <h2>Resumo do Desempenho</h2>
        <p><strong>Disciplina:</strong> ${q.questions[0].subject.discipline.name}</p>
        <p><strong>Matéria:</strong> ${quiz.questions[0].subject.name}</p>
        <p><strong>Estudante:</strong> ${quiz.user.username}</p>
        <p><strong>Nota Final:</strong> ${quiz.result}</p>
        <p><strong>Status:</strong> ${quiz.finishedAt != null ? 'Finalizado' : 'Em aberto'}</p>
        
        <p><strong>Iniciado em:</strong> ${quiz.formattedCreatedAt}</p>
        <p><strong>Concluído em:</strong> ${quiz.formattedFinishedAt}</p>
    </div>

    <hr>

    <h3>Questões do Teste</h3>
    <c:forEach var="q" items="${quiz.questions}" varStatus="status">
        <div style="margin-bottom: 25px; padding-left: 10px; border-left: 4px solid #007bff;">
            <p><strong>${status.count}. ${q.statement}</strong></p>
            
            <ul>
                <li>A) ${q.optionA}</li>
                <li>B) ${q.optionB}</li>
                <li>C) ${q.optionC}</li>
                <li>D) ${q.optionD}</li>
            </ul>
            
            <p style="color: green; font-weight: bold;">
                Gabarito Correto: ${q.correctAnswer}
            </p>
        </div>
    </c:forEach>

    <a href="report">Voltar para a lista</a>

</body>
</html>