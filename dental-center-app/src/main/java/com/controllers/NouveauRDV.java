package com.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PatientDAO;
import com.dao.PlannificationDAO;
import com.dao.RendezVousDAO;
import com.dao.impl.PatientDAOImpl;
import com.dao.impl.PlannificationDAOImpl;
import com.dao.impl.RendezVousDAOImpl;
import com.entities.Patient;
import com.entities.Plannification;
import com.entities.RendezVous;

 
@WebServlet("/NouveauRDV/*")
public class NouveauRDV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public NouveauRDV() {
        super();
 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("NouveauRDVController, doPost method started");
		
		String action = request.getPathInfo();
		
		System.out.println("doPost, action ==> " + action);
		
		if(action != null) {
			switch (action) {	 
				case "/prendre":
					takeNewAppointment(request, response);
					break;
				case "/set":
					setReasonAppointment(request, response);
					break;
			}	 
		}else {
			getAllPlanning(request, response); 	
		}
	}


	private void setReasonAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mobeString = request.getParameter("mobe");
	    System.out.println("This is " + mobeString);
	    
	    request.setAttribute("isBooking", "Yes");
	    getAllPlanning(request, response);
		
	}


	private void getAllPlanning(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PlannificationDAO plannificationDAO = new PlannificationDAOImpl();
		List<Plannification> plannifications = plannificationDAO.getAll();
		
		HttpSession session = request.getSession();
		Patient patient = (Patient) session.getAttribute("user");
		
		PatientDAO patientDAO = new PatientDAOImpl();
		List<RendezVous> lesRendezVous = patientDAO.getAllAppointment(patient.getId());
		System.out.println(lesRendezVous.size());
				
		request.setAttribute("plannifications", plannifications);
		request.setAttribute("lesRendezVous", lesRendezVous);
		request.getRequestDispatcher("/WEB-INF/prendreRDV.jsp").forward(request, response);
		
	}


	private void takeNewAppointment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("planningId"));
		
		PlannificationDAO plannificationDAO = new PlannificationDAOImpl();
		Plannification plannification = plannificationDAO.getById(id);
		
		HttpSession session = request.getSession();
		Patient patient = (Patient) session.getAttribute("user");
		
		RendezVous rdv = new RendezVous();
		rdv.setPlannification(plannification);
		rdv.setPatient(patient);
		
		RendezVousDAO rendezVousDAO = new RendezVousDAOImpl();
	    boolean result = rendezVousDAO.create(rdv);
	    
	    System.out.println("Creation of appointment, result ==> " + result);

	    getAllPlanning(request, response);
		
	}

}
