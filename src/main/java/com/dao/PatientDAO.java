package com.dao;

import java.util.List;

import com.entities.Patient;
import com.entities.RendezVous;

public interface PatientDAO extends Idao<Patient> {
	
	public boolean isExist(String email);
	
	public boolean register(Patient patient);
	
	public String getRandom();
	
	public boolean sendEmail(String EMAIL_TO, String CODE);
	
	public List<RendezVous> getAllAppointment(int id);
	
}
