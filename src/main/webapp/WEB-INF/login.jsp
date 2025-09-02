<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DENTAL CENTER</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"><!-- Font Awesome 5.15.4 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- Bootstrap CSS 5.3.3 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->

        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login.css"/>
    </head>
    <body class="d-flex flex-column">
        <div class="header d-flex align-items-center justify-content-between py-5 px-4">          
                <a href="#">
                    <img  class="custom-img" src="<%=request.getContextPath()%>/resources/images/logo-blue.png" alt="DENTAL CENTER"> 
                </a>
                 
                <c:if test="${accountType == 'patient'}">
	                <div class="btn-register d-flex align-items-center">
	                    <p class="mb-0">Vous n'avez pas de compte ?</p>
	                    <a class="btn btn-primary ms-2" href="Registration">Inscrivez-vous</a>
	                </div>
                </c:if>
        </div>
        <div class="main d-flex align-items-center justify-content-center">
            <form class="full-login p-5 d-flex flex-column" action="Login" method="POST">
                <h2 class="mb-3 mx-auto">Connexion</h2>
                <div class="email-password">
                    
                    <div class="mb-4">
                        <label for="InputEmail" class="form-label">E-mail</label>
                        <div class="input-group">  
                            <span class="input-group-text" id="icon-email"><i class="fas fa-envelope"></i></span>
                            <input type="email" name="email" class="form-control border-custom" id="InputEmail" placeholder="Saisir votre mot de passe" required>
                        </div>
                    </div>
               
                    <div class="mb-3">
                        <label for="InputPassword" class="form-label">Mot de passe</label>
                        <div class="input-group">  
                            <span class="input-group-text" id="icon-password"><i class="fas fa-key"></i></span>
                            <input type="password" name="password" class="form-control border-custom" id="InputPassword" placeholder="Saisir votre mot de passe" required>
                            <span class="input-group-text" id="show-password"><i class="far fa-eye"></i></span>
                        </div>
                    </div>

                    <p><a href="#" class="link-primary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Mot de passe oublié ?</a></p>
                </div>
                <button class="btn btn-primary mt-2" type="submit">Se connecter</button>
              
	            <p class="text-danger mt-2">${messageErreur}</p>
                
            </form>
        </div>


        <script>
            // script to toggle the password show hide
            document.addEventListener('DOMContentLoaded', function () {
            var passwordInput = document.getElementById('InputPassword');
            var toggleIcon = document.getElementById('show-password').querySelector('i');

            document.getElementById('show-password').addEventListener('click', function () {
                var type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                toggleIcon.classList.toggle('fa-eye');
                toggleIcon.classList.toggle('fa-eye-slash');
            });
        });
        </script>
    </body>
</html>