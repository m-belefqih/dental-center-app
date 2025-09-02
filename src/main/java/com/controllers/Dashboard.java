package com.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PatientDAO;
import com.dao.impl.PatientDAOImpl;
import com.entities.Patient;

 
@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Dashboard() {
        super();
 
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PatientDAO patientDAO = new PatientDAOImpl();
		List<Patient> patients = patientDAO.getAll();
		int nbrHomme = 0 , nbrFemme = 0;
	 
		for(Patient patient : patients) {
			if (patient.getSexe().equals("Homme")) {
				nbrHomme++;
			}else if (patient.getSexe().equals("Femme")) {
				nbrFemme++;
			}
		}
		
		System.out.println(nbrHomme);
		System.out.println(nbrFemme);
		request.setAttribute("nbrHomme", nbrHomme);
		request.setAttribute("nbrFemme", nbrFemme);
		request.getRequestDispatcher("/WEB-INF/dashboard.jsp").forward(request, response);
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
