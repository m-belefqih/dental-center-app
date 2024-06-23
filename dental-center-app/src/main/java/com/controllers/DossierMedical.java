package com.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PatientDAO;
import com.dao.RendezVousDAO;
import com.dao.impl.PatientDAOImpl;
import com.dao.impl.RendezVousDAOImpl;
import com.entities.Patient;
import com.entities.RendezVous;

 
@WebServlet("/DossierMedical")
public class DossierMedical extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	PatientDAO patientDAO = null;
	RendezVousDAO rendezVousDAO = null;
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	patientDAO = new PatientDAOImpl();
    	rendezVousDAO = new RendezVousDAOImpl();
    }
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		 
		Patient patient = patientDAO.getById(id);
		List<RendezVous> lesRendezVous = patientDAO.getAllAppointment(id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/dossierMedical.jsp");
		request.setAttribute("patient", patient);
		request.setAttribute("lesRendezVous", lesRendezVous);
		dispatcher.forward(request, response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		int nbrRDV = Integer.parseInt(request.getParameter("nbrRDV"));
		
		for (int i = 1; i <= nbrRDV; i++) {
			int id = Integer.parseInt(request.getParameter("id" + i));
			String motifRDV = request.getParameter("motifRDV" + i);
			String actes = request.getParameter("actes" + i);
			String examensRadio = request.getParameter("examensRadio" + i);
			String traitements = request.getParameter("traitements" + i);
			
			RendezVous rendezVous = new RendezVous(id, motifRDV, actes, examensRadio, traitements);
			
			boolean result = rendezVousDAO.update(rendezVous);
			System.out.println("Update appointment " + i + ", result is ==> " + result);
		}
		
		
		String idString = request.getParameter("idPatient");
		
		if (idString != null) {
			
			int idPatient = Integer.parseInt(idString);
			
			Patient patient = patientDAO.getById(idPatient);
			List<RendezVous> lesRendezVous = patientDAO.getAllAppointment(idPatient);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/dossierMedical.jsp");
			request.setAttribute("isUpdated", "Yes");
			request.setAttribute("patient", patient);
			request.setAttribute("lesRendezVous", lesRendezVous);
			dispatcher.forward(request, response);
			doGet(request, response);
			
		}else {
			System.out.println("Cannot parse null String !");
		}
		
	}

}
