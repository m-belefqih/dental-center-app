<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.min.css"> <!-- REMIX ICON -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'> <!-- Boxicons -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dashboard.css"/>
    <title>DENTAL CENTER</title>
</head>

<body>
	
	<jsp:include page="sidebarAdmin.jsp"></jsp:include>

    <div class="right-section">
        <div class="navbar">
            <div class="title-welcome">
                <h2><span>Bonjour</span> Admin,</h2>
            </div>
            <div class="iconsBtns-and-profile">
                <div class="icons-btns">
                    <i class="ri-notification-3-line"></i>
                    <i class="ri-message-3-line"></i>
                </div>
                <div class="profile">
                    <div class="info">
                        <img src="<%=request.getContextPath()%>/resources/images/profile.png" alt="PHOTO PROFILE">
                        <div class="account">
                            <a href="Profile"><h5>${user.prenom} ${user.nom}</h5></a>
                            <p>Administrateur</p>
                        </div>
                    </div>
                    <i class="ri-arrow-down-s-line"></i>
                </div>
            </div>
        </div>

        <div class="main">

            <h3 class="header">
                Tableau de bord
            </h3>

            <ul class="insights">  
                <li>
                    <i class='bx bx-calendar' ></i>
                    <span class="info">
                        <h3>
                            1 Janvier 2024
                        </h3>
                        <p>Date / Heure</p>
                    </span>
                </li>
                <li>
                    <i class='bx bxs-user'></i>
                    <span class="info">
                        <h3>
                            127 Patients
                        </h3>
                        <p>Nombre de patients</p>
                    </span>
                </li>
                <li>
                    <i class='bx bx-task'></i>
                    <span class="info">
                        <h3>
                            5 RDV
                        </h3>
                        <p>Rendez-vous du jour</p>
                    </span>
                </li>
                <li>
                    <i class='bx bx-line-chart'></i>
                    <span class="info">
                        <h3>
                            $6,742
                        </h3>
                        <p>Chiffre d'affaires</p>
                    </span>
                </li>
            </ul>  
             
            <div class="charts">
                <div class="chart-bar">
                    <h2></h2>
                </div> 
                
                <div class="chart-doughnut">
                    <h3></h3>
                </div>

            </div>
       
        </div>
      
    </div>

    <!-- <script src="script.js"></script> -->
     
</body>

</html>