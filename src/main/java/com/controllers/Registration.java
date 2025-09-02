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
		
		request.getRequestDispatcher("/WEB-INF/registration.jsp").forward(request, response);
 
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
		
		PatientDAO patientDAO = new PatientDAOImpl();
		boolean isExist = patientDAO.isExist(email);
		
		if(isExist) {
			
			String messageErreur = "Cette adresse email est déjà utilisée !";
			request.setAttribute("messageErreur", messageErreur);
			request.getRequestDispatcher("/WEB-INF/registration.jsp").forward(request, response);
		
		}else {
			
			String codeOTP = patientDAO.getRandom();	
			
			boolean isSendEmail = patientDAO.sendEmail(email, codeOTP);
			
			if (isSendEmail) {
				
				HttpSession session = request.getSession();
				session.setAttribute("codeOTP", codeOTP);
				
				Patient patient = new Patient(email, password, cin, prenom, nom, birthDate, sexe, telephone, adresse);
				session.setAttribute("patientInfo", patient);
				
				request.getRequestDispatcher("/WEB-INF/verificationOTP.jsp").forward(request, response);
			}
			
		}
	}

}
