package fr.proxibanque.proxibanquev2.domaine;

/**
 * @author Loriane & Hattmann
 * La classe permet l'instanciation d'un objet de type CompteEpargne qui est notamment caractérisé par un
 * taux de rémunération (par défaut 3%).
 */
public class CompteEpargne extends Compte {
	
	
	private float tauxRem = 0.03F ;

	//Constructeur
	public CompteEpargne(String numCompte, float solde, String dateOuv, Client client, float tauxRem) {
		super(numCompte, solde, dateOuv, client);
		this.tauxRem = tauxRem;
	}
	
	public CompteEpargne() {
		super();
	}


	//Getters & Setters
	public float getTauxRem() {
		return tauxRem;
	}

	public void setTauxRem(float tauxRem) {
		this.tauxRem = tauxRem;
	} 
	
	
	
	

}
