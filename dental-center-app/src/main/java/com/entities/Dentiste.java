package com.entities;

public class Dentiste {
	
	// Fields
	private int id;
	private String email;
	private String password;
	private String cin;
	private String prenom;
	private String nom;
	private String specialty;
	
	// Default Constructor
	public Dentiste() {
		super();
	}
	
	// Constructor receives all fields
	public Dentiste(int id, String email, String password, String cin, String prenom, String nom, String specialty) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.cin = cin;
		this.prenom = prenom;
		this.nom = nom;
		this.specialty = specialty;
	}
	
	
	// Constructor receives 6 fields (without an id)
	public Dentiste(String email, String password, String cin, String prenom, String nom, String specialty) {
		super();
		this.email = email;
		this.password = password;
		this.cin = cin;
		this.prenom = prenom;
		this.nom = nom;
		this.specialty = specialty;
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

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	@Override
	public String toString() {
		return "Dentiste [id=" + id + ", email=" + email + ", password=" + password + ", cin=" + cin + ", prenom="
				+ prenom + ", nom=" + nom + ", specialty=" + specialty + "]";
	}
	
	public static void main(String[] args) {
		
		Dentiste dentiste = new Dentiste();
		
		dentiste.setId(1);
		dentiste.setEmail("mobe@gmail.com");
		dentiste.setPassword("1234mohammed");
		dentiste.setCin("LBF78QA");
		dentiste.setPrenom("Mohammed");
		dentiste.setNom("Belefqih");
		dentiste.setSpecialty("Orthodontie");
	 
		System.out.println(dentiste); // dentiste.toString()
	}
	
}
