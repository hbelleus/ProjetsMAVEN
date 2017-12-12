package fr.proxibanque.proxibanquev2.domaine;

/**
 * @author Loriane & Hattmann
 * La classe Compte est la classe-mère des classes CompteCourant et CompteEpargne.
 * Un objet Compte a pour attributs un numéro de compte, un solde, une date d'ouverture, et est relié à un Client.
 */
public abstract class Compte {
	
	private String numCompte; 
	private float solde; 
	private String dateOuv;
	private Client client;
	
	//Constructeur
	public Compte(String numCompte, float solde, String dateOuv, Client client) {
		super();
		this.numCompte = numCompte;
		this.solde = solde;
		this.dateOuv = dateOuv;
		this.client = client;
	}
	
	public Compte() {
		super();
	}



	//Getters & Setters
	public String getNumCompte() {
		return numCompte;
	}

	public void setNumCompte(String numCompte) {
		this.numCompte = numCompte;
	}

	public float getSolde() {
		return solde;
	}

	public void setSolde(float solde) {
		this.solde = solde;
	}

	public String getDateOuv() {
		return dateOuv;
	}

	public void setDateOuv(String dateOuv) {
		this.dateOuv = dateOuv;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}
	
	
	
	
	
	
	
}
