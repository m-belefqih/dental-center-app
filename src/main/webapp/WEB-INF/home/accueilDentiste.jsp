<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DENTAL CENTER</title>
     
    <!-- CSS FILES -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.min.css"> <!-- REMIX ICON -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"><!-- Font Awesome 5.15.4 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- Bootstrap CSS 5.3.3 -->
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/accueilDentiste.css"/>
    
    <!-- JS FILES -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>  <!-- New version of jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> <!-- AngularJS library -->
     
    <%-- <script src="<%=request.getContextPath()%>/resources/js/listePatients.js"></script> --%>
 
</head>

<body class="d-flex">
     
	<jsp:include page="../sidebar/sidebarDentiste.jsp"></jsp:include>

    <div class="right-section flex-grow-1 d-flex flex-column">
        <!-- navbar -->
        <jsp:include page="../navbar/navbar.jsp"></jsp:include>

        <div class="main flex-grow-1 d-flex flex-column p-4">
            <div class="header mb-4">
                <h2><span class="welcome-text">Bonjour,</span> Dr. ${user.prenom} ${user.nom}</h2>
                <p class="sub-header">Bienvenue dans votre espace dentiste.</p>
            </div>

            <!-- Prochain rendez-vous -->
            <div class="next-rdv-card d-flex align-items-center justify-content-between p-4 mb-4">
                <c:choose>
                    <c:when test="${empty prochainRDV}">
                        <div class="d-flex align-items-center">
                            <div class="rdv-icon">
                                <i class="ri-calendar-line"></i>
                            </div>
                            <div class="rdv-info">
                                <h5>Aucun rendez-vous à venir</h5>
                                <p>Vous n'avez aucun rendez-vous planifié pour le moment.</p>
                            </div>
                        </div>
                        <a href="MesRendezVous" class="btn-rdv">
                            <i class="ri-list-check-3 me-1"></i> Mes rendez-vous
                        </a>
                    </c:when>
                    <c:otherwise>
                        <div class="d-flex align-items-center">
                            <div class="rdv-icon">
                                <i class="ri-calendar-check-line"></i>
                            </div>
                            <div class="rdv-info">
                                <h5>Votre prochain rendez-vous</h5>
                                <p>
                                    <span class="rdv-date">${prochainRDV.plannification.jour}</span>
                                    &nbsp;de ${prochainRDV.plannification.from_T} à ${prochainRDV.plannification.to_T}
                                    &nbsp;avec ${prochainRDV.patient.prenom} ${prochainRDV.patient.nom}
                                </p>
                            </div>
                        </div>
                        <a href="MesRendezVous" class="btn-rdv">
                            <i class="ri-list-check-3 me-1"></i> Mes rendez-vous
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Statistiques simples -->
            <div class="stats d-flex mb-4">
                <div class="stat-card d-flex align-items-center p-3">
                    <i class="ri-time-line stat-yellow"></i>
                    <div class="stat-info">
                        <h3>${nbrAujourdhui}</h3>
                        <p>Rendez-vous aujourd'hui</p>
                    </div>
                </div>
                <div class="stat-card d-flex align-items-center p-3">
                    <i class="ri-hourglass-line stat-blue"></i>
                    <div class="stat-info">
                        <h3>${nbrAVenir}</h3>
                        <p>Rendez-vous à venir</p>
                    </div>
                </div>
                <div class="stat-card d-flex align-items-center p-3">
                    <i class="ri-checkbox-circle-line stat-green"></i>
                    <div class="stat-info">
                        <h3>${nbrEffectues}</h3>
                        <p>Rendez-vous effectués</p>
                    </div>
                </div>
            </div>

            <!-- Accès rapides -->
            <div class="quick-access">
                <h4 class="mb-3">Accès rapides</h4>
                <div class="quick-cards d-flex">
                    <a href="MesRendezVous" class="quick-card d-flex flex-column align-items-center p-4">
                        <i class="ri-list-check-3"></i>
                        <h5>Mes rendez-vous</h5>
                        <p>Consulter mes rendez-vous</p>
                    </a>
                    <a href="ListePatients" class="quick-card d-flex flex-column align-items-center p-4">
                        <i class="ri-user-3-line"></i>
                        <h5>Liste des patients</h5>
                        <p>Voir les dossiers des patients</p>
                    </a>
                    <a href="FAQ" class="quick-card d-flex flex-column align-items-center p-4">
                        <i class="ri-question-line"></i>
                        <h5>F.A.Q</h5>
                        <p>Questions fréquentes</p>
                    </a>
                </div>
            </div>
        </div>
    </div>

</body>

</html>