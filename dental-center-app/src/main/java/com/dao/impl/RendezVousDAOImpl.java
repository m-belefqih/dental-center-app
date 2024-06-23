package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.dao.RendezVousDAO;
import com.db.DBConnexion;
import com.entities.RendezVous;

public class RendezVousDAOImpl implements RendezVousDAO {
	
	Connection connexion = DBConnexion.getConnection();

	@Override
	public boolean update(RendezVous rendezVous) {
		
		try {
			String query = "UPDATE rendezvous SET motifRDV = ?, actes = ?, examensRadio = ?, traitements = ? WHERE id = ?";
			PreparedStatement preSt = connexion.prepareStatement(query);
				
			preSt.setString(1, rendezVous.getMotifRDV());
			preSt.setString(2, rendezVous.getActes());
			preSt.setString(3, rendezVous.getExamensRadio());
			preSt.setString(4, rendezVous.getTraitements());
			preSt.setInt(5, rendezVous.getId());
		 
			int result = preSt.executeUpdate();
			return result == 1 ? true : false;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean create(RendezVous rendezVous) {
		
		try {
			String query = "INSERT INTO rendezvous (dateRDV, motifRDV, actes, examensRadio, traitements, id_patient, id_plannification)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement preSt = connexion.prepareStatement(query);
			
			preSt.setString(1, rendezVous.getPlannification().getJour());
			preSt.setString(2, rendezVous.getMotifRDV());
			preSt.setString(3, rendezVous.getActes());
			preSt.setString(4, rendezVous.getExamensRadio());
			preSt.setString(5, rendezVous.getTraitements());
			preSt.setInt(6, rendezVous.getPatient().getId());
			preSt.setInt(7, rendezVous.getPlannification().getId());

			int result = preSt.executeUpdate();
			return result == 1 ? true : false;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

}
