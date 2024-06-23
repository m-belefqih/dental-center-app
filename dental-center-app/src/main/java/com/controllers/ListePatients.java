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

import com.dao.PatientDAO;
import com.dao.impl.PatientDAOImpl;
import com.entities.Patient;

 
@WebServlet("/ListePatients/*")
public class ListePatients extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	PatientDAO patientDAO = null;
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	patientDAO = new PatientDAOImpl();
    }

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("PatientController, doPost method started");
		
		String action = request.getPathInfo();
		
		System.out.println("doPost, action ==> " + action);
		
		
		if(action != null) {
			switch (action) {
				case "/list":
					getAllPatient(request, response);
					break;
				case "/create":
					createNewPatient(request, response);
					break;
				case "/delete":
					deletePatient(request, response);
					break;
				case "/get":
					getPatient(request, response);
					break;
				case "/update":
					updatePatient(request, response);
					break;
			}	 
		}else {
			getAllPatient(request, response); 	
		}
	}


	private void getAllPatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Start getting all patients ...");
		
		List<Patient> patients = patientDAO.getAll();
		System.out.println("getAllPatient, patients size ==> " + patients.size());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/listePatients.jsp");
		request.setAttribute("patients", patients);
		dispatcher.forward(request, response);
		
	}


	private void getPatient(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println("Start getting a patient ...");
		
		int id = Integer.parseInt(request.getParameter("patientId"));
		System.out.println("getPatient, Patient ID ==> " + id);
		
		Patient patient = patientDAO.getById(id);
		System.out.println("getPatient, result is ==> " + patient);
		
		ObjectMapper mapper = new ObjectMapper();
		String patientString = mapper.writeValueAsString(patient);
		
		ServletOutputStream servletoutputstream = response.getOutputStream();
		servletoutputstream.write(patientString.getBytes());
		
	}


	private void deletePatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Start deleting a patient ...");
		
		String patientIds = request.getParameter("patientIds");
		System.out.println("deletePatient, Patient ID ==> " + patientIds);
		
		StringTokenizer tokenizer = new StringTokenizer(patientIds, ",");
		
		while (tokenizer.hasMoreElements()) {
			 int patientId = Integer.parseInt(tokenizer.nextToken());
			 
			 boolean result = patientDAO.delete(patientId);
			 System.out.println("deletePatient, result is ==> " + result);
		}
		
		getAllPatient(request, response);
		
	}


	private void updatePatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Start updating a patient ...");
		
		int id = Integer.parseInt(request.getParameter("id"));
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cin = request.getParameter("cin");
		String prenom = request.getParameter("prenom");
		String nom = request.getParameter("nom");
		String birthDate = request.getParameter("birthDate");
		String sexe = request.getParameter("sexe");
		String telephone = request.getParameter("telephone");
		String adresse = request.getParameter("adresse");
		
		Patient patient = new Patient(id, email, password, cin, prenom, nom, birthDate, sexe, telephone, adresse);
		System.out.println("updatePatient, Patient details ==> " + patient);
		
		boolean result = patientDAO.update(patient);
		System.out.println("updatePatient, result is ==> " + result);
		
		response.sendRedirect(request.getContextPath() + "/ListePatients");
		
	}


	private void createNewPatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Start adding new patient ...");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cin = request.getParameter("cin");
		String prenom = request.getParameter("prenom");
		String nom = request.getParameter("nom");
		String birthDate = request.getParameter("birthDate");
		String sexe = request.getParameter("sexe");
		String telephone = request.getParameter("telephone");
		String adresse = request.getParameter("adresse");
		
		Patient patient = new Patient(email, password, cin, prenom, nom, birthDate, sexe, telephone, adresse);
		System.out.println("createNewPatient, Patient details ==> " + patient);
		
		boolean result = patientDAO.create(patient);
		System.out.println("createNewPatient, result is ==> " + result);
		
		response.sendRedirect(request.getContextPath() + "/ListePatients");
		
	}

}
