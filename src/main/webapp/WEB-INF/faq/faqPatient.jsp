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

	<!-- siderbar patient  -->
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

            <div class="content-main d-flex flex-column p-4">

                <div class="faq-header text-center">
                    <img src="<%=request.getContextPath()%>/resources/images/FAQ.jpg" alt="FAQ Image" class="faq-image mb-3">
                </div>

                <!-- FAQ sections -->
                <div class="faq-container">

                	<h2 class="faq-title mb-2">Rendez-vous</h2>

                    <section class="faq-section">
                        <p class="faq-question"><strong>Comment puis-je prendre un rendez-vous ?</strong></p>
                        <p class="faq-answer">Cliquez sur "Nouveau RDV" dans le menu à gauche, choisissez la date qui vous convient, sélectionnez un dentiste disponible et le créneau horaire (matin ou après-midi), indiquez le motif de votre visite puis confirmez. Votre rendez-vous apparaîtra ensuite dans "Mon historique".</p>
                    </section>

                    <section class="faq-section">
                        <p class="faq-question"><strong>Comment puis-je consulter mon prochain rendez-vous ?</strong></p>
                        <p class="faq-answer">Votre prochain rendez-vous est affiché directement sur votre page d'accueil, avec la date, l'horaire et le nom du dentiste. Vous pouvez aussi consulter la liste complète de vos rendez-vous dans "Mon historique".</p>
                    </section>

                    <section class="faq-section">
                        <p class="faq-question"><strong>Que signifient les statuts de mes rendez-vous ?</strong></p>
                        <p class="faq-answer">Dans "Mon historique", chaque rendez-vous a un statut : <strong>Effectué</strong> (le rendez-vous est passé), <strong>Aujourd'hui</strong> (le rendez-vous a lieu aujourd'hui) et <strong>À venir</strong> (le rendez-vous est prévu à une date future).</p>
                    </section>

                    <section class="faq-section mb-2">
                        <p class="faq-question"><strong>Comment puis-je annuler ou déplacer un rendez-vous ?</strong></p>
                        <p class="faq-answer">L'annulation ou le déplacement d'un rendez-vous n'est pas encore possible depuis l'application. Veuillez contacter le cabinet via la page "Contact" ou par téléphone, et nous nous en occuperons.</p>
                    </section>

                    <hr>

                    <h2 class="faq-title mb-2">Dossier médical</h2>

                    <section class="faq-section">
                        <p class="faq-question"><strong>Que contient mon dossier médical ?</strong></p>
                        <p class="faq-answer">Votre dossier médical, accessible via "Mon dossier", regroupe l'ensemble de vos consultations : le motif de chaque rendez-vous, les actes réalisés, les examens radiologiques effectués et les traitements prescrits.</p>
                    </section>

                    <section class="faq-section mb-2">
                        <p class="faq-question"><strong>Qui remplit mon dossier médical ?</strong></p>
                        <p class="faq-answer">C'est votre dentiste qui complète votre dossier médical après chaque consultation. Vous ne pouvez pas le modifier vous-même, mais vous pouvez le consulter à tout moment.</p>
                    </section>

                    <hr>

                    <h2 class="faq-title mb-2">Mon compte</h2>

                    <section class="faq-section">
                        <p class="faq-question"><strong>Comment puis-je modifier mes informations personnelles ?</strong></p>
                        <p class="faq-answer">Cliquez sur votre nom en haut à droite de la page pour accéder à votre profil. Vous pourrez y consulter et mettre à jour vos informations personnelles.</p>
                    </section>

                    <section class="faq-section mb-2">
                        <p class="faq-question"><strong>Je n'ai pas reçu le code de vérification lors de l'inscription, que faire ?</strong></p>
                        <p class="faq-answer">Le code de vérification (OTP) est envoyé à l'adresse email fournie lors de l'inscription. Vérifiez votre dossier spam ou courrier indésirable. Si vous ne le recevez toujours pas, recommencez l'inscription en vérifiant que votre adresse email est correcte.</p>
                    </section>

                    <hr>

                    <h2 class="faq-title mb-2">Contact</h2>

                    <section class="faq-section">
                        <p class="faq-question"><strong>Comment puis-je contacter le cabinet ?</strong></p>
                        <p class="faq-answer">Utilisez la page "Contact" accessible depuis le menu à gauche. Remplissez le formulaire avec l'objet et le contenu de votre message puis cliquez sur "Envoyer". Nous vous répondrons dans les plus brefs délais.</p>
                    </section>

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
