<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Detalhes do Questionário - Questiogen</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        </head>

        <body>

            <c:import url="/WEB-INF/views/fragments/navbar.jsp" />

            <div class="container">
                <h1 class="section-title">Detalhes do Questionário</h1>

                <div class="card mb-4" style="border-left: 5px solid var(--primary-color);">
                    <h2 class="card-title" style="margin-bottom: 1rem;">Resumo do Desempenho</h2>
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1rem;">
                        <p><strong>Disciplina:</strong> ${q.questions[0].subject.discipline.name}</p>
                        <p><strong>Matéria:</strong> ${quiz.questions[0].subject.name}</p>
                        <p><strong>Estudante:</strong> ${quiz.user.username}</p>
                        <p><strong>Nota Final:</strong> <span
                                style="font-size: 1.2em; font-weight: bold; color: var(--primary-color);">${quiz.result}</span>
                        </p>
                        <p><strong>Status:</strong>
                            <span class="${quiz.finishedAt != null ? 'status-completed' : 'status-pending'}">
                                ${quiz.finishedAt != null ? 'Finalizado' : 'Em aberto'}
                            </span>
                        </p>
                        <p><strong>Iniciado em:</strong> ${quiz.formattedCreatedAt}</p>
                        <p><strong>Concluído em:</strong> ${quiz.formattedFinishedAt}</p>
                    </div>
                </div>

                <h3 class="section-title mt-4">Questões do Teste</h3>

                <c:forEach var="q" items="${quiz.questions}" varStatus="status">
                    <div class="question-block">
                        <p class="mb-2" style="font-size: 1.1rem;"><strong>${status.count}. ${q.statement}</strong></p>

                        <div style="margin-left: 1rem; margin-bottom: 1rem; display: grid; gap: 0.5rem;">
                            <p>A) ${q.optionA}</p>
                            <p>B) ${q.optionB}</p>
                            <p>C) ${q.optionC}</p>
                            <p>D) ${q.optionD}</p>
                        </div>

                        <div
                            style="background-color: var(--success-bg); color: var(--success-text); padding: 0.5rem 1rem; border-radius: var(--radius-md); display: inline-block;">
                            <strong>Gabarito Correto:</strong> ${q.correctAnswer}
                        </div>
                    </div>
                </c:forEach>

                <div class="mt-4 mb-4">
                    <a href="report" class="btn btn-secondary btn-auto">Voltar para a lista</a>
                </div>
            </div>

        </body>

        </html>