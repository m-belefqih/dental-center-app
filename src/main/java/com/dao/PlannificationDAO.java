package com.dao;

import java.util.List;

import com.entities.Plannification;

public interface PlannificationDAO {
	
	public boolean create(Plannification plannification);
	
	public List<Plannification> getAll();
	
	public Plannification getById(int id);
	
	public boolean isPlanned(String jour);
	
}
