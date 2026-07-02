package com.controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RendezVousDAO;
import com.dao.impl.RendezVousDAOImpl;
import com.entities.Dentiste;
import com.entities.RendezVous;

@WebServlet("/MesRendezVous")
public class MesRendezVous extends HttpServlet {
	private static final long serialVersionUID = 1L;

	RendezVousDAO rendezVousDAO = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		rendezVousDAO = new RendezVousDAOImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// The connected dentist is stored in the session under "user"
		HttpSession session = request.getSession();
		Dentiste dentiste = (Dentiste) session.getAttribute("user");

		if (dentiste == null) {
			response.sendRedirect("Login?accountType=dentiste");
			return;
		}

		List<RendezVous> lesRendezVous = rendezVousDAO.getAllByDentiste(dentiste.getId());

		// ISO dates (YYYY-MM-DD) compare lexicographically = chronologically
		String today = LocalDate.now().toString();

		int nbrAujourdhui = 0, nbrAVenir = 0;
		if (lesRendezVous != null) {
			for (RendezVous rendezVous : lesRendezVous) {
				String jour = rendezVous.getPlannification().getJour();
				if (jour.equals(today)) {
					nbrAujourdhui++;
				} else if (jour.compareTo(today) > 0) {
					nbrAVenir++;
				}
			}
		}

		// Optional date filter coming from the search form
		String dateFilter = request.getParameter("dateFilter");
		if (dateFilter != null && !dateFilter.isEmpty() && lesRendezVous != null) {
			List<RendezVous> filtres = new ArrayList<RendezVous>();
			for (RendezVous rendezVous : lesRendezVous) {
				if (rendezVous.getPlannification().getJour().equals(dateFilter)) {
					filtres.add(rendezVous);
				}
			}
			lesRendezVous = filtres;
			request.setAttribute("dateFilter", dateFilter);
		}

		request.setAttribute("lesRendezVous", lesRendezVous);
		request.setAttribute("today", today);
		request.setAttribute("nbrAujourdhui", nbrAujourdhui);
		request.setAttribute("nbrAVenir", nbrAVenir);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/mesRendezVous.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
