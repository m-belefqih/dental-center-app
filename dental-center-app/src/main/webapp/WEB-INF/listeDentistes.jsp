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
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/listeDentistes.css"/>
    
    <!-- JS FILES -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>  <!-- New version of jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> <!-- AngularJS library -->
     
    <script src="<%=request.getContextPath()%>/resources/js/listeDentistes.js"></script>
 
</head>

<body class="d-flex" ng-app="dentistApp" ng-controller="dentistCtrl">
    
    <!-- siderbar  -->
	<div class="left-section d-flex flex-column align-items-center justify-content-between p-4">
		<div class="sidebar d-flex flex-column">
			<img class="logo-img mx-auto mb-5 w-100" src="<%=request.getContextPath()%>/resources/images/logo-white.png" alt="DENTAL CENTER">
			<div class="item">
				<a href="#" class="d-flex align-items-center"> 
					<i class="ri-dashboard-line"></i>
					<h3>Tableau de bord</h3>
				</a>
			</div>
			<div class="item">
				<a href="#" class="d-flex align-items-center"> 
					<i class="ri-list-check-3"></i>
					<h3>Planification</h3>
				</a>
			</div>
			<div class="item">
				<a href="/dental-center-app/ListePatients" class="d-flex align-items-center"> 
					<i class="ri-user-3-line"></i>
					<h3>Liste des patients</h3>
				</a>
			</div>
			<div class="item active">
				<a href="/dental-center-app/ListeDentistes" class="d-flex align-items-center"> 
					<i class="ri-tooth-line"></i>
					<h3>Liste des dentistes</h3>
				</a>
			</div>
			<div class="item">
				<a href="#" class="d-flex align-items-center"> 
					<i class="ri-question-line"></i>
					<h3>F.A.Q</h3>
				</a>
			</div>
		</div>
		<div class="sign-out">
			<a href="Logout" class="d-flex align-items-center"> 
				<i class="ri-logout-box-r-line"></i>
				<h3>Se déconnecter</h3>
			</a>
		</div>
	</div>

    <div class="right-section flex-grow-1 d-flex flex-column">
        <div class="myNavbar d-flex align-items-center justify-content-end p-4">
             
            <div class="iconsBtns-and-profile d-flex align-items-center justify-content-between">
                <div class="icons-btns d-flex">
                    <i class="ri-notification-3-line"></i>
                    <i class="ri-message-3-line"></i>
                </div>
                <div class="profile d-flex align-items-center justify-content-between">
                    <div class="info d-flex align-items-center">
                        <img src="<%=request.getContextPath()%>/resources/images/profile.png">
                        <div class="account">
                            <a href="Profile"><h5>${user.prenom} ${user.nom}</h5></a>
                            <p>Administrateur</p>
                        </div>
                    </div>
                    <i class="ri-arrow-down-s-line"></i>
                </div>
            </div>
        </div>   

        <div class="main flex-grow-1 d-flex flex-column p-4">
            <div class="header d-flex align-items-center justify-content-between">
                <h2>Liste des dentistes</h2>
            </div>

            <div class="table-main d-flex flex-column mt-4 p-3 ">
                <div class="table-header d-flex justify-content-between">  
                    <div class="btns-add-delete d-flex flex-row justify-content-between">
	                    <a href="#ajouterDentistModal" class="btn btn-success" data-bs-toggle="modal">
	                        <span><i class="fas fa-plus-circle"></i> Ajouter un dentiste</span>
	                    </a>
	                    <a href="#supprimerDentistModal" class="btn btn-danger disabled" data-bs-toggle="modal">
	                        <span><i class="fas fa-minus-circle"></i> Supprimer</span>
	                    </a>
                	</div>
                    <div class="for-search d-flex">
                        <input class="form-control" id="myInput" type="search" placeholder="Chercher" aria-label="Search">
                    </div>
                </div>
                <div class="table-content mt-3">
                    <table class="table table-striped table-hover">
                        <thead class="table-primary ">
                            <tr>
                                <th>
                                    <input type="checkbox" class="form-check-input" id="selectAll"  >
                                </th>
                                <th>Nom</th>
                                <th>Prénom</th>
                                <th>CIN</th>
                                <th>Email</th>
                                <th>Mot de passe</th>
                                <th>spécilité</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <c:forEach var="dentiste" items="${dentistes}" >
                                <tr>
                                    <td>
                                        <input type="checkbox" class="form-check-input" id="${dentiste.id}" value="${dentiste.id}">
                                    </td>
                                    <td>${dentiste.nom}</td>
		                            <td>${dentiste.prenom}</td>
		                            <td>${dentiste.cin}</td>
                            		<td>${dentiste.email}</td>
                            		<td>${dentiste.password}</td>
                            		<td>${dentiste.specialty}</td>
                                    <td>
                                        <a href="#modifierDentistModal" data-bs-toggle="modal">     
                                            <i class="fas fa-edit me-2" ng-click="getDentistDetails('${dentiste.id}')" 
                                            data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Modifier"></i>
                                        </a> 
                                        <a href="#supprimerDentistModal" data-bs-toggle="modal" >
                                            <i class="fas fa-trash me-2" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Supprimer"></i>
                                        </a>
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
	<jsp:include page="ajouterDentiste.jsp"></jsp:include>
	
	<!-- Add Modal HTML -->
	<jsp:include page="modifierDentiste.jsp"></jsp:include>

    <!-- Delete Modal HTML -->
	<jsp:include page="supprimerDentiste.jsp"></jsp:include>
    
</body>

</html>