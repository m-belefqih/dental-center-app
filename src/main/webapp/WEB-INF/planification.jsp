<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">

<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>DENTAL CENTER</title>
	
	<!-- CSS FILES -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.min.css"> <!-- REMIX ICON -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"><!-- Font Awesome 5.15.4 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- Bootstrap CSS 5.3.3 -->
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/planification.css"/>
	
	<!-- JS FILES -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>  <!-- New version of jQuery library -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->
	
	<%-- <script src="<%=request.getContextPath()%>/resources/js/planification.js"></script> --%>
	
</head>
<body class="d-flex">

	<!-- siderbar admin  -->
    <jsp:include page="sidebarAdmin.jsp"></jsp:include>

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
			
            <div class="header">
                <h2>Planification</h2>  
            </div>    

			<c:if test="${messageWarning == 'Yes'}">
				<div class="alert alert-warning alert-dismissible fade show" role="alert">
					<i class="fas fa-exclamation-circle me-2"></i> 
					Le <strong>${formattedDate}</strong> est déjà planifié. Veuillez sélectionner une autre date.
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</c:if>
			
			<c:if test="${messageSuccess == 'Yes'}">	 
				<div class="alert alert-success alert-dismissible fade show" role="alert">
        			<i class="fas fa-check-circle me-2"></i>
        			Le <strong>${formattedDate}</strong> a été planifié avec succès.
        			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    			</div>
			</c:if>

            <form action="Planning" method="POST" class="content-main d-flex flex-column mt-4 p-3 ">
                <div class="for-search d-flex justify-content-center">
                    <input class="form-control" name="datePlanning" type="date" style="width: 300px;" required> 
                </div>

                <div class="row custom-border mt-3 m-1 ">
                    <div class="col mt-4 mb-4">
                        <div class="morning d-flex justify-content-center">
                            <h4 class="text-primary" style="font-weight: 800;">8h00 - 12h00</h4>
                        </div>

                        <div class="all-dentists mt-4 ms-5 pt-3 ps-3 px-3 pb-2">
                        
                        	<c:forEach var="dentiste" items="${dentistes}">
                        	
                        		<div class="dentist-item d-flex align-items-center justify-content-between">
                                	<h6 class="dentist-name">Dr. ${dentiste.nom} ${dentiste.prenom}</h6>
                                	<input type="checkbox" class="form-check-input dentistMorning-checkbox" name="dentistesMatin" value="${dentiste.id}">
                            	</div> 
                            	
                        	</c:forEach>  
                        	 
                        </div>
                    </div>

                    <div class="col-sm-1 d-flex justify-content-center">
                        <div class="vertical-line"></div>
                    </div>

                    <div class="col mt-4 mb-4">
                        <div class="morning d-flex justify-content-center">
                            <h4 class="text-primary" style="font-weight: 800;">14h00 - 18h00</h4>
                        </div>

                        <div class="all-dentists mt-4 ms-1 mx-5 pt-3 ps-3 px-3 pb-2">
                            
                            <c:forEach var="dentiste" items="${dentistes}">
                        	
                        		<div class="dentist-item d-flex align-items-center justify-content-between">
                                	<h6 class="dentist-name">Dr. ${dentiste.nom} ${dentiste.prenom}</h6>
                                	<input type="checkbox" class="form-check-input dentistEvening-checkbox" name="dentistesSoir" value="${dentiste.id}">
                            	</div> 
                            	
                        	</c:forEach>
                            
                        </div>
                        
                    </div> 
                </div>

                <p class="title mt-3" style="color: red; font-weight: bold;">NB : La sélection est limitée à 5 dentistes pour chaque plage d'horaire !</p>

          
 
                <div class="row">
					<div class="col">
						<div class="submit-button d-flex align-items-center justify-content-center">
							<button class="btn btn-success" type="submit"><b>Enregistrer</b></button>
						</div>
					</div>
				</div>

            </form>
        </div>
    </div>


	<%-- <form action="Planning" method="POST">

		<p class="text-danger">${messageExist}</p>

		<c:if test="${isPlanned == 'Yes'}">
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
				<i class="fas fa-exclamation-circle me-2" style="font-size: 1.5em;"></i>
				Le <strong>${formattedDate}</strong> est déjà planifié. Veuillez sélectionner une autre date.
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</c:if>

		<input class="form-control" id="myInput" type="date"
			name="datePlanning" required> <br>

		<h3>8h00 --> 12h00</h3>

		<c:forEach var="dentiste" items="${dentistes}">

			<p>
				<input type="checkbox" name="dentistesMatin" value="${dentiste.id}" />${dentiste.prenom}
				${dentiste.nom}
			</p>

		</c:forEach>

		<hr>

		<h3>14h00 --> 18h00</h3>

		<c:forEach var="dentiste" items="${dentistes}">

			<p>
				<input type="checkbox" name="dentistesSoir" value="${dentiste.id}" />${dentiste.prenom} ${dentiste.nom}
			</p>
			 
		</c:forEach>

	 
		<input type="submit" value="Enregistrer" />
	</form> --%>


	<script>
        /*$(document).ready(function() {
            $('#myInput').on('change', function(event) {
                 
                    
                	var selectedDate = $(this).val();
                    
                    
                    $.ajax({
             
                        url: '/dental-center-app/Plannification/date',  
            			async: false,  
            			type: "POST",  
            			data: { "selectedDate": selectedDate },
                         
                        success: function(data, textStatus, jqXHR) {
                			if (data != "") {
                				response = data;  
                				 
                			} else {
                				response = '';  
                			}  
                		},
                		 
                		error: function(jqXHR, textStatus, errorThrown) {
                			console.log("Something went wrong==>", errorThrown);  
                			response = '';  
                			 
                			alert('exception, errorThrown==>' + errorThrown);
                		}
                    });
                //}
            });
        });*/
        
        $(document).ready(function() {
            
        	$('.dentistMorning-checkbox').change(function() {
                // Get the number of checked checkboxes
                var checkedCount = $('.dentistMorning-checkbox:checked').length;

                // If 5 or more checkboxes are checked, disable the unchecked checkboxes
                if (checkedCount >= 5) {
                    $('.dentistMorning-checkbox:not(:checked)').prop('disabled', true);
                } else {
                    $('.dentistMorning-checkbox').prop('disabled', false);
                }
            });
            
            
            $('.dentistEvening-checkbox').change(function() {
                // Get the number of checked checkboxes
                var checkedCount = $('.dentistEvening-checkbox:checked').length;

                // If 5 or more checkboxes are checked, disable the unchecked checkboxes
                if (checkedCount >= 5) {
                    $('.dentistEvening-checkbox:not(:checked)').prop('disabled', true);
                } else {
                    $('.dentistEvening-checkbox').prop('disabled', false);
                }
            });
        });
    </script>
	
</body>
</html>