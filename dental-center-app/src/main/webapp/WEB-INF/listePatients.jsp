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
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/listePatients.css"/>
    
    <!-- JS FILES -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>  <!-- New version of jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> <!-- AngularJS library -->
     
    <script src="<%=request.getContextPath()%>/resources/js/listePatients.js"></script>

</head>

<body class="d-flex" ng-app="patientApp" ng-controller="patientCtrl">
     
    <c:choose>
    	<c:when test="${accountType == 'admin'}">
			<jsp:include page="sidebarAdmin.jsp"></jsp:include>
    	</c:when>
    	<c:when test="${accountType == 'dentiste'}">
			<jsp:include page="sidebarDentiste.jsp"></jsp:include>
    	</c:when>
    </c:choose>
	 
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
                            <c:when test="${accountType == 'admin'}">
                            	<img src="<%=request.getContextPath()%>/resources/images/profile.png">
                            </c:when>
                            <c:when test="${accountType == 'dentiste'}">
                            	<img src="<%=request.getContextPath()%>/resources/images/profile-dentist-men.png">
                       		</c:when>
                        </c:choose>
                         
                        <div class="account">
                            <a href="Profile"><h5>${user.prenom} ${user.nom}</h5></a>
                            <c:choose>
                            	<c:when test="${accountType == 'admin'}">
                            		<p>Administrateur</p>
                            	</c:when>
                            	<c:when test="${accountType == 'dentiste'}">
                            		<p>Dentiste</p>
                            	</c:when>
                            </c:choose>  
                        </div>
                    </div>
                    <i class="ri-arrow-down-s-line"></i>
                </div>
            </div>
        </div>   

        <div class="main flex-grow-1 d-flex flex-column p-4">
            <div class="header">
                <h2>Liste des patients</h2>  
            </div>

            <div class="table-main d-flex flex-column mt-4 p-3 ">
                <div class="table-header d-flex justify-content-between"> 
                	<div class="btns-add-delete d-flex flex-row justify-content-between">
	                    <a href="#ajouterPatientModal" class="btn btn-success" data-bs-toggle="modal">
	                        <span><i class="fas fa-plus-circle"></i> Ajouter un patient</span>
	                    </a> 
	                    <a href="#supprimerPatientModal" class="btn btn-danger disabled" data-bs-toggle="modal">
	                        <span><i class="fas fa-minus-circle"></i> Supprimer</span>
	                    </a>
                	</div>
                    <div class="for-search">
                        <input class="form-control" id="myInput" type="search" placeholder="Chercher" aria-label="Search">  
                    </div>
                </div>
                <div class="table-content mt-3">
                    <table class="table table-striped table-hover">
                        <thead class="table-primary ">
                            <tr>
                                <th>
                                    <input type="checkbox" class="form-check-input" id="selectAll">
                                </th>
                                <th>Nom</th>
                                <th>Prénom</th>
                                <th>Date de naissance</th>
                                <th>CIN</th>
                                <th>Téléphone</th>
                                <th>Adresse</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <c:forEach var="patient" items="${patients}" >
                                <tr>
                                    <td>
                                        <input type="checkbox" class="form-check-input" id="${patient.id}" value="${patient.id}">
                                    </td>
                                    <td>${patient.nom}</td>
		                            <td>${patient.prenom}</td>
		                            <td>${patient.birthDate}</td>
		                            <td>${patient.cin}</td>
                            		<td>${patient.telephone}</td>
                            		<td>${patient.adresse}</td>
                                    <td>
                                    
                                        <a href="#modifierPatientModal" class="d-inline align-middle" data-bs-toggle="modal">     
                                            <i class="fas fa-edit me-2" ng-click="getPatientDetails('${patient.id}')" 
                                            data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Modifier"></i>
                                        </a> 
                                        
                                        <a href="#supprimerPatientModal" class="d-inline align-middle" data-bs-toggle="modal" >
                                            <i class="fas fa-trash me-2" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Supprimer"></i>
                                        </a>
                                       
                                        <form action="DossierMedical" method="GET" class="d-inline align-middle form-inline" >
                                        	<input type="hidden" name="id" value="${patient.id}">
                                        	<button class="image-button align-middle" type="submit" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Dossier médical"></button>
                                        </form>
                                    </td>
                                </tr>  
                            </c:forEach>	
                        </tbody>
                      </table>
                </div>
            </div>     
        </div>
    </div>

	<!-- Add Modal HTML -->
	<jsp:include page="ajouterPatient.jsp"></jsp:include>
	
	<!-- Update Modal HTML -->
	<jsp:include page="modifierPatient.jsp"></jsp:include>

    <!-- Delete Modal HTML -->
	<jsp:include page="supprimerPatient.jsp"></jsp:include>
    
</body>

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

</html>