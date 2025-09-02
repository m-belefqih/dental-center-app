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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>  <!-- New version of jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->
     
    <script src="<%=request.getContextPath()%>/resources/js/prendreRDV.js"></script>
 	
</head>

<body class="d-flex">
     
	<jsp:include page="sidebarPatient.jsp"></jsp:include>

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
            <div class="header mb-3">
                <h2>Les rendez-vous disponibles</h2>  
            </div>    
            
            <c:if test="${isBooking == 'Yes'}">
				<div class="alert alert-success alert-dismissible fade show" role="alert">
        			<i class="fas fa-check-circle me-2"></i>
        			Vous avez pris un nouveau rendez-vous.
        			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    			</div>
        	</c:if>

            <div class="table-main d-flex flex-column p-3 ">
                <div class="for-search d-flex justify-content-center">
                    <input class="form-control" id="myInput" type="date" style="width: 300px;">  
                </div>

                <div class="table-content mt-3">
                     <table class="table table-striped table-hover" id="myTable">
                     	
                     	<% int i = 0; %>   
                     	
                     	<c:forEach var="plannification" items="${plannifications}" >
                     		 
	                        <tr>
	                            <td class="date-rdv align-middle text-center">
	                                <h5 class="text-primary">${plannification.jour}</h5>
	                                <h8>${plannification.from_T } - ${plannification.to_T}</h8>
	                            </td>
	                           
	                            <td>
	                                <div class="dentist-info d-flex">
	                                	<c:choose>
				                            <c:when test="${plannification.dentiste.prenom == 'Asmae'}">
				                            	<img src="<%=request.getContextPath()%>/resources/images/profile-dentist-women.jpg">
				                            </c:when>
				                            <c:otherwise>
				                            	<img src="<%=request.getContextPath()%>/resources/images/profile-dentist-men.png">
				                            </c:otherwise>
				                        </c:choose>
	                                     
	                                    <div class="mt-2 ms-4">
	                                        <h5>Dr. ${plannification.dentiste.prenom} ${plannification.dentiste.nom}</h5> 
	                                        <h6>Email : ${plannification.dentiste.email}</h6>
	                                        <h6>Spécialité : ${plannification.dentiste.specialty}</h6>
	                                    </div>
	                                </div>
	                                 
	                            </td>
	                             
	                            <td class="align-middle text-center">
	                            	<!-- <form action="/dental-center-app/NouveauRDV/prendre" method="POST"> -->
 
 										<c:set var="myTest" value="no"/>
 										
	                                	<c:forEach var="rendezvous" items="${lesRendezVous}" >
	                                	 
					                    	<c:if test="${rendezvous.plannification.id == plannification.id}">
					                        	<c:set var="myTest" value="yes"/>
					                        </c:if>   
	 
	                                	</c:forEach>
	                                	
	                                	<c:choose>
				                            <c:when test="${myTest == 'yes'}">
				                            	 <button class="btn btn-success" disabled>
				                        			Déjà pris
				                        		</button>
				                        		 
				                            </c:when>
				                            <c:when test ="${myTest == 'no'}">
				                            	 
				                            	<% i++; %>
				                            	  
				                       			 <input type="checkbox" class="btn-check" id="btn-check-outlined<%=i%>" value="${plannification.id}" data-bs-toggle="modal" data-bs-target="#PrendreRendezVousModal">
                                				 <label class="btn btn-outline-primary" for="btn-check-outlined<%=i%>">Prendre ce rendez-vous</label>
				                       			   
				                            </c:when>
				                        </c:choose>

	                            	<!-- </form>   -->  
	                            </td>
	                        </tr>

						</c:forEach>
                         
                     </table>
                </div>
            </div>
        </div>
    </div>

	<!-- Take an appointment Modal HTML -->
	<div id="PrendreRendezVousModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/dental-center-app/NouveauRDV/set" method="POST">
				 
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Confirmation de rendez-vous</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-hidden="true"></button>
					</div>

					<!-- Modal Body -->
					<div class="modal-body">
						<p>Choisissez votre motif de rendez-vous *</p>
						<div class="mb-3"> 
							<select class="form-select" size="7" multiple aria-label="size 7 select example">
							  <option value="Consultation dentaire" selected>Consultation dentaire</option>
							  <option value="Urgence dentaire">Urgence dentaire</option>
							  <option value="Traitement dentaire">Traitement dentaire</option>
							  <option value="Détartrage">Détartrage</option>
							  <option value="Traitement endodontique">Traitement endodontique</option>
							  <option value="Extraction dentaire">Extraction dentaire</option>
							  <option value="Blanchiment dentaire">Blanchiment dentaire</option>
							</select>
						</div>
						 
					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<input type="hidden" name="mobe" value="{{plannification.id}}">
						<input type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="Annuler"> 
						<input type="submit" class="btn btn-success" id="action-button" value="Confirmer">
					</div>
				</form>
			</div>
		</div>
	</div>

</body>

</html>