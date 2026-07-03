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

	<!-- siderbar dentiste  -->
    <jsp:include page="../sidebar/sidebarDentiste.jsp"></jsp:include>

    <div class="right-section flex-grow-1 d-flex flex-column">
        <!-- navbar -->
        <jsp:include page="../navbar/navbar.jsp"></jsp:include>

        <div class="main flex-grow-1 d-flex flex-column p-4">

            <div class="content-main d-flex flex-column p-4">

                <div class="faq-header text-center">
                    <img src="<%=request.getContextPath()%>/resources/images/FAQ.jpg" alt="FAQ Image" class="faq-image mb-3">
                </div>

                <!-- FAQ sections -->
                <div class="faq-container">

                	<h2 class="faq-title mb-2">Mes rendez-vous</h2>

                    <section class="faq-section">
                        <p class="faq-question"><strong>Où puis-je consulter mes rendez-vous ?</strong></p>
                        <p class="faq-answer">Cliquez sur "Mes rendez-vous" dans le menu à gauche. Vous y trouverez la liste de tous vos rendez-vous avec la date, l'horaire, le patient concerné, son téléphone et le motif de la consultation. Le nombre de rendez-vous du jour et à venir est également affiché en haut de la page.</p>
                    </section>

                    <section class="faq-section">
                        <p class="faq-question"><strong>Comment puis-je voir les rendez-vous d'une journée précise ?</strong></p>
                        <p class="faq-answer">Dans la page "Mes rendez-vous", sélectionnez une date dans le champ prévu en haut de la table puis cliquez sur "Rechercher". Cliquez sur "Tout afficher" pour revenir à la liste complète.</p>
                    </section>

                    <section class="faq-section mb-2">
                        <p class="faq-question"><strong>Que signifient les statuts des rendez-vous ?</strong></p>
                        <p class="faq-answer">Chaque rendez-vous a un statut : <strong>Effectué</strong> (le rendez-vous est passé), <strong>Aujourd'hui</strong> (le rendez-vous a lieu aujourd'hui) et <strong>À venir</strong> (le rendez-vous est prévu à une date future).</p>
                    </section>

                    <hr>

                    <h2 class="faq-title mb-2">Planification</h2>

                    <section class="faq-section mb-2">
                        <p class="faq-question"><strong>Qui définit mes jours et horaires de travail ?</strong></p>
                        <p class="faq-answer">C'est l'administrateur du cabinet qui établit la planification : pour chaque journée, il affecte les dentistes aux créneaux du matin (8h00 - 12h00) et de l'après-midi (14h00 - 18h00). Les patients ne peuvent prendre rendez-vous avec vous que sur les créneaux où vous êtes planifié. Pour toute modification de vos disponibilités, contactez l'administrateur.</p>
                    </section>

                    <hr>

                    <h2 class="faq-title mb-2">Dossier médical</h2>

                    <section class="faq-section">
                        <p class="faq-question"><strong>Comment puis-je remplir le dossier médical d'un patient après une consultation ?</strong></p>
                        <p class="faq-answer">Ouvrez le dossier du patient en cliquant sur l'icône dossier, soit depuis la page "Mes rendez-vous" (colonne "Dossier médical"), soit depuis la "Liste des patients". Renseignez ensuite pour chaque rendez-vous les actes réalisés, les examens radiologiques et les traitements prescrits, puis cliquez sur "Enregistrer".</p>
                    </section>

                    <section class="faq-section mb-2">
                        <p class="faq-question"><strong>Le patient peut-il voir ce que j'écris dans son dossier ?</strong></p>
                        <p class="faq-answer">Oui. Le patient peut consulter son dossier médical depuis son espace personnel (motifs, actes, examens radio et traitements), mais il ne peut pas le modifier : vous seul complétez le dossier.</p>
                    </section>

                    <hr>

                    <h2 class="faq-title mb-2">Gestion des patients</h2>

                    <section class="faq-section">
                        <p class="faq-question"><strong>Comment puis-je consulter la liste des patients ?</strong></p>
                        <p class="faq-answer">Cliquez sur "Liste des patients" dans le menu à gauche. Vous pouvez rechercher un patient grâce au champ "Chercher" et accéder à son dossier médical via l'icône dossier dans la colonne "Actions".</p>
                    </section>

                    <section class="faq-section mb-2">
                        <p class="faq-question"><strong>Comment puis-je ajouter un patient ?</strong></p>
                        <p class="faq-answer">Dans la page "Liste des patients", cliquez sur le bouton "Ajouter un patient", remplissez le formulaire avec les informations du patient puis cliquez sur "Enregistrer".</p>
                    </section>

                    <hr>

                    <h2 class="faq-title mb-2">Mon compte</h2>

                    <section class="faq-section">
                        <p class="faq-question"><strong>Comment puis-je modifier mes informations personnelles ?</strong></p>
                        <p class="faq-answer">Cliquez sur votre nom en haut à droite de la page pour accéder à votre profil. Vous pourrez y consulter et mettre à jour vos informations personnelles.</p>
                    </section>

                    <section class="faq-section">
                        <p class="faq-question"><strong>Comment puis-je signaler une erreur sur le site ?</strong></p>
                        <p class="faq-answer">Signalez toute erreur à l'administrateur du cabinet. Nous ferons de notre mieux pour la corriger dès que possible.</p>
                    </section>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
