<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!-- Viewport meta tag for responsiveness (added here if not present in parent, but good to ensure) -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Link to CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

        <nav>
            <div class="nav-links">
                <a href="home">Início</a>

                <c:if test="${authUser.role eq 'USER'}">
                    <a href="quiz_setup">Novo Teste</a>
                    <a href="report">Meus Resultados</a>
                </c:if>

                <c:if test="${authUser.role eq 'ADMIN'}">
                    <a href="users">Gerenciar Usuários</a>
                    <a href="disciplines">Disciplinas</a>
                    <a href="subjects">Matérias</a>
                    <a href="questions">Questões</a>
                    <a href="report">Relatório Geral</a>
                </c:if>
            </div>

            <c:if test="${not empty sessionScope.authUser}">
                <div class="nav-user-info">
                    <span>${authUser.username} (${authUser.role})</span>
                    <a href="doLogout" class="btn-logout">Sair</a>
                </div>
            </c:if>

            <!-- Error Messages Area -->
            <c:if test="${not empty errorMsg or not empty errorsList}">
                <div class="error-container">
                    <c:if test="${not empty errorMsg}">
                        <div class="error-msg">
                            ${errorMsg}
                        </div>
                    </c:if>

                    <c:if test="${not empty errorsList}">
                        <c:forEach var="error" items="${errorsList}">
                            <div class="error-msg">
                                ${error}
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </c:if>
        </nav>