package fr.proxibanque.proxibanquev2.service;

import java.util.List;

import fr.proxibanque.proxibanquev2.dao.ClientDao;
import fr.proxibanque.proxibanquev2.domaine.Client;
import fr.proxibanque.proxibanquev2.domaine.Compte;
import fr.proxibanque.proxibanquev2.domaine.Conseiller;

/**
 * @author Loriane & Hattmann
 * La classe ClientService g�re la gestion des clients.
 * Elle regroupe les m�thodes permettant de :
 *  - mettre � jour un client : updateClient
 *  - r�cup�rer la liste des clients d'un conseiller particulier : getListCliByCons
 *  - r�cup�rer un objet Client � l'aide de son idClient : getClientbyIdcli
 */
public class ClientService {

	/**
	 * Cette m�thode a pour objectif d'obtenir la liste des clients sous la responsabilit� d'un conseiller.
	 * @param cons, un Conseiller
	 * @return List<Client>, une liste d'objets Client
	 */
	public List<Client> getListCliByCons(Conseiller cons) {
		
		ClientDao clid = new ClientDao();
		CompteService cs = new CompteService();
		List<Client> listeClients = clid.getListCliByCons(cons);
		
		for (Client client : listeClients) {
			List<Compte> listeC = cs.getComptesbyClient(client);
			client.setListeComptes(listeC);
		}
		
		return listeClients;
		
	}
	
	
	/**
	 * Cette m�thode a pour objectif d'obtenir un objet Client � l'aide de son idClient.
	 * Elle permet d'obtenir un client en appelant la m�thode getClientByIdcli de la classe ClientDao,
	 * puis elle appelle la m�thode getComptesbyClient de CompteService pour attribuer � ce client
	 * la liste des comptes qui lui sont associ�s.
	 * @param idcli
	 * @return un objet Client
	 */
	public Client getClientbyIdcli(int idcli) {
				
			ClientDao cld = new ClientDao();
			CompteService cpts = new CompteService();
			
			Client client = cld.getClientByIdcli(idcli);
			
			if (client != null) {
				List<Compte> listeComptes = cpts.getComptesbyClient(client);
				
				client.setListeComptes(listeComptes);
			}
			
			return client;
	}
	
	
	/**
	 * Cette m�thode a pour objectif de mettre � jour les donn�es d'un client dans la base de donn�es,
	 * en appelant la m�thode de la classe ClientDao updateClient.
	 * @param cl, un Client
	 */
	public void updateClient(Client cl) {
		ClientDao cld = new ClientDao();
		cld.updateClient(cl);
	}
	
}
