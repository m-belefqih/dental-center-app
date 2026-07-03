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

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/profile.css"/>

    <!-- JS FILES -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->
</head>

<body class="d-flex">

	<jsp:include page="../sidebar/sidebarAdmin.jsp"></jsp:include>

    <div class="right-section flex-grow-1 d-flex flex-column">
        <!-- navbar -->
        <jsp:include page="../navbar/navbar.jsp"></jsp:include>

        <div class="main flex-grow-1 d-flex flex-column p-4">

            <c:if test="${messageSuccess == 'Yes'}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="fas fa-check-circle me-2"></i>
                    Vos informations ont été mises à jour avec succès.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <c:if test="${messageDanger == 'Yes'}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-triangle me-2"></i>
                    Une erreur est survenue lors de la mise à jour de vos informations. Veuillez réessayer.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <div class="header mb-3">
                <h2>Mon profil</h2>
            </div>

            <div class="profile-card d-flex flex-column">

                <div class="profile-banner d-flex align-items-center p-4">
                    <img src="<%=request.getContextPath()%>/resources/images/profile.png">
                    <div class="identity">
                        <h4>${user.prenom} ${user.nom}</h4>
                        <span class="role-badge"><i class="ri-shield-user-line me-1"></i> Administrateur</span>
                    </div>
                </div>

                <form action="Profile" method="POST" class="profile-form p-4">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="prenom">Prénom</label>
                            <input type="text" class="form-control" id="prenom" name="prenom" value="${user.prenom}" required>
                        </div>
                        <div class="col-md-6">
                            <label for="nom">Nom</label>
                            <input type="text" class="form-control" id="nom" name="nom" value="${user.nom}" required>
                        </div>

                        <div class="col-md-6">
                            <label for="email">Adresse email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
                        </div>
                        <div class="col-md-6">
                            <label for="cin">CIN</label>
                            <input type="text" class="form-control" id="cin" name="cin" value="${user.cin}" required>
                        </div>

                        <div class="col-md-6">
                            <label for="password">Nouveau mot de passe</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="••••••••">
                            <div class="form-text">Laissez ce champ vide pour conserver votre mot de passe actuel.</div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-end mt-4">
                        <button type="submit" class="btn-save">
                            <i class="fas fa-save me-1"></i> Enregistrer les modifications
                        </button>
                    </div>
                </form>

            </div>
        </div>
    </div>

</body>

</html>
