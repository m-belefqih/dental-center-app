package com.dao;

import java.util.List;

import com.entities.Plannification;

public interface PlannificationDAO {
	
	public List<Plannification> getAll();
	
	public Plannification getById(int id);
	
}
