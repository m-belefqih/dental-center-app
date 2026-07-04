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

 
@WebServlet("/VerificationOTP")
public class VerificationOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public VerificationOTP() {
        super();
    
    }

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String code = request.getParameter("code");

		HttpSession session = request.getSession();
		String codeOTP = (String) session.getAttribute("codeOTP");
		Patient patient = (Patient) session.getAttribute("patientInfo");

		// Session expirée ou accès direct sans passer par l'inscription
		if (codeOTP == null || patient == null) {
			response.sendRedirect("Registration");
			return;
		}

		if (codeOTP.equals(code)) {

			PatientDAO patientDAO = new PatientDAOImpl();
			boolean isRegistered = patientDAO.register(patient);

			if(isRegistered) {
				System.out.println("Registration successful!");

				// Recharger le patient depuis la base pour récupérer son id généré
				Patient registeredPatient = patientDAO.checkLogin(patient.getEmail(), patient.getPassword());

				session.removeAttribute("codeOTP");
				session.removeAttribute("patientInfo");
				session.setAttribute("user", registeredPatient != null ? registeredPatient : patient);

				request.setAttribute("registrationSuccess", true);
				request.getRequestDispatcher("/WEB-INF/authentification/verificationOTP.jsp").forward(request, response);

			}else {
				String messageErreur = "Une erreur est survenue lors de la création de votre compte. Veuillez réessayer !";
				request.setAttribute("messageErreur", messageErreur);

				request.getRequestDispatcher("/WEB-INF/authentification/verificationOTP.jsp").forward(request, response);
			}

		}else {
			String messageErreur = "Le code de vérification que vous avez saisi est incorrect !";
			request.setAttribute("messageErreur", messageErreur);

			request.getRequestDispatcher("/WEB-INF/authentification/verificationOTP.jsp").forward(request, response);
		}
	}

}
