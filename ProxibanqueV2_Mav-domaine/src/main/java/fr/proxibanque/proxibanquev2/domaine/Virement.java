package fr.proxibanque.proxibanquev2.domaine;

/**
 * @author Loriane & Hattmann
 * Cette classe permettra l'instanciation d'un objet de type Virement, caract�ris� par ses attributs :
 *  - un conseiller (celui qui a r�alis� le virement)
 *  - un compte �metteur
 *  - un compte r�cepteur
 *  - une date de virement
 *  - un libell�
 *  
 */
public class Virement {

	private Conseiller conseiller;
	private Compte compteEmetteur;
	private Compte compteCible;
	private float montantVirement;
	private String dateVirement;
	private String libelle;
	
	//Constructeur
	public Virement(Conseiller conseiller, Compte compteEmetteur, Compte compteCible, float montantVirement,
			String dateVirement, String libelle) {
		super();
		this.conseiller = conseiller;
		this.compteEmetteur = compteEmetteur;
		this.compteCible = compteCible;
		this.montantVirement = montantVirement;
		this.dateVirement = dateVirement;
		this.libelle = libelle;
	}

	public Conseiller getConseiller() {
		return conseiller;
	}

	public void setConseiller(Conseiller conseiller) {
		this.conseiller = conseiller;
	}

	public Compte getCompteEmetteur() {
		return compteEmetteur;
	}

	public void setCompteEmetteur(Compte compteEmetteur) {
		this.compteEmetteur = compteEmetteur;
	}

	public Compte getCompteCible() {
		return compteCible;
	}

	public void setComptecible(Compte compteCible) {
		this.compteCible = compteCible;
	}

	public float getMontantVirement() {
		return montantVirement;
	}

	public void setMontantVirement(float montantVirement) {
		this.montantVirement = montantVirement;
	}

	public String getDateVirement() {
		return dateVirement;
	}

	public void setDateVirement(String dateVirement) {
		this.dateVirement = dateVirement;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	
	
}
