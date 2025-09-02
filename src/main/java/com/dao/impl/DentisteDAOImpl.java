package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.DentisteDAO;
import com.db.DBConnexion;
import com.entities.Dentiste;

public class DentisteDAOImpl implements DentisteDAO{
	
	private static Connection connexion = DBConnexion.getConnection();

	@Override
	public Dentiste checkLogin(String email, String password) {
		
		try {
			String query = "SELECT * FROM dentiste WHERE email = ? AND password = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);
	
			preSt.setString(1,email);
			preSt.setString(2,password);
			
			ResultSet rs = preSt.executeQuery();
				
			Dentiste dentiste = null; 
			
			if(rs.next()) {
				int id = rs.getInt("id");
				String cin = rs.getString("cin");
				String prenom = rs.getString("prenom");
				String nom = rs.getString("nom");
				String specialty = rs.getString("specialty");
				 
				
				dentiste = new Dentiste(id, email, password, cin, prenom, nom, specialty);
				
			}
			
			return dentiste;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}	
	}

	@Override
	public boolean create(Dentiste dentiste) {
		
		try {
			String query = "INSERT INTO dentiste (email, password, cin, prenom, nom, specialty) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement preSt = connexion.prepareStatement(query);
			
			preSt.setString(1, dentiste.getEmail());
			preSt.setString(2, dentiste.getPassword());
			preSt.setString(3, dentiste.getCin());
			preSt.setString(4, dentiste.getPrenom());
			preSt.setString(5, dentiste.getNom());
			preSt.setString(6, dentiste.getSpecialty());

			int result = preSt.executeUpdate();
			return result == 1 ? true : false;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update(Dentiste dentiste) {
		
		try {
			String query = "UPDATE dentiste SET email = ?, password = ?, cin = ?, prenom = ?, nom = ?, specialty = ? WHERE id = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);
				
			preSt.setString(1, dentiste.getEmail());
			preSt.setString(2, dentiste.getPassword());
			preSt.setString(3, dentiste.getCin());
			preSt.setString(4, dentiste.getPrenom());
			preSt.setString(5, dentiste.getNom());
			preSt.setString(6, dentiste.getSpecialty());
			preSt.setInt(7, dentiste.getId());

			int result = preSt.executeUpdate();
			return result == 1 ? true : false; 
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(int dentisteId) {
		
		try {
			String query = "DELETE FROM dentiste WHERE id = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);

			preSt.setInt(1, dentisteId);
			
			int result = preSt.executeUpdate();
			return result  == 1 ? true : false;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Dentiste getById(int dentisteId) {
		
		try {
			String query = "SELECT * FROM dentiste WHERE id = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);
				
			preSt.setInt(1, dentisteId);
				
			ResultSet rs = preSt.executeQuery();	
			Dentiste dentiste = new Dentiste();
					
			if (rs.next()) {
				dentiste.setId(rs.getInt("id"));
				dentiste.setEmail(rs.getString("email"));
				dentiste.setPassword(rs.getString("password"));
				dentiste.setCin(rs.getString("cin"));
				dentiste.setPrenom(rs.getString("prenom"));
				dentiste.setNom(rs.getString("nom"));
				dentiste.setSpecialty(rs.getString("specialty"));
			}
			
			return dentiste;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Dentiste> getAll() {
		
		try {
			String query = "SELECT * FROM dentiste";
			PreparedStatement preSt = connexion.prepareStatement(query);			
			ResultSet rs = preSt.executeQuery();
			
			List<Dentiste> dentistes = new ArrayList<Dentiste>();
			while (rs.next()) {
				int id = rs.getInt("id");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String cin = rs.getString("cin");
				String prenom = rs.getString("prenom");
				String nom = rs.getString("nom");
				String specialty = rs.getString("specialty");
	 
				
				Dentiste dentiste = new Dentiste(id, email, password, cin, prenom, nom, specialty);
				
				dentistes.add(dentiste);
			}
			
			return dentistes;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void main(String[] args) {
		
		/* -------------------------------------------------   
		Dentiste dentiste = new Dentiste();
		dentiste.setEmail("ismail@gmail.com");
		dentiste.setPassword("ismail1234");
		dentiste.setCin("LBF78QA");
		dentiste.setPrenom("Ismail");
		dentiste.setNom("Zriwli");
		dentiste.setSpecialty("Parodontologie");
 
		DentisteDAO dentisteDAO = new DentisteDAOImpl();
		System.out.println(dentisteDAO.create(dentiste));
 		*/
		
		/* -------------------------------------------------  
		Dentiste dentiste = new Dentiste();
		dentiste.setId(2);
		dentiste.setNom("Belefqih");
		dentiste.setPrenom("Mohammed");
		dentiste.setCin("LB9090");
		dentiste.setPassword("2024mohammed");
		dentiste.setEmail("med@gmail.com");
		dentiste.setSpecialty("Orthodontie");
		
		DentisteDAO dentisteDAO = new DentisteDAOImpl();
		System.out.println(dentisteDAO.update(dentiste));
		*/ 
		  
		/* --------------------------------------------------------   
		Dentiste dentiste = new Dentiste();
		dentiste.setId(3);
		
		DentisteDAO dentisteDAO = new DentisteDAOImpl();
		System.out.println(dentisteDAO.delete(dentiste.getId()));
		*/
		
		/* ---------------------------------------------------------     
		DentisteDAO dentisteDAO = new DentisteDAOImpl();
		Dentiste dentiste = new Dentiste();
		dentiste.setId(1);
		dentiste = dentisteDAO.getById(dentiste.getId());
		System.out.println(dentiste); // dentiste.toString()
		*/
		
		/* ---------------------------------------------------------   
		DentisteDAO dentisteDAO = new DentisteDAOImpl();
		List<Dentiste> dentistes = new ArrayList<Dentiste>();
		 
		System.out.println(dentisteDAO.getAll().size());
		
		dentistes = dentisteDAO.getAll();
		for(Dentiste dentiste : dentistes) {
			System.out.println(dentiste.toString());
		}
		*/ 
	}

}
