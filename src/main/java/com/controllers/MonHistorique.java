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


@WebServlet("/MonHistorique")
public class MonHistorique extends HttpServlet {
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

		List<RendezVous> lesRendezVous = patientDAO.getAllAppointment(patient.getId());

		// Today's date (ISO format YYYY-MM-DD), used by the JSP to decide each
		// appointment status (done / today / upcoming)
		String today = LocalDate.now().toString();

		request.setAttribute("lesRendezVous", lesRendezVous);
		request.setAttribute("today", today);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/monHistorique.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
