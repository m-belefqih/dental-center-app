package com.entities;

public class Patient {
	
	// Fields
	private int id;
	private String email;
	private String password;
	private String cin;
	private String prenom;
	private String nom;
	private String birthDate;
	private String sexe;
	private String telephone;
	private String adresse;
	
	// Default Constructor
	public Patient() {
		super();
	}

	// Constructor receives all fields
	public Patient(int id, String email, String password, String cin, String prenom, String nom, String birthDate,
			String sexe, String telephone, String adresse) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.cin = cin;
		this.prenom = prenom;
		this.nom = nom;
		this.birthDate = birthDate;
		this.sexe = sexe;
		this.telephone = telephone;
		this.adresse = adresse;
	}

	// Constructor receives 9 fields (without an id)
	public Patient(String email, String password, String cin, String prenom, String nom, String birthDate, String sexe,
			String telephone, String adresse) {
		super();
		this.email = email;
		this.password = password;
		this.cin = cin;
		this.prenom = prenom;
		this.nom = nom;
		this.birthDate = birthDate;
		this.sexe = sexe;
		this.telephone = telephone;
		this.adresse = adresse;
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

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getSexe() {
		return sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
	
	@Override
	public String toString() {
		return "Patient [id=" + id + ", email=" + email + ", password=" + password + ", cin=" + cin + ", prenom="
				+ prenom + ", nom=" + nom + ", birthDate=" + birthDate + ", sexe=" + sexe + ", telephone=" + telephone
				+ ", adresse=" + adresse + "]";
	}

	public static void main(String[] args) {
		
		Patient patient = new Patient();
		
		patient.setId(1);
		patient.setEmail("mobe@gmail.com");
		patient.setPassword("belefqih1234");
		patient.setCin("LBF78QA");
		patient.setPrenom("Mohammed");
		patient.setNom("Belefqih");
		patient.setBirthDate("2003-01-01");
		patient.setSexe("Homme");
		patient.setTelephone("009750413948");
		patient.setAdresse("Hay Andalouss");

		System.out.println(patient); // patient.toString()
	}
	
}
