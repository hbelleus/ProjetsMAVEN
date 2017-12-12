package fr.proxibanque.proxibanquev2.service;

import fr.proxibanque.proxibanquev2.dao.CompteDao;
import fr.proxibanque.proxibanquev2.dao.VirementDao;
import fr.proxibanque.proxibanquev2.domaine.Compte;
import fr.proxibanque.proxibanquev2.domaine.CompteCourant;
import fr.proxibanque.proxibanquev2.domaine.Virement;

/**
 * @author adminl
 * Cette classe permet la gestion des virements.
 */
public class VirementService {

	/**
	 * Cette m�thode permet de r�aliser un virement
	 * @param virement
	 * @throws ExceptionVirement : si le compte �metteur n'a pas un solde suffisant, la m�thode renvoie une erreur 
	 */
	public void realiserVirement(Virement virement) throws ExceptionVirement {

		Compte compteEmetteur = virement.getCompteEmetteur();
		Compte compteCible = virement.getCompteCible();

		float soldeCompteEmetteur = compteEmetteur.getSolde();
		float soldeCompteCible = compteCible.getSolde();
		float montantVirement = virement.getMontantVirement();

		if (soldeCompteEmetteur < 0 || montantVirement > soldeCompteEmetteur)
			throw new ExceptionVirement(
					"Le virement n'est pas r�alisable.\n V�rifiez que le solde du compte �metteur soit suffisant.");
		else {

			float newSoldeCompteEmetteur = soldeCompteEmetteur - montantVirement;
			float newSoldeCompteCible = soldeCompteCible + montantVirement;

			CompteDao cD = new CompteDao();
			VirementDao vD = new VirementDao();

			if(compteEmetteur instanceof CompteCourant) {
				cD.updateCompteCourant(compteEmetteur, newSoldeCompteEmetteur);
			}
			else {
				cD.updateCompteEpargne(compteEmetteur, newSoldeCompteEmetteur);
			}
			
			if(compteCible instanceof CompteCourant) {
				cD.updateCompteCourant(compteCible, newSoldeCompteCible);
			}
			else {
				cD.updateCompteEpargne(compteCible, newSoldeCompteCible);
			}

			vD.insertVirement(virement);

		}

	}

}
