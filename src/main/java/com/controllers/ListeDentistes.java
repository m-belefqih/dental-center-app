package com.controllers;

import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.dao.DentisteDAO;
import com.dao.impl.DentisteDAOImpl;
import com.entities.Dentiste;

 
@WebServlet("/ListeDentistes/*")
public class ListeDentistes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DentisteDAO dentisteDAO = null;
 
	@Override
    public void init(ServletConfig config) throws ServletException {
    	dentisteDAO = new DentisteDAOImpl();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("DentistController, doPost method started");
		
		String action = request.getPathInfo();
		
		System.out.println("doPost, action ==> " + action);
		
		
		if(action != null) {
			switch (action) {
				case "/list":
					getAllDentist(request, response);
					break;
				case "/create":
					createNewDentist(request, response);
					break;
				case "/delete":
					deleteDentist(request, response);
					break;
				case "/get":
					getDentist(request, response);
					break;
				case "/update":
					updateDentist(request, response);
					break;
			}	 
		}else {
			getAllDentist(request, response); 	
		}
		 
	}
	
	private void getAllDentist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Start getting all dentists ...");
		
		List<Dentiste> dentistes = dentisteDAO.getAll();
		System.out.println("getAllDentist, dentists size ==> " + dentistes.size());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/listeDentistes.jsp");
		request.setAttribute("dentistes", dentistes);
		dispatcher.forward(request, response);
		
	}
	
	private void getDentist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Start getting a dentist ...");
		
		int id = Integer.parseInt(request.getParameter("dentistId"));
		System.out.println("getDentist, Dentist ID ==> " + id);
		
		Dentiste dentiste = dentisteDAO.getById(id);
		System.out.println("getDentist, result is ==> " + dentiste); 
		
		ObjectMapper mapper = new ObjectMapper();
		String dentistString = mapper.writeValueAsString(dentiste);
		
		ServletOutputStream servletoutputstream = response.getOutputStream();
		servletoutputstream.write(dentistString.getBytes());
	 	
	}
	

	private void deleteDentist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Start deleting a dentist ...");

		String dentistIds = request.getParameter("dentistIds");	 
		System.out.println("deleteDentist, Dentist ID ==> " + dentistIds); 
		
		
		StringTokenizer tokenizer = new StringTokenizer(dentistIds, ",");
		
		while (tokenizer.hasMoreElements()) {
			 int dentistId = Integer.parseInt(tokenizer.nextToken());
			 
			 boolean result = dentisteDAO.delete(dentistId);
			 System.out.println("deleteDentist, result is ==> " + result);
		}
		
		getAllDentist(request, response);
		
	}

	private void updateDentist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Start updating a dentist ...");

		int id = Integer.parseInt(request.getParameter("id"));
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cin = request.getParameter("cin");
		String prenom = request.getParameter("prenom");
		String nom = request.getParameter("nom");
		String specialty = request.getParameter("specialty");

		Dentiste dentiste = new Dentiste(id, email, password, cin, prenom, nom, specialty);
		System.out.println("updateDentist, Dentist details ==> " + dentiste); // dentiste.toString()

		boolean result = dentisteDAO.update(dentiste);
		System.out.println("updateDentist, result is ==> " + result);

		getAllDentist(request, response);
		
	}


	private void createNewDentist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		// Configure the encoding of requests and responses to UTF-8 for special characters like é, à, etc ...
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
			    
		System.out.println("Start adding new dentist ...");

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cin = request.getParameter("cin");
		String prenom = request.getParameter("prenom");
		String nom = request.getParameter("nom");
		String specialty = request.getParameter("specialty");

		Dentiste dentiste = new Dentiste(email, password, cin, prenom, nom, specialty);
		System.out.println("createNewDentist, Dentist details ==> " + dentiste); // dentiste.toString()

		boolean result = dentisteDAO.create(dentiste);
		System.out.println("createNewDentist, result is ==> " + result);

		getAllDentist(request, response);
		
	}


}
