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

import com.dao.RendezVousDAO;
import com.dao.impl.RendezVousDAOImpl;
import com.entities.Dentiste;
import com.entities.RendezVous;

@WebServlet("/AccueilDentiste")
public class AccueilDentiste extends HttpServlet {
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

		int nbrAujourdhui = 0, nbrAVenir = 0, nbrEffectues = 0;
		RendezVous prochainRDV = null;

		if (lesRendezVous != null) {
			for (RendezVous rendezVous : lesRendezVous) {
				String jour = rendezVous.getPlannification().getJour();

				if (jour.compareTo(today) < 0) {
					nbrEffectues++;
				} else {
					if (jour.equals(today)) {
						nbrAujourdhui++;
					} else {
						nbrAVenir++;
					}

					// Le prochain RDV : le jour le plus proche, puis l'horaire le plus tôt
					if (prochainRDV == null) {
						prochainRDV = rendezVous;
					} else {
						String jourProchain = prochainRDV.getPlannification().getJour();
						int compare = jour.compareTo(jourProchain);

						if (compare < 0 || (compare == 0
								&& rendezVous.getPlannification().getFrom_T().compareTo(prochainRDV.getPlannification().getFrom_T()) < 0)) {
							prochainRDV = rendezVous;
						}
					}
				}
			}
		}

		request.setAttribute("nbrAujourdhui", nbrAujourdhui);
		request.setAttribute("nbrAVenir", nbrAVenir);
		request.setAttribute("nbrEffectues", nbrEffectues);
		request.setAttribute("prochainRDV", prochainRDV);
		request.setAttribute("today", today);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/home/accueilDentiste.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
