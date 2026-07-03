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

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/prendreRDV.css"/>

    <!-- JS FILES -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="d-flex">

	<jsp:include page="sidebar/sidebarPatient.jsp"></jsp:include>

    <div class="right-section flex-grow-1 d-flex flex-column">
        <!-- navbar -->
        <jsp:include page="navbar/navbar.jsp"></jsp:include>

        <div class="main flex-grow-1 d-flex flex-column p-4">
            <div class="header mb-3">
                <h2>Mon historique de rendez-vous</h2>
            </div>

            <div class="table-main d-flex flex-column p-3">

                <c:choose>
                	<c:when test="${empty lesRendezVous}">
                		<div class="text-center text-muted p-4">
                			<i class="fas fa-calendar-times mb-2" style="font-size: 32px;"></i>
                			<p class="mb-0">Vous n'avez aucun rendez-vous pour le moment.</p>
                		</div>
                	</c:when>
                	<c:otherwise>
		                <div class="table-content mt-1">
		                    <table class="table table-striped table-hover align-middle" id="myTable">
		                    	<thead>
		                    		<tr>
		                    			<th>Date & horaire</th>
		                    			<th>Dentiste</th>
		                    			<th>Motif</th>
		                    			<th class="text-center">Statut</th>
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
				                                <h6 class="mb-0">Dr. ${rendezvous.plannification.dentiste.prenom} ${rendezvous.plannification.dentiste.nom}</h6>
				                                <small class="text-muted">${rendezvous.plannification.dentiste.specialty}</small>
				                            </td>

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
    	.badge-status {
    		display: inline-block;
    		padding: 6px 14px;
    		border-radius: 20px;
    		font-size: 13px;
    		font-weight: 600;
    		white-space: nowrap;
    	}
    	.badge-done {
    		background-color: var(--light-green);
    		color: var(--dark-green);
    	}
    	.badge-today {
    		background-color: var(--light-yellow);
    		color: var(--dark-yellow);
    	}
    	.badge-upcoming {
    		background-color: var(--light-blue);
    		color: var(--blue-btn);
    	}
    </style>

</body>

</html>
