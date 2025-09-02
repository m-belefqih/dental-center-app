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
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/accueil.css"/>
    
</head>

<body>

    <nav>
        <div class="logo">
            <img src="<%=request.getContextPath()%>/resources/images/logo-white.png">
        </div>
        <ul>
            <li>Accueil</li>
            <li><a href="#service">Service</a></li>
            <li><a href="#feedback">Avis</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
        <form action="espace-page.jsp">
     		<button>Se connecter</button>
        </form>
        <button id="menuButton" onclick="openMenu()">
            <i class='bx bx-menu'></i>
        </button>
    </nav>

    <div class="main" id="main">
        <div class="left">
             
            <h3>Un <span>centre dentaire</span> en qui vous pouvez avoir confiance</h3>

            <p>
                Chez DENTAL CENTER, nous nous engageons à vous fournir des soins dentaires exceptionnels. 
                Venez découvrir notre centre moderne et notre équipe dévouée. Réservez votre consultation aujourd'hui.
            </p>
            <form action="espace-page.jsp">
            	<button>Prendre un rendez-vous</button>
            </form>
        </div>
        <div class="right">
            <img src="<%=request.getContextPath()%>/resources/images/image-dentistes.png">
        </div>
    </div>

	<!-- service -->
    <div class="skills" id="service">
        <h5>Nos Services</h5>
        <h3>Ce que nous proposons</h3>
        <div class="skill-items">
            <div class="item">
                <div class="icon"><i class='bx bx-user'></i></div>
                <h4>Consultation Dentaire</h4>
                <p>
                    Bénéficiez d’un diagnostic complet et de conseils personnalisés pour votre santé bucco-dentaire avec nos spécialistes expérimentés.
                </p>
            </div>
            <div class="item">
                <div class="icon"><i class='bx bx-brightness'></i></div>
                <h4>Détartrage & Blanchiment</h4>
                <p>
                    Redonnez éclat et santé à votre sourire grâce à nos soins de détartrage et de blanchiment professionnels.
                </p>
            </div>
            <div class="item">
                <div class="icon"><i class='bx bx-smile'></i></div>
                <h4>Orthodontie</h4>
                <p>
                    Corrigez l’alignement de vos dents avec des solutions modernes et discrètes adaptées à tous les âges.
                </p>
            </div>
            <div class="item">
                <div class="icon"><i class='bx bx-plus-medical'></i></div>
                <h4>Implants & Prothèses</h4>
                <p>
                    Retrouvez une fonction masticatoire optimale et un sourire naturel grâce à nos implants et prothèses de haute qualité.
                </p>
            </div>
        </div>
    </div>

	<!-- feedback -->
    <div class="feedback" id="feedback">
        <h5>Avis des clients</h5>
        <h3>Retours de nos patients</h3>
        <div class="customers">
            <div class="item">
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                </div>
                <p>
                    J’ai été impressionné par le professionnalisme de toute l’équipe. Les soins sont de grande qualité et l’accueil est chaleureux.
                </p>
                <div class="user">
                    <img src="<%=request.getContextPath()%>/resources/images/us-1.jpg">
                    <div class="info">
                        <h5>Ismail El Aloui</h5>
                        <p>Enseignante</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                </div>
                <p>
                    Un centre moderne, propre et une équipe à l’écoute. Je recommande vivement DENTAL CENTER pour leur expertise et leur gentillesse.
                </p>
                <div class="user">
                    <img src="<%=request.getContextPath()%>/resources/images/us-2.jpg">
                    <div class="info">
                        <h5>Youssef Bennani</h5>
                        <p>Ingénieur</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="rating">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                </div>
                <p>
                    Grâce à DENTAL CENTER, j’ai retrouvé le sourire ! Merci pour votre gentillesse et votre efficacité.
                </p>
                <div class="user">
                    <img src="<%=request.getContextPath()%>/resources/images/us-3.jpg">
                    <div class="info">
                        <h5>Ahmed Zahri</h5>
                        <p>Médecin</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- contact -->
    <footer id="contact">
        <div class="top">
            <div class="logo">
                <img src="<%=request.getContextPath()%>/resources/images/logo-white.png">
            </div>
            <div class="social-links">
                <a href="#"><i class='bx bxl-facebook'></i></a>
                <a href="#"><i class='bx bxl-instagram'></i></a>
                <a href="#"><i class='bx bxl-twitter'></i></a>
                <a href="#"><i class='bx bxl-linkedin-square'></i></a>
            </div>
        </div>
        <div class="separator"></div>
        <div class="bottom">
            <p>
                Made With ❤️ By Belefqih
            </p>
            <div class="links">
                <a href="#">Privacy Policy</a>
                <a href="#">Terms of Service</a>
                <a href="#">Cookies Setting</a>
            </div>
        </div>
    </footer>

</body>

</html>