package com.controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PatientDAO;
import com.dao.impl.PatientDAOImpl;
import com.entities.Patient;
import com.entities.RendezVous;

@WebServlet("/AccueilPatient")
public class AccueilPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PatientDAO patientDAO = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		patientDAO = new PatientDAOImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// The connected patient is stored in the session under "user"
		HttpSession session = request.getSession();
		Patient patient = (Patient) session.getAttribute("user");

		if (patient == null) {
			response.sendRedirect("Login?accountType=patient");
			return;
		}

		List<RendezVous> lesRendezVous = patientDAO.getAllAppointment(patient.getId());

		// ISO dates (YYYY-MM-DD) compare lexicographically = chronologically
		String today = LocalDate.now().toString();

		int nbrEffectues = 0, nbrAVenir = 0;
		RendezVous prochainRDV = null;

		if (lesRendezVous != null) {
			for (RendezVous rendezVous : lesRendezVous) {
				String jour = rendezVous.getPlannification().getJour();

				if (jour.compareTo(today) < 0) {
					nbrEffectues++;
				} else {
					nbrAVenir++;
					if (prochainRDV == null || jour.compareTo(prochainRDV.getPlannification().getJour()) < 0) {
						prochainRDV = rendezVous;
					}
				}
			}
		}

		request.setAttribute("nbrEffectues", nbrEffectues);
		request.setAttribute("nbrAVenir", nbrAVenir);
		request.setAttribute("prochainRDV", prochainRDV);
		request.setAttribute("today", today);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/home/accueilPatient.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
