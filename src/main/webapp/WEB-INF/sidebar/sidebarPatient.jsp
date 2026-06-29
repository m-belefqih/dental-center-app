<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     
<!-- siderbar patient  -->
<div class="left-section d-flex flex-column align-items-center justify-content-between p-4">
	<div class="sidebar d-flex flex-column">
		<a href="index.jsp" >
			<img class="logo-img mx-auto mb-5 w-100" src="<%=request.getContextPath()%>/resources/images/logo-white.png" alt="DENTAL CENTER">
		</a>
		<div class="item">
			<a href="#" class="d-flex align-items-center"> 
				<i class="ri-home-4-line"></i>
				<h3>Accueil</h3>
			</a>
		</div>
		<div class="item">
			<a href="#" class="d-flex align-items-center"> 
				<i class="ri-id-card-line"></i>
				<h3>Mon dossier</h3>
			</a>
		</div>
		<div class="item">
			<a href="/dental-center-app/NouveauRDV" class="d-flex align-items-center"> 
				<i class="ri-add-box-line"></i>
				<h3>Nouveau RDV</h3>
			</a>
		</div>
		<div class="item">
        	<a href="#" class="d-flex align-items-center"> 
            	<i class="ri-history-line"></i>
                <h3>Mon historique</h3>
        	</a>
        </div>
		<div class="item">
			<a href="Contact" class="d-flex align-items-center"> 
				<i class="ri-mail-line"></i>
				<h3>Contact</h3>
			</a>
		</div>
		<div class="item">
			<a href="FAQ" class="d-flex align-items-center"> 
				<i class="ri-question-line"></i>
				<h3>F.A.Q</h3>
			</a>
		</div>
	</div>
	
	<div class="sign-out">
		<a href="Logout" onclick="openLogoutModal(event)" class="d-flex align-items-center">
			<i class="ri-logout-box-r-line"></i>
			<h3>Se déconnecter</h3>
		</a>
	</div>
</div>

<jsp:include page="logoutModal.jsp"></jsp:include>
   

   
  