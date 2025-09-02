<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DENTAL CENTER</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- Bootstrap CSS 5.3.3 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->
        
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/espace-page.css"/>
    </head>
    <body>
        <div class="main d-flex align-items-center justify-content-center">
            <form class="container-space d-flex flex-column p-5" action="Login" method="GET">
                <h2 class="mb-5 mx-auto">Bienvenue dans votre espace !</h2>

                <button class="btn btn-primary btn-lg mb-4" type="submit" name="accountType" value="patient">Espace du patient</button>

                <button class="btn btn-primary btn-lg mb-4" type="submit" name="accountType" value="dentiste">Espace du chirurgien-dentiste</button>
                
                <button class="btn btn-primary btn-lg" type="submit" name="accountType" value="admin">Espace de l'administrateur</button>
            </form>
        </div>
    </body>
</html>