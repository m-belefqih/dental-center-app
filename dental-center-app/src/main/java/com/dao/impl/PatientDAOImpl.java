package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.dao.PatientDAO;
import com.dao.PlannificationDAO;
import com.db.DBConnexion;
import com.entities.Patient;
import com.entities.RendezVous;

public class PatientDAOImpl implements PatientDAO {
	
	private static Connection connexion = DBConnexion.getConnection();
	private PlannificationDAO plannificationDAO = new PlannificationDAOImpl();
	
	@Override
	public Patient checkLogin(String email, String password) {
		
		try {
			String query = "SELECT * FROM patient WHERE email = ? AND password = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);
	
			preSt.setString(1,email);
			preSt.setString(2,password);
			
			ResultSet rs = preSt.executeQuery();
				
			Patient patient = null; 
			
			if(rs.next()) {
				int id = rs.getInt("id");
				String cin = rs.getString("cin");
				String prenom = rs.getString("prenom");
				String nom = rs.getString("nom");
				String birthDate = rs.getString("birthDate");
				String sexe = rs.getString("sexe");
				String telephone = rs.getString("telephone");
				String adresse = rs.getString("adresse");
				
				patient = new Patient(id, email, password, cin, prenom, nom, birthDate, sexe, telephone, adresse);
			}
			
			return patient;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}	     	
	}
	
