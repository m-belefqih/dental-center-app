package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.dao.AdminDAO;
import com.db.DBConnexion;
import com.entities.Admin;

public class AdminDAOImpl implements AdminDAO {
	
	private static Connection connexion = DBConnexion.getConnection();
	
	@Override
	public Admin checkLogin(String email, String password) {
		
		try {
			String query = "SELECT * FROM admin WHERE email = ? AND password = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);
	
			preSt.setString(1,email);
			preSt.setString(2,password);
			
			ResultSet rs = preSt.executeQuery();
				
			Admin admin = null; 
			
			if(rs.next()) {
				int id = rs.getInt("id");
				String cin = rs.getString("cin");
				String prenom = rs.getString("prenom");
				String nom = rs.getString("nom");
				
				admin = new Admin(id, email, password, cin, prenom, nom);
			}
			
			return admin;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean create(Admin o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Admin o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Admin getById(int adminId) {
		
		try {
			String query = "SELECT * FROM admin WHERE id = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);
				
			preSt.setInt(1, adminId);
				
			ResultSet rs = preSt.executeQuery();	
			Admin admin = new Admin();
					
			if (rs.next()) {
				admin.setId(rs.getInt("id"));
				admin.setEmail(rs.getString("email"));
				admin.setPassword(rs.getString("password"));
				admin.setCin(rs.getString("cin"));
				admin.setPrenom(rs.getString("prenom"));
				admin.setNom(rs.getString("nom"));
			}
			
			return admin;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Admin> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	 

}
