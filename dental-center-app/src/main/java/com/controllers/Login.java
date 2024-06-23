package com.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDAO;
import com.dao.DentisteDAO;
import com.dao.PatientDAO;
import com.dao.impl.AdminDAOImpl;
import com.dao.impl.DentisteDAOImpl;
import com.dao.impl.PatientDAOImpl;
import com.entities.Admin;
import com.entities.Dentiste;
import com.entities.Patient;
 
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public Login() {
        super();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accountType = request.getParameter("accountType");
        
        HttpSession session = request.getSession();
        session.setAttribute("accountType", accountType);
 
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
        String accountType = (String) session.getAttribute("accountType");
        
        if (accountType.equalsIgnoreCase("patient")) {
        	
			PatientDAO patientDAO = new PatientDAOImpl();
			Patient patient = patientDAO.checkLogin(email, password);
			
			if (patient != null) {
			 
	            session.setAttribute("user", patient);
	            request.getRequestDispatcher("/WEB-INF/accueilPatient.jsp").forward(request, response);
	            
	            System.out.println("User login successful");
	            
			}else {
				String messageErreur = "L'adresse email ou le mot de passe est incorrect !";
				request.setAttribute("messageErreur", messageErreur);
				request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
				
				System.out.println("User login failure");
			}
		
        } else if (accountType.equalsIgnoreCase("admin")) {
        	
        	AdminDAO adminDAO = new AdminDAOImpl();
			Admin admin = adminDAO.checkLogin(email, password);
			
			if (admin != null) {
				 
	            session.setAttribute("user", admin);
	            request.getRequestDispatcher("/WEB-INF/dashboard.jsp").forward(request, response);
	            
	            System.out.println("User login successful");
	            
			}else {
				String messageErreur = "L'adresse email ou le mot de passe est incorrect !";
				request.setAttribute("messageErreur", messageErreur);
				request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
				
				System.out.println("User login failure");
			}
		 
		} else if (accountType.equalsIgnoreCase("dentiste")) {
			
			DentisteDAO dentisteDAO = new DentisteDAOImpl();
			Dentiste dentiste = dentisteDAO.checkLogin(email, password);
			
			if (dentiste != null) {
				 
	            session.setAttribute("user", dentiste);
	            request.getRequestDispatcher("/WEB-INF/accueilDentiste.jsp").forward(request, response);
	            
	            System.out.println("User login successful");
	            
			}else {
				String messageErreur = "L'adresse email ou le mot de passe est incorrect !";
				request.setAttribute("messageErreur", messageErreur);
				request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
				
				System.out.println("User login failure");
			}
		}
	}

}
