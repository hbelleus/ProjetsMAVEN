package fr.proxibanque.proxibanquev2.domaine;

/**
 * @author Loriane & Hattmann
 * La classe permet l'instanciation d'un objet de type CompteCourant qui est notamment caractérisé par une
 * autorisation de découvert (par défaut 500€).
 */
public class CompteCourant extends Compte {

	private float decouvert = 500.00F ;

	//Constructeur
	public CompteCourant(String numCompte, float solde, String dateOuv, Client client, float decouvert) {
		super(numCompte, solde, dateOuv, client);
		this.decouvert = decouvert;
	}

	public CompteCourant() {
		super();
	}

	//Getters & Setters
	public float getDecouvert() {
		return decouvert;
	}

	public void setDecouvert(float decouvert) {
		this.decouvert = decouvert;
	} 
	
	
	

}
