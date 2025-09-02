package com.entities;

public class RendezVous {
	
	// Fields
	private int id;
	private String dateRDV;
	private String motifRDV;
	private String actes;
	private String examensRadio;
	private String traitements;
	private Patient patient;
	private Plannification plannification;
	
	// Default Constructor
	public RendezVous() {
		super();
	}
	
	// Constructor receives all fields
	public RendezVous(int id, String dateRDV, String motifRDV, String actes, String examensRadio, String traitements) {
		super();
		this.id = id;
		this.dateRDV = dateRDV;
		this.motifRDV = motifRDV;
		this.actes = actes;
		this.examensRadio = examensRadio;
		this.traitements = traitements;
 
	}
	
	// Constructor receives 5 fields (without the id & the patient)
	public RendezVous(String dateRDV, String motifRDV, String actes, String examensRadio, String traitements) {
		super();
		this.dateRDV = dateRDV;
		this.motifRDV = motifRDV;
		this.actes = actes;
		this.examensRadio = examensRadio;
		this.traitements = traitements;
	}
	
	// Constructor receives 5 fields (without the dateRDV & the patient)
	public RendezVous(int id, String motifRDV, String actes, String examensRadio, String traitements) {
		super();
		this.id = id;
		this.motifRDV = motifRDV;
		this.actes = actes;
		this.examensRadio = examensRadio;
		this.traitements = traitements;
	}
	
	// Getters & Setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDateRDV() {
		return dateRDV;
	}
	public void setDateRDV(String dateRDV) {
		this.dateRDV = dateRDV;
	}
	public String getMotifRDV() {
		return motifRDV;
	}
	public void setMotifRDV(String motifRDV) {
		this.motifRDV = motifRDV;
	}
	public String getActes() {
		return actes;
	}
	public void setActes(String actes) {
		this.actes = actes;
	}
	public String getExamensRadio() {
		return examensRadio;
	}
	public void setExamensRadio(String examensRadio) {
		this.examensRadio = examensRadio;
	}
	public String getTraitements() {
		return traitements;
	}
	public void setTraitements(String traitements) {
		this.traitements = traitements;
	}
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Plannification getPlannification() {
		return plannification;
	}

	public void setPlannification(Plannification plannification) {
		this.plannification = plannification;
	}

	@Override
	public String toString() {
		return "RendezVous [id=" + id + ", dateRDV=" + dateRDV + ", motifRDV=" + motifRDV + ", actes=" + actes
				+ ", examensRadio=" + examensRadio + ", traitements=" + traitements + ", patient=" + patient + "]";
	}
	
}
