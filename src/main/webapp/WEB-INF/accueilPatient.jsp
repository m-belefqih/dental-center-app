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
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/accueilPatient.css"/>
    
    <!-- JS FILES -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->
     
     
    <%-- <script src="<%=request.getContextPath()%>/resources/js/listePatients.js"></script> --%>
 	
</head>

<body class="d-flex">
     
	<jsp:include page="sidebar/sidebarPatient.jsp"></jsp:include>

    <div class="right-section flex-grow-1 d-flex flex-column">
        <div class="myNavbar d-flex align-items-center justify-content-end p-4">
            
            <div class="iconsBtns-and-profile d-flex align-items-center justify-content-between">
                <div class="icons-btns d-flex">
                    <i class="ri-notification-3-line"></i>
                    <i class="ri-message-3-line"></i>
                </div>
                <div class="profile d-flex align-items-center justify-content-between">
                    <div class="info d-flex align-items-center">
                    	<c:choose>
                            <c:when test="${user.sexe == 'Homme'}">
                           		<img src="<%=request.getContextPath()%>/resources/images/men.png">
                            </c:when>
                            <c:when test="${user.sexe == 'Femme'}">
                            	<img src="<%=request.getContextPath()%>/resources/images/women.png">
                            </c:when>
                        </c:choose>
                         
                        <div class="account">
                            <a href="Profile"><h5>${user.prenom} ${user.nom}</h5></a>
                            <p>Patient</p>
                        </div>
                    </div>
                    <i class="ri-arrow-down-s-line"></i>
                </div>
            </div>
        </div>   

        <div class="main flex-grow-1 d-flex flex-column p-4">
            <div class="header mb-4">
                <h2><span class="welcome-text">Bonjour,</span> ${user.prenom} ${user.nom}</h2>
                <p class="sub-header">Bienvenue dans votre espace patient.</p>
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
                                <p>Prenez un nouveau rendez-vous dès maintenant.</p>
                            </div>
                        </div>
                        <a href="NouveauRDV" class="btn-rdv">
                            <i class="ri-add-box-line me-1"></i> Prendre un RDV
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
                                    &nbsp;avec Dr. ${prochainRDV.plannification.dentiste.prenom} ${prochainRDV.plannification.dentiste.nom}
                                </p>
                            </div>
                        </div>
                        <a href="MonHistorique" class="btn-rdv">
                            <i class="ri-history-line me-1"></i> Voir mes RDV
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Statistiques simples -->
            <div class="stats d-flex mb-4">
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
                    <a href="NouveauRDV" class="quick-card d-flex flex-column align-items-center p-4">
                        <i class="ri-add-box-line"></i>
                        <h5>Nouveau RDV</h5>
                        <p>Prendre un rendez-vous</p>
                    </a>
                    <a href="MonDossierMedical" class="quick-card d-flex flex-column align-items-center p-4">
                        <i class="ri-id-card-line"></i>
                        <h5>Mon dossier</h5>
                        <p>Consulter mon dossier médical</p>
                    </a>
                    <a href="MonHistorique" class="quick-card d-flex flex-column align-items-center p-4">
                        <i class="ri-history-line"></i>
                        <h5>Mon historique</h5>
                        <p>Voir mes rendez-vous passés</p>
                    </a>
                    <a href="Contact" class="quick-card d-flex flex-column align-items-center p-4">
                        <i class="ri-mail-line"></i>
                        <h5>Contact</h5>
                        <p>Contacter le cabinet</p>
                    </a>
                </div>
            </div>
        </div>
    </div>

</body>

</html>