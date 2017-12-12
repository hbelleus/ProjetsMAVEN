package fr.proxibanque.proxibanquev2.domaine;

import java.util.List;


/**
 * @author Loriane & Hattmann
 * La classe Client est la classe-mère des classes ClientEntreprise et ClientService.
 * Un objet Client a pour attributs une adresse, code postal, ville, un numéro de téléphone, un email
 * et est relié à une liste de comptes (CompteCourant, CompteEpargne), et un Conseiller.
 * Un attribut typeClient permet quant à lui de définir par la suite s'il s'agira d'un client entreprise
 * ou d'un client particulier.
 */
public abstract class Client {
	
	// Attributes
		private int idCli;
		private int typeClient;
		private String adresse;
		private String codePostal;
		private String ville;
		private String telephone;
		private String email;
		private Conseiller conseiller;
		private List<Compte> listeComptes;
		
		//Constructeurs
		public Client(int idCli, int typeClient, String adresse, String codePostal, String ville, String telephone, String email, 
				Conseiller conseiller, List<Compte> listeComptes) {
			super();
			this.idCli = idCli;
			this.typeClient=typeClient;
			this.adresse = adresse;
			this.codePostal = codePostal;
			this.ville = ville;
			this.telephone = telephone;
			this.email = email;
			this.conseiller = conseiller;
			this.listeComptes = listeComptes;
		}
		
		public Client(int idCli, int typeClient, String adresse, String codePostal, String ville, String telephone, String email, 
				Conseiller conseiller) {
			super();
			this.idCli = idCli;
			this.typeClient=typeClient;
			this.adresse = adresse;
			this.codePostal = codePostal;
			this.ville = ville;
			this.telephone = telephone;
			this.email = email;
			this.conseiller = conseiller;
		}

		public Client(int idCli, int typeClient, String adresse, String codePostal, String ville, String telephone, String email) {
			super();
			this.idCli = idCli;
			this.typeClient=typeClient;
			this.adresse = adresse;
			this.codePostal = codePostal;
			this.ville = ville;
			this.telephone = telephone;
			this.email = email;
		}

		//Getters & Setters
		public int getIdCli() {
			return idCli;
		}

		public void setIdCli(int idCli) {
			this.idCli = idCli;
		}

		public int getTypeClient() {
			return typeClient;
		}

		public void setTypeClient(int typeClient) {
			this.typeClient = typeClient;
		}

		public String getAdresse() {
			return adresse;
		}

		public void setAdresse(String adresse) {
			this.adresse = adresse;
		}

		public String getCodePostal() {
			return codePostal;
		}

		public void setCodePostal(String codePostal) {
			this.codePostal = codePostal;
		}

		public String getVille() {
			return ville;
		}

		public void setVille(String ville) {
			this.ville = ville;
		}

		public String getTelephone() {
			return telephone;
		}

		public void setTelephone(String telephone) {
			this.telephone = telephone;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public Conseiller getConseiller() {
			return conseiller;
		}

		public void setConseiller(Conseiller conseiller) {
			this.conseiller = conseiller;
		}

		public List<Compte> getListeComptes() {
			return listeComptes;
		}

		public void setListeComptes(List<Compte> listeComptes) {
			this.listeComptes = listeComptes;
		}
		
		
		
		
		
		
	
}
