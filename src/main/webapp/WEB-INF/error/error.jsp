<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="statusCode" value="${requestScope['javax.servlet.error.status_code']}"/>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DENTAL CENTER</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"><!-- Font Awesome 5.15.4 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- Bootstrap CSS 5.3.3 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->

        <style>
            body {
                min-height: 100vh;
                background-color: #f8f9fa;
            }
            .error-code {
                font-size: 7rem;
                font-weight: 700;
                color: #0d6efd;
                line-height: 1;
            }
            .error-icon {
                font-size: 4rem;
                color: #0d6efd;
            }
            .error-card {
                max-width: 550px;
                background-color: #fff;
                border-radius: 1rem;
                box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
            }
        </style>
    </head>
    <body class="d-flex flex-column">
        <div class="header d-flex align-items-center py-4 px-4">
            <a href="<%=request.getContextPath()%>/index.jsp">
                <img class="custom-img" src="<%=request.getContextPath()%>/resources/images/logo-blue.png" alt="DENTAL CENTER" height="50">
            </a>
        </div>

        <div class="d-flex flex-grow-1 align-items-center justify-content-center p-4">
            <div class="error-card text-center p-5">

                <c:choose>
                    <c:when test="${statusCode == 403}">
                        <div class="error-icon mb-3"><i class="fas fa-ban"></i></div>
                        <div class="error-code mb-3">403</div>
                        <h2 class="mb-3">Accès refusé</h2>
                        <p class="text-muted mb-4">Vous n'avez pas les droits nécessaires pour accéder à cette page.</p>
                    </c:when>
                    <c:when test="${statusCode == 404}">
                        <div class="error-icon mb-3"><i class="fas fa-search"></i></div>
                        <div class="error-code mb-3">404</div>
                        <h2 class="mb-3">Page introuvable</h2>
                        <p class="text-muted mb-4">Désolé, la page que vous recherchez n'existe pas ou a été déplacée.</p>
                    </c:when>
                    <c:otherwise>
                        <div class="error-icon mb-3"><i class="fas fa-exclamation-triangle"></i></div>
                        <div class="error-code mb-3">${empty statusCode ? 500 : statusCode}</div>
                        <h2 class="mb-3">Une erreur est survenue</h2>
                        <p class="text-muted mb-4">Un problème inattendu s'est produit. Veuillez réessayer plus tard.</p>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <a class="btn btn-primary px-4" href="<%=request.getContextPath()%>/index.jsp">
                            <i class="fas fa-home me-2"></i>Retour à l'accueil
                        </a>
                    </c:when>
                    <c:when test="${sessionScope.accountType == 'patient'}">
                        <a class="btn btn-primary px-4" href="<%=request.getContextPath()%>/AccueilPatient">
                            <i class="fas fa-home me-2"></i>Retour à mon espace
                        </a>
                    </c:when>
                    <c:when test="${sessionScope.accountType == 'dentiste'}">
                        <a class="btn btn-primary px-4" href="<%=request.getContextPath()%>/AccueilDentiste">
                            <i class="fas fa-home me-2"></i>Retour à mon espace
                        </a>
                    </c:when>
                    <c:when test="${sessionScope.accountType == 'admin'}">
                        <a class="btn btn-primary px-4" href="<%=request.getContextPath()%>/Dashboard">
                            <i class="fas fa-home me-2"></i>Retour à mon espace
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-primary px-4" href="<%=request.getContextPath()%>/index.jsp">
                            <i class="fas fa-home me-2"></i>Retour à l'accueil
                        </a>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </body>
</html>
