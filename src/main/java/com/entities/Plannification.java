package com.entities;

public class Plannification {
	
	// Fields
	private int id;
	private String jour;
	private String from_T;
	private String to_T;
	private Dentiste dentiste;
	private Admin admin;
	
	// Default Constructor
	public Plannification() {
		super();
	}



	// Getters & Setters
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getJour() {
		return jour;
	}
	
	public void setJour(String jour) {
		this.jour = jour;
	}
	
	public String getFrom_T() {
		return from_T;
	}
	
	public void setFrom_T(String from_T) {
		this.from_T = from_T;
	}
	
	public String getTo_T() {
		return to_T;
	}
	
	public void setTo_T(String to_T) {
		this.to_T = to_T;
	}
	
	public Dentiste getDentiste() {
		return dentiste;
	}
	
	public void setDentiste(Dentiste dentiste) {
		this.dentiste = dentiste;
	}
	
	public Admin getAdmin() {
		return admin;
	}
	
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	
}
