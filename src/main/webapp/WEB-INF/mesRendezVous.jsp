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

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mesRendezVous.css"/>

    <!-- JS FILES -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="d-flex">

	<jsp:include page="sidebar/sidebarDentiste.jsp"></jsp:include>

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
                            <c:when test="${user.sexe == 'Femme'}">
                           		<img src="<%=request.getContextPath()%>/resources/images/profile-dentist-women.jpg">
                            </c:when>
                            <c:otherwise>
                            	<img src="<%=request.getContextPath()%>/resources/images/profile-dentist-men.png">
                            </c:otherwise>
                        </c:choose>

                        <div class="account">
                            <a href="Profile"><h5>${user.prenom} ${user.nom}</h5></a>
                            <p>Dentiste</p>
                        </div>
                    </div>
                    <i class="ri-arrow-down-s-line"></i>
                </div>
            </div>
        </div>

        <div class="main flex-grow-1 d-flex flex-column p-4">
            <div class="header mb-3 d-flex align-items-center justify-content-between">
                <h2>Mes rendez-vous</h2>
                <div class="rdv-counters d-flex">
                    <span class="counter counter-today">
                        <i class="fas fa-clock me-1"></i> Aujourd'hui : ${nbrAujourdhui}
                    </span>
                    <span class="counter counter-upcoming">
                        <i class="fas fa-hourglass-half me-1"></i> À venir : ${nbrAVenir}
                    </span>
                </div>
            </div>

            <div class="table-main d-flex flex-column p-3">

                <form action="MesRendezVous" method="GET" class="for-search d-flex justify-content-end align-items-center gap-2">
                    <input class="form-control" name="dateFilter" type="date" value="${dateFilter}" style="width: 300px;" required>
                    <button class="btn btn-primary" type="submit"><i class="fas fa-search me-1"></i> <b>Rechercher</b></button>
                    <c:if test="${not empty dateFilter}">
                        <a href="MesRendezVous" class="btn btn-outline-secondary"><b>Tout afficher</b></a>
                    </c:if>
                </form>

                <c:choose>
                	<c:when test="${empty lesRendezVous}">
                		<div class="text-center text-muted p-4">
                			<i class="fas fa-calendar-times mb-2" style="font-size: 32px;"></i>
                			<c:choose>
                				<c:when test="${not empty dateFilter}">
                					<p class="mb-0">Aucun rendez-vous trouvé pour le <strong>${dateFilter}</strong>.</p>
                				</c:when>
                				<c:otherwise>
                					<p class="mb-0">Vous n'avez aucun rendez-vous pour le moment.</p>
                				</c:otherwise>
                			</c:choose>
                		</div>
                	</c:when>
                	<c:otherwise>
		                <div class="table-content mt-3">
		                    <table class="table table-striped table-hover align-middle" id="myTable">
		                    	<thead>
		                    		<tr>
		                    			<th>Date & horaire</th>
		                    			<th>Patient</th>
		                    			<th>Téléphone</th>
		                    			<th>Motif</th>
		                    			<th class="text-center">Statut</th>
		                    			<th class="text-center">Dossier médical</th>
		                    		</tr>
		                    	</thead>
		                    	<tbody>
			                    	<c:forEach var="rendezvous" items="${lesRendezVous}">
				                        <tr>
				                            <td class="date-rdv">
				                                <h5 class="text-primary mb-1">${rendezvous.plannification.jour}</h5>
				                                <h8>${rendezvous.plannification.from_T} - ${rendezvous.plannification.to_T}</h8>
				                            </td>

				                            <td>
				                                <h6 class="mb-0">${rendezvous.patient.prenom} ${rendezvous.patient.nom}</h6>
				                                <small class="text-muted">CIN : ${rendezvous.patient.cin}</small>
				                            </td>

				                            <td>${rendezvous.patient.telephone}</td>

				                            <td>
				                            	<c:choose>
				                            		<c:when test="${empty rendezvous.motifRDV}">
				                            			<span class="text-muted">—</span>
				                            		</c:when>
				                            		<c:otherwise>${rendezvous.motifRDV}</c:otherwise>
				                            	</c:choose>
				                            </td>

				                            <td class="text-center">
				                            	<c:choose>
				                            		<%-- ISO dates (YYYY-MM-DD) compare lexicographically = chronologically --%>
				                            		<c:when test="${rendezvous.plannification.jour lt today}">
				                            			<span class="badge-status badge-done">
				                            				<i class="fas fa-check-circle me-1"></i> Effectué
				                            			</span>
				                            		</c:when>
				                            		<c:when test="${rendezvous.plannification.jour eq today}">
				                            			<span class="badge-status badge-today">
				                            				<i class="fas fa-clock me-1"></i> Aujourd'hui
				                            			</span>
				                            		</c:when>
				                            		<c:otherwise>
				                            			<span class="badge-status badge-upcoming">
				                            				<i class="fas fa-hourglass-half me-1"></i> À venir
				                            			</span>
				                            		</c:otherwise>
				                            	</c:choose>
				                            </td>

				                            <td class="text-center">
				                            	<form action="DossierMedical" method="GET" class="d-inline align-middle form-inline">
				                            		<input type="hidden" name="id" value="${rendezvous.patient.id}">
				                            		<button class="image-button align-middle" type="submit" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Dossier médical"></button>
				                            	</form>
				                            </td>
				                        </tr>
							        </c:forEach>
		                    	</tbody>
		                    </table>
		                </div>
                	</c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>

    <style>
    	.right-section .main .table-main .table-content .image-button {
    		width: 20px;
    		height: 20px;
    		background: url("<%=request.getContextPath()%>/resources/images/folder.png") no-repeat center center;
    		background-size: contain;
    		border: none;
    		cursor: pointer;
    	}
    </style>

</body>

</html>
