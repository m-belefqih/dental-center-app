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
		
		if (codeOTP.equals(code)) {
			
			Patient patient = (Patient) session.getAttribute("patientInfo");
			
			PatientDAO patientDAO = new PatientDAOImpl();
			boolean isRegistered = patientDAO.register(patient); 
			
			if(isRegistered) {
				System.out.println("Registration successful!");
				
				session.setAttribute("user", patient);
		 
				request.getRequestDispatcher("/WEB-INF/profilePatient.jsp").forward(request, response);
			}
			
		}else {
			String messageErreur = "Le code de vérification que vous avez saisi est incorrect !";
			request.setAttribute("messageErreur", messageErreur);
			
			request.getRequestDispatcher("/WEB-INF/verificationOTP.jsp").forward(request, response);
		}
	}

}
