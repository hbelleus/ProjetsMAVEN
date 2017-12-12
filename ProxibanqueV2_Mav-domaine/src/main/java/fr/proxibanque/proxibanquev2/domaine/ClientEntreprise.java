package fr.proxibanque.proxibanquev2.domaine;

import java.util.List;

/**
 * @author Loriane & Hattmann
 * La classe permet l'instanciation d'un objet de type ClientParticulier, avec pour attributs notamment une raison
 * sociale et un nSiret.
 * La classe h�rite de la classe Client.
 * La valeur de la constante TYPE_CLIENT_ENTREPRISE lui est attribu�e lors de l'instanciation comme valeur de
 * l'attribut typeClient.
 */
public class ClientEntreprise extends Client {
	
	private String raisonSociale ;
	private String nSiret ;
	public static final int TYPE_CLIENT_ENTREPRISE = 7;
	
	
	//Constructeurs
	public ClientEntreprise(int idCli, int typeClient, String adresse, String codePostal, String ville, String telephone,
			String email, Conseiller conseiller, List<Compte> listeComptes, String raisonSociale, String nSiret) {
		super(idCli, ClientEntreprise.TYPE_CLIENT_ENTREPRISE, adresse, codePostal, ville, telephone, email, conseiller, listeComptes);
		this.raisonSociale = raisonSociale;
		this.nSiret = nSiret;
	}

	

	public ClientEntreprise(int idCli, int typeClient, String adresse, String codePostal, String ville,
			String telephone, String email, Conseiller conseiller, String raisonSociale, String nSiret) {
		super(idCli, ClientEntreprise.TYPE_CLIENT_ENTREPRISE, adresse, codePostal, ville, telephone, email, conseiller);
		this.raisonSociale = raisonSociale;
		this.nSiret = nSiret;
	}



	public ClientEntreprise(int idCli, int typeClient, String adresse, String codePostal, String ville,
			String telephone, String email, String raisonSociale, String nSiret) {
		super(idCli, ClientEntreprise.TYPE_CLIENT_ENTREPRISE, adresse, codePostal, ville, telephone, email);
		this.raisonSociale = raisonSociale;
		this.nSiret = nSiret;
	}

	//Getters & Setters
	public String getRaisonSociale() {
		return raisonSociale;
	}


	public void setRaisonSociale(String raisonSociale) {
		this.raisonSociale = raisonSociale;
	}


	public String getnSiret() {
		return nSiret;
	}


	public void setnSiret(String nSiret) {
		this.nSiret = nSiret;
	}
	
	
	
	
	
	


}
