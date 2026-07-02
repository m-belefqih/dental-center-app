package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.PatientDAO;
import com.dao.PlannificationDAO;
import com.dao.RendezVousDAO;
import com.db.DBConnexion;
import com.entities.RendezVous;

public class RendezVousDAOImpl implements RendezVousDAO {

	Connection connexion = DBConnexion.getConnection();
	private PatientDAO patientDAO = new PatientDAOImpl();
	private PlannificationDAO plannificationDAO = new PlannificationDAOImpl();

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

	@Override
	public List<RendezVous> getAllByDentiste(int dentisteId) {

		try {
			// jour est stocké au format ISO (yyyy-MM-dd), donc le tri lexicographique
			// correspond au tri chronologique : du plus récent au plus ancien.
			String query = "SELECT r.* FROM rendezvous r "
					+ "JOIN plannification p ON r.id_plannification = p.id "
					+ "WHERE p.id_dentiste = ? "
					+ "ORDER BY p.jour DESC, p.from_T ASC";

			PreparedStatement preSt = connexion.prepareStatement(query);
			preSt.setInt(1, dentisteId);

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
				rendezVous.setPatient(patientDAO.getById(rs.getInt("id_patient")));
				rendezVous.setPlannification(plannificationDAO.getById(rs.getInt("id_plannification")));

				lesRendezVous.add(rendezVous);
			}

			return lesRendezVous;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
