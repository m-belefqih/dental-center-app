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

        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/verificationOTP.css"/>
    </head>
    <body>
        <div class="main d-flex align-items-center justify-content-center">
            <form class="container-verification d-flex flex-column p-5" action="VerificationOTP" method="POST">
                
                <h2 class="mb-4 mx-auto">Vérifier l'adresse e-mail</h2>

                <div class="alert alert-success text-center" role="alert" >
                    Pour vérifier votre e-mail, nous avons envoyé un mot de passe à usage unique (OTP) à ${patientInfo.email}
                </div>
                
                <p class="text-danger">${messageErreur}</p>

                <div class="mb-3">
                    <input type="text" name="code" class="form-control form-control-lg border-custom" placeholder="Entrez le code de vérificatoin" required>
                </div>
                
                <button class="btn btn-primary btn-lg" type="submit" name="admin">Vérifier</button>
                
            </form>
        </div>
    </body>
</html>