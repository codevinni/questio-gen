<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Erro! - Questio Gen</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    </head>

    <body>

        <div class="container" style="display: flex; align-items: center; justify-content: center; height: 100vh;">
            <div class="card text-center" style="max-width: 500px; padding: 3rem;">
                <h1 class="card-title" style="color: var(--error-text); margin-bottom: 1rem;">Acesso Negado ou Erro</h1>
                <p style="color: var(--text-muted); margin-bottom: 2rem;">
                    Erro ao encontrar página ou acesso não autorizado!
                </p>
                <a href="home" class="btn">Voltar ao Início</a>
            </div>
        </div>

    </body>

    </html>