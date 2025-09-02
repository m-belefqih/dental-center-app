package com.entities;

public class Admin {
	
	// Fields
	private int id;
	private String email;
	private String password;
	private String cin;
	private String prenom;
	private String nom;

	// Default Constructor
	public Admin() {
		super();
	}

	// Constructor receives all fields
	public Admin(int id, String email, String password, String cin, String prenom, String nom) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.cin = cin;
		this.prenom = prenom;
		this.nom = nom;
	}

	// Constructor receives 5 fields (without an id)
	public Admin(String email, String password, String cin, String prenom, String nom) {
		super();
		this.email = email;
		this.password = password;
		this.cin = cin;
		this.prenom = prenom;
		this.nom = nom;
	}

	// Getters & Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}
	
	
	@Override
	public String toString() {
		return "Admin [id=" + id + ", email=" + email + ", password=" + password + ", cin=" + cin + ", prenom=" + prenom
				+ ", nom=" + nom + "]";
	}

	public static void main(String[] args) {
		
	}
}
