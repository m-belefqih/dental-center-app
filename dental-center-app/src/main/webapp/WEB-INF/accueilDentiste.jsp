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
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/accueilDentiste.css"/>
    
    <!-- JS FILES -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>  <!-- New version of jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS 5.3.3 -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> <!-- AngularJS library -->
     
    <%-- <script src="<%=request.getContextPath()%>/resources/js/listePatients.js"></script> --%>
 
</head>

<body class="d-flex">
     
	<jsp:include page="sidebarDentiste.jsp"></jsp:include>

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
                            <c:when test="${user.prenom == 'Asmae'}">
                           		<img src="<%=request.getContextPath()%>/resources/images/profile-dentist-women.jpg">
                            </c:when>
                            <c:otherwise> 
                            	<img src="<%=request.getContextPath()%>/resources/images/profile-dentist-men.png">
                            </c:otherwise>
                        </c:choose>
                        
                        <div class="account">
                            <a href="Profile"><h5>${user.prenom} ${user.nom}</h5></a>
                            <p>Dentiste</p>
                        </div>
                    </div>
                    <i class="ri-arrow-down-s-line"></i>
                </div>
            </div>
        </div>   

        <div class="main flex-grow-1 d-flex flex-column p-4">
            <div class="header">
                <h2>Page d'accueil</h2>  
            </div>    
        </div>
    </div>

</body>

</html>