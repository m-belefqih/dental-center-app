<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%@ page import="com.entities.Patient" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DENTAL CENTER</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.min.css"> <!-- REMIX ICON -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"><!-- Font Awesome 5.15.4 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- Bootstrap CSS 5.3.3 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dossierMedical.css"/>
     
</head>

<body class="d-flex">

  	<%  // Calculate the age of the patient
  	
  		Patient patient = (Patient) request.getAttribute("patient"); 
  		String dateOfBirth = patient.getBirthDate();
  		
  		LocalDate dateNaissance = LocalDate.parse(dateOfBirth);

        LocalDate dateActuelle = LocalDate.now();
        
        Period periode = Period.between(dateNaissance, dateActuelle);
  	%>
     
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

        <form class="main flex-grow-1 d-flex flex-column p-4" action="DossierMedical" method="POST">
        	<c:if test="${isUpdated == 'Yes' }">
				<div class="alert alert-success alert-dismissible fade show" role="alert">
        			<i class="fas fa-check-circle me-2"></i>
        			Le dossier médical de <strong>${patient.prenom} ${patient.nom}</strong> a été enregistré avec succès.
        			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    			</div>
        	</c:if>
			<div class="row">
				<div class="col-lg-4">
					<div class="card mb-4 border-custom">
						<div class="card-body text-center">
							<c:choose>
								<c:when test="${patient.sexe == 'Homme'}">
									<img src="<%=request.getContextPath()%>/resources/images/men.png" alt="Homme" class="rounded-circle img-fluid" style="width: 150px;">
								</c:when>
								<c:when test="${patient.sexe == 'Femme'}">
									<img src="<%=request.getContextPath()%>/resources/images/women.png" alt="Femme" class="rounded-circle img-fluid" style="width: 150px;">
								</c:when>
							</c:choose>
							<h5 class="my-3 fw">${patient.prenom} ${patient.nom}</h5>
							<p class="text-muted mb-2">${patient.cin}</p>
							<p class="text-muted mb-2">Enseignant</p>
							<p class="text-muted mb-0">${patient.sexe}</p>
						</div>
					</div>
				</div>

				<div class="col-lg-8">
					<div class="card mb-1 border-custom">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0 fw-bold">Adresse</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${patient.adresse}</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0 fw-bold">Email</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${patient.email}</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0 fw-bold">Téléphone</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${patient.telephone}</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0 fw-bold">Date de naissance</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${patient.birthDate}</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0 fw-bold">Age</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0"><%=periode.getYears()%> ans</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0 fw-bold">Mutuelle</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">MCMA</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<input type="hidden" name="idPatient" value="${patient.id}">

			<c:if test="${!empty lesRendezVous}">
				<% int i = 0; %>
				<c:forEach var="rendezvous" items="${lesRendezVous}">
					<% i++; %>
					<div class="row mb-3">
						<div class="col">
							<div class="card mb-0 border-custom">
								<div class="card-body">
									<div class="row">
										<div class="col-sm-1">
											<a id="toggleIcon<%=i%>" data-bs-toggle="collapse" href="#collapseExample<%=i%>" aria-expanded="false" aria-controls="collapseExample"> 
												<i class="fas fa-caret-right" style="font-size: 30px;"></i>
											</a>
										</div>
										<div class="col-sm-2 d-flex align-items-center">
											<p class="mb-0 ms-3 fw-bold">Rendez-vous</p>
										</div>
										<div class="col-sm-1 d-flex justify-content-center">
											<div class="vertical-line"></div>
										</div>
										<div class="col-sm-6 d-flex align-items-center">
											<p class="mb-0">${rendezvous.dateRDV}</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
	
	
					<div class="row collapse mb-2" id="collapseExample<%=i%>">
						<div class="col">
							<table class="table">
								<tbody>
									<tr>
										<td class="fw-bold align-middle text-costum">Motif de rendez-vous</td>
										<td>
											<input type="text" class="form-control" name="motifRDV<%=i%>" value="${rendezvous.motifRDV}">
										</td>
										<td class="fw-bold align-middle text-costum">Examens & actes</td>
										<td>
											<input type="text" class="form-control" name="actes<%=i%>" value="${rendezvous.actes}">
										</td>
									</tr>
									<tr>
										<td class="fw-bold align-middle text-costum">Examens radiologiques</td>
										<td>
											<input type="text" class="form-control" name="examensRadio<%=i%>" value="${rendezvous.examensRadio}">
										</td>
										<td class="fw-bold align-middle text-costum">Traitements</td>
										<td>
											<input type="text" class="form-control" name="traitements<%=i%>" value="${rendezvous.traitements}">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
	
					<input type="hidden" name="id<%=i%>" value="${rendezvous.id}">
	
				</c:forEach>
	
				<div class="row">
					<div class="col">
						<div class="submit-button d-flex align-items-center justify-content-end">
							<button class="btn btn-success" type="submit">Enregistrer</button>
						</div>
					</div>
				</div>
	
				<input type="hidden" name="nbrRDV" value="<%=i%>" >
				
				 
			
				<script>
					document.addEventListener('DOMContentLoaded', function() {
						for (let j = 1; j <= <%=i%> ; j++) {
							let toggleIcon = document.getElementById('toggleIcon' + j);
							toggleIcon.addEventListener('click', function() {
								this.classList.toggle('active');
							});
						}
					});
				</script>
	
				<style>
				
					<% for (int j = 1; j <= i; j++) { %>
					
						.right-section .main .row #toggleIcon<%=j%> .fa-caret-right {
						    transition: transform 0.3s;
						}
						
						.right-section .main .row #toggleIcon<%=j%>.active .fa-caret-right {
						    transform: rotate(90deg);  
						}
					
					<% } %>
				</style>
			
			</c:if>
 		  
        </form>
    
    </div>
  
</body>

</html>