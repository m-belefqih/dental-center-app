package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.AdminDAO;
import com.dao.DentisteDAO;
import com.dao.PlannificationDAO;
import com.db.DBConnexion;
import com.entities.Plannification;

public class PlannificationDAOImpl implements PlannificationDAO {

	private Connection connexion = DBConnexion.getConnection();
	private DentisteDAO dentisteDAO = new DentisteDAOImpl();
	private AdminDAO adminDAO = new AdminDAOImpl();
	
	@Override
	public List<Plannification> getAll() {
		
		try {
			String query = "SELECT * FROM plannification";
			PreparedStatement preSt = connexion.prepareStatement(query);
			
			ResultSet rs = preSt.executeQuery();
			
			List<Plannification> plannifications = new ArrayList<Plannification>();
			
			while (rs.next()) {
				
				Plannification plannification = new Plannification();
				
				plannification.setId(rs.getInt("id"));
				plannification.setJour(rs.getString("jour"));
				plannification.setFrom_T(rs.getString("from_T"));
				plannification.setTo_T(rs.getString("to_T"));
				plannification.setDentiste(dentisteDAO.getById(rs.getInt("id_dentiste")));
				plannification.setAdmin(adminDAO.getById(rs.getInt("id_admin")));
				
				plannifications.add(plannification);
				
			}
			
			return plannifications;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public Plannification getById(int plannificationId) {
		
		try {
			String query = "SELECT * FROM plannification WHERE id = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);
				
			preSt.setInt(1, plannificationId);
				
			ResultSet rs = preSt.executeQuery();	
			Plannification plannification = new Plannification();
					
			if (rs.next()) {
				plannification.setId(rs.getInt("id"));
				plannification.setJour(rs.getString("jour"));
				plannification.setFrom_T(rs.getString("from_T"));
				plannification.setTo_T(rs.getString("to_T"));
				plannification.setDentiste(dentisteDAO.getById(rs.getInt("id_dentiste")));
				plannification.setAdmin(adminDAO.getById(rs.getInt("id_admin")));
			}
			
			return plannification;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