	@Override
	public boolean isExist(String email) {
		
		try {
			String query = "SELECT id FROM patient WHERE email = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);
			
			preSt.setString(1,email);
			
			ResultSet rs = preSt.executeQuery();
			
			return rs.next() ? true : false ;
			 
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	@Override
	public boolean register(Patient patient) {
		return create(patient) ? true : false;
	}
	
	// Method to generate a random 6-digit code
	@Override
	public String getRandom() {
		Random random = new Random();
		int number = random.nextInt(999999);   
		return String.format("%06d", number);  
	}

	// Method to send an email with a verification code
	@Override
	public boolean sendEmail(String EMAIL_TO, String CODE) {
		String FROM_EMAIL = "mblq02@gmail.com";
		String APP_PASSWORD = "atyu qytr mmjd vsid";
		
		try {
			
			Properties properties = new Properties();
			properties.setProperty("mail.smtp.host", "smtp.gmail.com"); 
            properties.setProperty("mail.smtp.port", "587"); 
            properties.setProperty("mail.smtp.auth", "true"); 
            properties.setProperty("mail.smtp.starttls.enable", "true");
			
			// Get session with authentication
			Session session = Session.getInstance(properties, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(FROM_EMAIL, APP_PASSWORD);		
				}
			});
			
			// Create a new email message
			Message message = new MimeMessage(session);		
			message.setFrom(new InternetAddress(FROM_EMAIL));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(EMAIL_TO));	 
			message.setSubject("Vérifiez votre nouveau compte DENTAL CENTER");
			/*message.setText("Votre code de vérification à 4 chiffres est " + CODE + 
					"\nCe code de vérification est envoyé pour vérifier l'authenticité de vos informations.");*/
			
			
			String htmlContent = "<html>" +
                    "<body>" +
                    "<p>Pour vérifier votre adresse e-mail, veuillez utiliser le mot de passe à usage unique (OTP) suivant :</p>" +
                    "<h2>" + CODE + "</h2>" +
                    "<p>Ne partagez pas cet OTP avec qui que ce soit.</p>" +
                    "<p>Merci</p>" +
                    "</body>" +
                    "</html>";

            message.setContent(htmlContent, "text/html; charset=utf-8");
			
			Transport.send(message);
			
			return true;
			
		}catch(Exception e) {
			e.printStackTrace();
			return false;		
		}
		
	}
	
	
	@Override
	public boolean create(Patient patient) {
		
		try {
			String query = "INSERT INTO patient (email, password, cin, prenom, nom, birthDate, sexe, telephone, adresse) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preSt = connexion.prepareStatement(query);
			
			preSt.setString(1, patient.getEmail());
			preSt.setString(2, patient.getPassword());
			preSt.setString(3, patient.getCin());
			preSt.setString(4, patient.getPrenom());
			preSt.setString(5, patient.getNom());
			preSt.setString(6, patient.getBirthDate());
			preSt.setString(7, patient.getSexe());
			preSt.setString(8, patient.getTelephone());
			preSt.setString(9, patient.getAdresse());

			int result = preSt.executeUpdate();
			return result == 1 ? true : false;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	
	}

	@Override
	public boolean update(Patient patient) {
		
		try {
			String query = "UPDATE patient SET email = ?, password = ?, cin = ?, prenom = ?, nom = ?, birthDate = ?, sexe = ?, telephone = ?, adresse = ? WHERE id = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);
				
			preSt.setString(1, patient.getEmail());
			preSt.setString(2, patient.getPassword());
			preSt.setString(3, patient.getCin());
			preSt.setString(4, patient.getPrenom());
			preSt.setString(5, patient.getNom());
			preSt.setString(6, patient.getBirthDate());
			preSt.setString(7, patient.getSexe());
			preSt.setString(8, patient.getTelephone());
			preSt.setString(9, patient.getAdresse());
			preSt.setInt(10, patient.getId());

			int result = preSt.executeUpdate();
			return result == 1 ? true : false;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(int patientId) {
		
		try {
			String query = "DELETE FROM patient WHERE id = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);

			preSt.setInt(1, patientId);
			
			int result = preSt.executeUpdate();
			return result  == 1 ? true : false;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Patient getById(int patientId) {
		
		try {
			String query = "SELECT * FROM patient WHERE id = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);
				
			preSt.setInt(1, patientId);
				
			ResultSet rs = preSt.executeQuery();	
			Patient patient = new Patient();
					
			if (rs.next()) {
				patient.setId(rs.getInt("id"));
				patient.setEmail(rs.getString("email"));
				patient.setPassword(rs.getString("password"));
				patient.setCin(rs.getString("cin"));
				patient.setPrenom(rs.getString("prenom"));
				patient.setNom(rs.getString("nom"));
				patient.setBirthDate(rs.getString("birthDate"));
				patient.setSexe(rs.getString("sexe"));	
				patient.setTelephone(rs.getString("telephone"));
				patient.setAdresse(rs.getString("adresse"));
			}
			return patient;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Patient> getAll() {
		try {
			String query = "SELECT * FROM patient";
			PreparedStatement preSt = connexion.prepareStatement(query);
			
			ResultSet rs = preSt.executeQuery();
			
			List<Patient> patients = new ArrayList<Patient>();
			while (rs.next()) {
				int id = rs.getInt("id");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String cin = rs.getString("cin");
				String prenom = rs.getString("prenom");
				String nom = rs.getString("nom");
				String birthDate = rs.getString("birthDate");
				String sexe = rs.getString("sexe");
				String telephone = rs.getString("telephone");
				String adresse = rs.getString("adresse");
				
				Patient patient = new Patient(id, email, password, cin, prenom, nom, birthDate, sexe, telephone, adresse);
				
				patients.add(patient);
			}
			return patients;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public List<RendezVous> getAllAppointment(int patientId) {
		try {	
			String query = "SELECT * FROM rendezvous WHERE id_patient = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);
			
			preSt.setInt(1, patientId);
			ResultSet rs = preSt.executeQuery();
			
			List<RendezVous> lesRendezVous = new ArrayList<RendezVous>();
			while (rs.next()) {
				RendezVous rendezVous = new RendezVous();
				
				rendezVous.setId(rs.getInt("id"));
				rendezVous.setDateRDV(rs.getString("dateRDV"));
				rendezVous.setMotifRDV(rs.getString("motifRDV"));
				rendezVous.setActes(rs.getString("actes"));
				rendezVous.setExamensRadio(rs.getString("examensRadio"));
				rendezVous.setTraitements(rs.getString("traitements"));
				rendezVous.setPlannification(plannificationDAO.getById(rs.getInt("id_plannification")));
				
				lesRendezVous.add(rendezVous);
			}
			
			return lesRendezVous;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
 
	
	public static void main(String[] args) {
		
		/* -------------------------------------------------  
		Patient patient = new Patient();
		patient.setEmail("ismail@gmail.com");
		patient.setPassword("ismail1234");
		patient.setCin("LBF78QA");
		patient.setPrenom("Ismail");
		patient.setNom("Zriwli");
		patient.setBirthDate("1988-10-04");
		patient.setSexe("Homme");
		patient.setTelephone("07 88 99 22 32");
		patient.setAdresse("Hay TAKKADOUM RUE 12");
		
		PatientDAO patientDAO = new PatientDAOImpl();
		System.out.println(patientDAO.create(patient));
 		*/ 
		
		/* -------------------------------------------------
		Patient patient = new Patient();
		patient.setId(4);
		patient.setTelephone("01 01 01 01 12");
		patient.setAdresse("Hay TMARA RUE 8");
		
		PatientDAO patientDAO = new PatientDAOImpl();
		System.out.println(patientDAO.update(patient));
		*/ 
		
		/* -------------------------------------------------------- 
		Patient patient = new Patient();
		patient.setId(4);
		
		PatientDAO patientDAO = new PatientDAOImpl();
		System.out.println(patientDAO.delete(patient.getId()));
		*/
		
		/* ---------------------------------------------------------    
		PatientDAO patientDAO = new PatientDAOImpl();
		Patient patient = new Patient();
		patient.setId(1);
		patient = patientDAO.getById(patient.getId());
		System.out.println(patient); // emp.toString()
		*/ 
		
		/* ---------------------------------------------------------
		PatientDAO patientDAO = new PatientDAOImpl();
		List<Patient> patients = new ArrayList<Patient>();
		 
		System.out.println(patientDAO.getAll().size());
		int i = 0;
		patients = patientDAO.getAll();
		for(Patient patient : patients) {
			i++;
			System.out.println(patient.toString());
			System.out.println("i = "+ i);
		}
		*/ 
	}
	 
}
