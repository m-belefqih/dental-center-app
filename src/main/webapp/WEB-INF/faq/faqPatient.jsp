<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>DENTAL CENTER</title>
	
	<!-- CSS FILES -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.min.css">  <!-- REMIX ICON -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">  <!-- Font Awesome 5.15.4 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">   <!-- Bootstrap CSS 5.3.3 -->
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/faq.css"/>
	
	<!-- JS FILES -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>  <!-- New version of jQuery library -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>  <!-- Bootstrap JS 5.3.3 -->
		
</head>
<body class="d-flex">

	<!-- siderbar admin  -->
    <jsp:include page="../sidebar/sidebarPatient.jsp"></jsp:include>

    <div class="right-section flex-grow-1 d-flex flex-column">
        <div class="myNavbar d-flex align-items-center justify-content-end p-4">
            
            <div class="iconsBtns-and-profile d-flex align-items-center justify-content-between">
                <div class="icons-btns d-flex">
                    <i class="ri-notification-3-line"></i>
                    <i class="ri-message-3-line"></i>
                </div>
                <div class="profile d-flex align-items-center justify-content-between">
                    <div class="info d-flex align-items-center">
                        <img src="<%=request.getContextPath()%>/resources/images/men.png">
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
        
            <div class="content-main d-flex flex-column p-4">
            
                <div class="faq-header text-center">
                    <img src="<%=request.getContextPath()%>/resources/images/FAQ.jpg" alt="FAQ Image" class="faq-image mb-3">
                </div>
                
                <!-- FAQ sections -->
                <div class="faq-container">
                	
                	<h2 class="faq-title mb-2">Gestion des test</h2>
                    
                    <section class="faq-section">
                        <p class="faq-question"><strong>Comment puis-je ajouter un patient ?</strong></p>
                        <p class="faq-answer">Pour ajouter un patient, cliquer sur le bouton "Ajouter un patient" dans le menu principal de l'application de gestion des patients. Remplissez le formulaire avec les informations du patient et cliquer sur "Enregistrer".</p>
                    </section>
						
                    <section class="faq-section mb-2">
                        <p class="faq-question"><strong>Comment puis-je éditer ou supprimer un enregistremenet de patient ?</strong></p>
                        <p class="faq-answer">Pour éditer un enregistrement de patient, cliquez sur le bouton "Editer" à côté de l'enregistrement dans la table "Liste de patients". Pour supprimer un enregistrement, cliquez sur le bouton "Supprimer".</p>
                    </section>

                    <hr>
                    
                    <h2 class="faq-title mb-2">Signaler une erreur</h2>
                    
                    <section class="faq-section">
                        <p class="faq-question"><strong>Comment puis-je signaler une erreur sur le site ?</strong></p>
                        <p class="faq-answer">Pour signaler une erreur sur le site, utilisez le formulaire de contact disponible dans le menu principal. Remplissez le formulaire avec les détails de l'erreur et cliquez sur "Envoyer". Nous ferons de notre mieux pour corriger l'erreur dès que possible.</p>
                    </section>
                </div>
            </div>
        </div>    
    </div>
</body>
</html>