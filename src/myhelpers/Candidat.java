package myhelpers;

import java.io.Serializable;

public class Candidat implements Serializable {


	private String email;
	private String nom;
	private String prenom;
	private double note;
	private String motPasse;

	public Candidat() {
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public void setNote(double note) {
		this.note = note;
	}

	public void setMotPasse(String motPasse) {
		this.motPasse = motPasse;
	}

	public String getEmail() {
		return email;
	}

	public String getNom() {
		return nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public double getNote() {
		return note;
	}

	public String getMotPasse() {
		return motPasse;
	}

	@Override
	public String toString() {
		return "Candidat[email : " + email + ", Nom : " + nom + ", Prenom : "
				+ prenom + "]";
	}
}