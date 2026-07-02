package com.dao;

import java.util.List;

import com.entities.RendezVous;

public interface RendezVousDAO {

	public boolean update(RendezVous rendezVous);

	public boolean create(RendezVous rendezVous);

	public List<RendezVous> getAllByDentiste(int dentisteId);

}
