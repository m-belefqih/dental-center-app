package com.controllers;

import java.io.IOException;
import javax.servlet.ServletConfig;
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

@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PatientDAO patientDAO = null;
	DentisteDAO dentisteDAO = null;
	AdminDAO adminDAO = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		patientDAO = new PatientDAOImpl();
		dentisteDAO = new DentisteDAOImpl();
		adminDAO = new AdminDAOImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String accountType = (String) session.getAttribute("accountType");

        if (accountType.equals("patient")) {

        	request.getRequestDispatcher("/WEB-INF/profile/profilePatient.jsp").forward(request, response);

		}else if (accountType.equals("dentiste")) {

			request.getRequestDispatcher("/WEB-INF/profile/profileDentiste.jsp").forward(request, response);

		}else if (accountType.equals("admin")) {

			request.getRequestDispatcher("/WEB-INF/profile/profileAdmin.jsp").forward(request, response);

		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Configure the encoding of requests and responses to UTF-8 for special characters like é, à, etc ...
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String accountType = (String) session.getAttribute("accountType");

		// Si le champ "nouveau mot de passe" est laissé vide, le mot de passe actuel est conservé
		String password = request.getParameter("password");

		boolean result = false;

		if (accountType.equals("patient")) {

			Patient patient = (Patient) session.getAttribute("user");

			patient.setPrenom(request.getParameter("prenom"));
			patient.setNom(request.getParameter("nom"));
			patient.setEmail(request.getParameter("email"));
			patient.setCin(request.getParameter("cin"));
			patient.setBirthDate(request.getParameter("birthDate"));
			patient.setSexe(request.getParameter("sexe"));
			patient.setTelephone(request.getParameter("telephone"));
			patient.setAdresse(request.getParameter("adresse"));

			if (password != null && !password.trim().isEmpty()) {
				patient.setPassword(password);
			}

			result = patientDAO.update(patient);
			session.setAttribute("user", patient);

		}else if (accountType.equals("dentiste")) {

			Dentiste dentiste = (Dentiste) session.getAttribute("user");

			dentiste.setPrenom(request.getParameter("prenom"));
			dentiste.setNom(request.getParameter("nom"));
			dentiste.setEmail(request.getParameter("email"));
			dentiste.setCin(request.getParameter("cin"));
			dentiste.setSpecialty(request.getParameter("specialty"));

			if (password != null && !password.trim().isEmpty()) {
				dentiste.setPassword(password);
			}

			result = dentisteDAO.update(dentiste);
			session.setAttribute("user", dentiste);

		}else if (accountType.equals("admin")) {

			Admin admin = (Admin) session.getAttribute("user");

			admin.setPrenom(request.getParameter("prenom"));
			admin.setNom(request.getParameter("nom"));
			admin.setEmail(request.getParameter("email"));
			admin.setCin(request.getParameter("cin"));

			if (password != null && !password.trim().isEmpty()) {
				admin.setPassword(password);
			}

			result = adminDAO.update(admin);
			session.setAttribute("user", admin);
		}

		if (result) {
			request.setAttribute("messageSuccess", "Yes");
		}else {
			request.setAttribute("messageDanger", "Yes");
		}

		doGet(request, response);
	}

}
