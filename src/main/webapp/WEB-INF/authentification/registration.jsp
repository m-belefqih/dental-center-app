<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DENTAL CENTER</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- Bootstrap CSS 5.3.3 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->

        <script src="<%=request.getContextPath()%>/resources/js/sweetalert2.all.min.js"></script> <!-- SweetAlert2 (local) -->

        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/registration.css"/>
    </head>
    <body class="d-flex flex-column">
        
        <div class="header d-flex align-items-center justify-content-between py-5 px-4">          
                <a href="#">
                    <img  class="img-custom" src="<%=request.getContextPath()%>/resources/images/logo-blue.png" alt="LOGO OF DENTAL CENTER"> 
                </a>
                <form class="btn-login d-flex align-items-center" action="Login" method="GET">
                    <p class="mb-0">Vous avez déjà un compte ?</p>
                    <button class="btn btn-primary ms-2" type="submit" name="accountType" value="patient">Connectez-vous</button>
                </form>
        </div>

        <div class="main d-flex align-items-center justify-content-center">
            
            <form id="registrationForm" class="full-register d-flex flex-column py-4 px-5" action="Registration" method="POST">
                
                <h2 class="mb-4 mx-auto">Inscription</h2>
                 
                <div class="register-info">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="InputPrenom" class="form-label">Prénom <span>*</span></label> 
                                <input type="text" name="prenom" value="${param.prenom}" class="form-control form-control-sm border-custom" id="InputPrenom" placeholder="Jhon" required>
                            </div>
                            <div class="mb-3">
                                <label for="InputNom" class="form-label">Nom <span>*</span></label> 
                                <input type="text" name="nom" value="${param.nom}" class="form-control form-control-sm border-custom" id="InputNom" placeholder="Doe" required>
                            </div>
                            <div class="mb-3">
                                <label for="InputSexe" class="form-label">Sexe <span>*</span></label> 
                                <select class="form-select form-select-sm border-custom" name="sexe" id="InputSexe" required>
                                    <option value="">Sélectionnez votre sexe</option>
                                      <option value="Homme" ${param.sexe == 'Homme' ? 'selected' : ''}>Homme</option>
                                      <option value="Femme" ${param.sexe == 'Femme' ? 'selected' : ''}>Femme</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="InputDateNaissance" class="form-label">Date de naissance <span>*</span></label> 
                                <input type="date" name="birthDate" value="${param.birthDate}" class="form-control form-control-sm border-custom" id="InputDateNaissance" required>
                            </div>
                            <div class="mb-3">
                                <label for="InputAdresse" class="col-form-label">Adresse <span>*</span></label>
                                <textarea name="adresse" class="form-control form-control-sm border-custom" id="InputAdresse" placeholder="123 Rue Exemple" required>${param.adresse}</textarea>
                            </div>
                             
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="InputCIN" class="form-label">CIN <span>*</span></label> 
                                <input type="text" name="cin" value="${param.cin}" class="form-control form-control-sm border-custom" id="InputCIN" placeholder="Carte d'identité nationale" required>
                            </div> 
                            <div class="mb-3">
                                <label for="InputTelephone" class="form-label">Téléphone <span>*</span></label> 
                                <input type="text" name="telephone" value="${param.telephone}" class="form-control form-control-sm border-custom" id="InputTelephone" placeholder="Numéro de téléphone" required>
                            </div>
                            <div class="mb-3">
                                <label for="InputEmail" class="form-label">E-mail <span>*</span></label> 
                                <input type="email" name="email" value="${param.email}" class="form-control form-control-sm border-custom" id="InputEmail" placeholder="jhon@exemple.com" required>
                            </div>
                            <div class="mb-3">
                                <label for="InputPassword" class="form-label">Mot de passe <span>*</span></label>
                                <input type="password" name="password" class="form-control form-control-sm border-custom" id="InputPassword" placeholder="8 caractères minimum" minlength="8" required>
                            </div>
                            <div class="mb-3">
                                <label for="InputConfirmPassword" class="form-label">Confirmation mot de passe <span>*</span></label>
                                <input type="password" name="confirmPassword" class="form-control form-control-sm border-custom" id="InputConfirmPassword" minlength="8" required>
                            </div>
                        </div>   
                    </div>
                </div>

                <button class="btn btn-primary mt-2" type="submit">S'inscrire</button>

            </form>
        </div>

        <script>
            // Vérification côté client : le mot de passe et sa confirmation doivent être identiques
            document.getElementById("registrationForm").addEventListener("submit", function (event) {
                const password = document.getElementById("InputPassword").value;
                const confirmPassword = document.getElementById("InputConfirmPassword").value;

                if (password !== confirmPassword) {
                    event.preventDefault();
                    Swal.fire({
                        icon: "error",
                        title: "Erreur",
                        text: "Le mot de passe et sa confirmation ne correspondent pas !",
                        confirmButtonColor: "#0d6efd"
                    });
                }
            });
        </script>

        <c:if test="${not empty messageErreur}">
            <script>
                // Erreur renvoyée par le serveur (email déjà utilisé, envoi OTP échoué, ...)
                Swal.fire({
                    icon: "error",
                    title: "Erreur",
                    text: "${messageErreur}",
                    confirmButtonColor: "#0d6efd"
                });
            </script>
        </c:if>
    </body>
</html>