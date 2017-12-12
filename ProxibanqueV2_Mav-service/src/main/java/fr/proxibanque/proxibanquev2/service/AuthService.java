package fr.proxibanque.proxibanquev2.service;

import fr.proxibanque.proxibanquev2.dao.ConseillerDao;
import fr.proxibanque.proxibanquev2.domaine.Conseiller;

/**
 * Cette classe g�re les m�thodes permettant l'authentification du conseiller.
 * @author Loriane & Hattmann
 *
 */
public class AuthService {

	/**
	 * Cette m�thode a pour objectif de v�rifier si les param�tres du conseiller en entr�e (login, mot de passe)
	 * correspondent � ceux de la base.
	 * La m�thode cr�e un nouvel objet Conseiller en utilisant le login donn� et en appelant la m�thode de la 
	 * classe ConseillerDao getConsByLogin.
	 * Elle compare ensuite le mot de passe de ce conseiller au mot de passe donn� en param�tre d'entr�e.
	 * Si c'est les m�mes, l'authentification est OK, on renvoie true. Sinon, false.
	 * @param cons, un objet Conseiller
	 * @return un boolean : vrai si l'authentification est correcte, faux sinon.
	 */
	public boolean authOK(Conseiller cons) {
		boolean result = false;
		ConseillerDao cd = new ConseillerDao();
		
		String passwordInsere = cons.getPassword();
		String loginInsere = cons.getLoginCons();
		
		Conseiller cons2 = cd.getConsByLogin(loginInsere);
		
		if (cons2.getPassword() != null && cons2.getPassword().equals(passwordInsere)) {
			result = true;
		}
		
		return result;
	}

}
