package com.controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DentisteDAO;
import com.dao.PlannificationDAO;
import com.dao.impl.DentisteDAOImpl;
import com.dao.impl.PlannificationDAOImpl;
import com.entities.Admin;
import com.entities.Dentiste;
import com.entities.Plannification;

 
@WebServlet("/Planning")
public class Planning extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Planning() {
        super();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

 		DentisteDAO dentisteDAO = new DentisteDAOImpl();
		List<Dentiste> dentistes = dentisteDAO.getAll();

		request.setAttribute("dentistes", dentistes);

		// Récupérer toutes les planifications (du plus récent au plus ancien)
		// puis les regrouper par jour en conservant l'ordre.
		PlannificationDAO plannificationDAO = new PlannificationDAOImpl();
		List<Plannification> plannifications = plannificationDAO.getAllOrderedByDayDesc();

		LinkedHashMap<String, List<Plannification>> planningsParJour = new LinkedHashMap<String, List<Plannification>>();

		if (plannifications != null) {
			for (Plannification plannification : plannifications) {
				String jour = plannification.getJour();
				if (!planningsParJour.containsKey(jour)) {
					planningsParJour.put(jour, new ArrayList<Plannification>());
				}
				planningsParJour.get(jour).add(plannification);
			}
		}

		request.setAttribute("planningsParJour", planningsParJour);

		request.getRequestDispatcher("/WEB-INF/planification.jsp").forward(request, response);
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String datePlanning = request.getParameter("datePlanning");
		
		PlannificationDAO plannificationDAO = new PlannificationDAOImpl();
		boolean result = plannificationDAO.isPlanned(datePlanning);
		
		if (result == true) {
			
			LocalDate date = LocalDate.parse(datePlanning);
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d MMMM yyyy", Locale.FRENCH);
			
			String formattedDate = date.format(formatter);
			
			request.setAttribute("messageWarning", "Yes");
			request.setAttribute("formattedDate", formattedDate);
			doGet(request, response);
			
		}else {

			DentisteDAO dentisteDAO = new DentisteDAOImpl();

			HttpSession session = request.getSession();
			Admin admin = (Admin) session.getAttribute("user");

			String dentistesMatin[] = request.getParameterValues("dentistesMatin");
			String dentistesSoir[] = request.getParameterValues("dentistesSoir");

			// Vérifier qu'au moins un dentiste est sélectionné pour chaque plage horaire.
			// getParameterValues retourne null si aucune case n'est cochée.
			if (dentistesMatin == null || dentistesMatin.length == 0
					|| dentistesSoir == null || dentistesSoir.length == 0) {

				request.setAttribute("messageDanger", "Yes");
				doGet(request, response);
				return;
			}

			for (int i = 0; i < dentistesMatin.length; i++) {

				Dentiste dentiste = dentisteDAO.getById(Integer.parseInt(dentistesMatin[i]));

				Plannification plannification = new Plannification();
				plannification.setJour(datePlanning);
				plannification.setFrom_T("08h00");
				plannification.setTo_T("12h00");
				plannification.setDentiste(dentiste);
				plannification.setAdmin(admin);

				plannificationDAO.create(plannification);

			}

			for (int i = 0; i < dentistesSoir.length; i++) {

				Dentiste dentiste = dentisteDAO.getById(Integer.parseInt(dentistesSoir[i]));

				Plannification plannification = new Plannification();
				plannification.setJour(datePlanning);
				plannification.setFrom_T("14h00");
				plannification.setTo_T("18h00");
				plannification.setDentiste(dentiste);
				plannification.setAdmin(admin);

				plannificationDAO.create(plannification);

			}

			LocalDate date = LocalDate.parse(datePlanning);
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d MMMM yyyy", Locale.FRENCH);
			
			String formattedDate = date.format(formatter);
			
			request.setAttribute("messageSuccess", "Yes");
			request.setAttribute("formattedDate", formattedDate);
			
			doGet(request, response);
			
		}
		
	} 

}
