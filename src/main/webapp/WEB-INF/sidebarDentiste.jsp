<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     
<!-- siderbar dentiste  -->
<div class="left-section d-flex flex-column align-items-center justify-content-between p-4">
	<div class="sidebar d-flex flex-column">
		<img class="logo-img mx-auto mb-5 w-100" src="<%=request.getContextPath()%>/resources/images/logo-white.png" alt="DENTAL CENTER">
		<div class="item">
			<a href="#" class="d-flex align-items-center"> 
				<i class="ri-dashboard-line"></i>
				<h3>Accueil</h3>
			</a>
		</div>
		<div class="item">
			<a href="#" class="d-flex align-items-center"> 
				<i class="ri-list-check-3"></i>
				<h3>Mes rendez-vous</h3>
			</a>
		</div>
		<div class="item">
			<a href="/dental-center-app/ListePatients" class="d-flex align-items-center"> 
				<i class="ri-user-3-line"></i>
				<h3>Liste des patients</h3>
			</a>
		</div>
		<div class="item">
			<a href="#" class="d-flex align-items-center"> 
				<i class="ri-question-line"></i>
				<h3>F.A.Q</h3>
			</a>
		</div>
	</div>
	
	<div class="sign-out">
		<a href="Logout" class="d-flex align-items-center"> 
			<i class="ri-logout-box-r-line"></i>
			<h3>Se déconnecter</h3>
		</a>
	</div>
</div>
   

   
  