<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Navbar commune : l'image de profil et le rôle sont choisis selon le type de compte (et le sexe) -->
<div class="myNavbar d-flex align-items-center justify-content-end p-4">

    <div class="iconsBtns-and-profile d-flex align-items-center justify-content-between">
        <div class="icons-btns d-flex">
            <i class="ri-notification-3-line"></i>
            <i class="ri-message-3-line"></i>
        </div>
        <div class="profile d-flex align-items-center justify-content-between">
            <div class="info d-flex align-items-center">
                <c:choose>
                    <c:when test="${accountType == 'admin'}">
                        <img src="<%=request.getContextPath()%>/resources/images/profile.png">
                    </c:when>
                    <c:when test="${accountType == 'dentiste'}">
                        <c:choose>
                            <c:when test="${user.sexe == 'Femme'}">
                                <img src="<%=request.getContextPath()%>/resources/images/profile-dentist-women.jpg">
                            </c:when>
                            <c:otherwise>
                                <img src="<%=request.getContextPath()%>/resources/images/profile-dentist-men.png">
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:when test="${accountType == 'patient'}">
                        <c:choose>
                            <c:when test="${user.sexe == 'Femme'}">
                                <img src="<%=request.getContextPath()%>/resources/images/women.png">
                            </c:when>
                            <c:otherwise>
                                <img src="<%=request.getContextPath()%>/resources/images/men.png">
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                </c:choose>
                <div class="account">
                    <a href="Profile"><h5>${user.prenom} ${user.nom}</h5></a>
                    <c:choose>
                        <c:when test="${accountType == 'admin'}">
                            <p>Administrateur</p>
                        </c:when>
                        <c:when test="${accountType == 'dentiste'}">
                            <p>Dentiste</p>
                        </c:when>
                        <c:when test="${accountType == 'patient'}">
                            <p>Patient</p>
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <i class="ri-arrow-down-s-line"></i>
        </div>
    </div>
</div>
