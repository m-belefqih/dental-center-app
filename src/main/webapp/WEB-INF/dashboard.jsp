<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DENTAL CENTER</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.min.css"> <!-- REMIX ICON -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'> <!-- Boxicons -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/dashboard.css"/>
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/dashboard.js"></script>
     
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
                            6 Juillet 2024
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
                            6,742 DH
                        </h3>
                        <p>Chiffre d'affaires</p>
                    </span>
                </li>
            </ul>  
             
            <div class="charts">
                <div class="chart-bar">
                    <div id="donutbar" style="width: 770px; height: 340px;"></div>
                </div> 
                
                <div class="chart-doughnut">
                    <div id="donutchart" style="width: 420px; height: 340px;"></div>
                </div>
            </div>
       	
        </div>
      
    </div> 
</body>


    <script type="text/javascript">
        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
	                ['Homme', ${nbrHomme}],
	                ['Femme', ${nbrFemme}]                
            ]);

            var options = {
                title: 'Pourcentage dhommes et de femmes',
                pieHole: 0.4,
                slices: {
                    0: { textStyle: { color: '#000000', bold: true } },  
                    1: { textStyle: { color: '#000000', bold: true } }   
                },
                colors: ['#3cbaf4', '#ffbbd0'],
                legend: { position: 'right' },
                chartArea: {
                    left: 50,  
                    top: 50,   
                    width: '100%', 
                    height: '1000%' 
                }
            };

            var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
            chart.draw(data, options);
        }
    </script>

    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Month', 'Value'],
                ['January', 200],
                ['February', 150],
                ['March', 220],
                ['April', 180],
                ['May', 240],
                ['June', 230],
                ['July', 90],
                ['August', 0],
                ['September', 0],
                ['October', 0],
                ['November', 0],
                ['December', 0]
            ]);

            var options = {
                title: 'Statistiques de rendez-vous',
                hAxis: { title: 'Month' },
                vAxis: { title: 'Rendez-vous' },
                legend: { position: 'none' },
                colors: ['#1976D2'],  
                bar: { groupWidth: '75%' },
                chartArea: {
                    width: '80%',
                    height: '70%'
                }
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('donutbar'));
            chart.draw(data, options);
        }
    </script>

</html>