package com.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PatientDAO;
import com.dao.impl.PatientDAOImpl;
import com.entities.Patient;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Registration() {
        super();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/authentification/registration.jsp").forward(request, response);
 
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String sexe = request.getParameter("sexe");
		String adresse = request.getParameter("adresse");
		String birthDate = request.getParameter("birthDate");
		String cin = request.getParameter("cin");
		String telephone = request.getParameter("telephone");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");

		PatientDAO patientDAO = new PatientDAOImpl();

		String messageErreur = null;

		if (password == null || password.length() < 8) {
			messageErreur = "Le mot de passe doit contenir au moins 8 caractères !";
		} else if (!password.equals(confirmPassword)) {
			messageErreur = "Le mot de passe et sa confirmation ne correspondent pas !";
		} else if (patientDAO.isExist(email)) {
			messageErreur = "Cette adresse email est déjà utilisée !";
		}

		if (messageErreur != null) {
			request.setAttribute("messageErreur", messageErreur);
			request.getRequestDispatcher("/WEB-INF/authentification/registration.jsp").forward(request, response);
			return;
		}

		String codeOTP = patientDAO.getRandom();

		boolean isSendEmail = patientDAO.sendEmail(email, codeOTP);

		if (isSendEmail) {

			HttpSession session = request.getSession();
			session.setAttribute("codeOTP", codeOTP);

			Patient patient = new Patient(email, password, cin, prenom, nom, birthDate, sexe, telephone, adresse);
			session.setAttribute("patientInfo", patient);

			request.getRequestDispatcher("/WEB-INF/authentification/verificationOTP.jsp").forward(request, response);

		} else {

			messageErreur = "Impossible d'envoyer le code de vérification à cette adresse email. Veuillez réessayer !";
			request.setAttribute("messageErreur", messageErreur);
			request.getRequestDispatcher("/WEB-INF/authentification/registration.jsp").forward(request, response);
		}
	}

}
