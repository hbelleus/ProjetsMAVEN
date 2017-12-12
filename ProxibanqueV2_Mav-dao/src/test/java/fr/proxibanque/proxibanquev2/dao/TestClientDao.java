package fr.proxibanque.proxibanquev2.dao;

import static org.hamcrest.core.IsInstanceOf.*;
import static org.hamcrest.core.IsSame.*;
import static org.junit.Assert.assertThat;
import static org.hamcrest.core.IsCollectionContaining.*;
import static org.hamcrest.core.Is.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import fr.proxibanque.proxibanquev2.domaine.Client;
import fr.proxibanque.proxibanquev2.domaine.ClientEntreprise;
import fr.proxibanque.proxibanquev2.domaine.Conseiller;

public class TestClientDao {

	@Test
	public void TestTypeGetListCliByCons() {
		
		Connection cnx = Dao.seConnecter();
		
		ClientDao cd = new ClientDao();
		
		Conseiller testConseiller = new Conseiller("psanchez","tata","Pierre","Sanchez"); 
		List<Client> testClients= new ArrayList<Client>();
		
		assertThat(cd.getListCliByCons(testConseiller),sameInstance(testClients));
		
		Dao.seDeconnecter(cnx);
		
		//conseiller values ('psanchez','tata','Pierre','Sanchez');
		//client values(sequencecli.nextval,'entreprise',null,null,'123 Multimedia',79807337500031,'85 place de la Republique',33000,'BORDEAUX','0486746478','contact@123multimedia.com','psanchez')
		
	}
	
	@Test
	public void TestGetListCliByCons() {
		
		Connection cnx = Dao.seConnecter();
		
		ClientDao cd = new ClientDao();
		
		Conseiller testConseiller = new Conseiller("psanchez","tata","Pierre","Sanchez"); 
		List<Client> testClients= cd.getListCliByCons(testConseiller);
		
		System.out.println(testClients);
		
		//ClientEntreprise(idcli,0,adresse,codepostal,ville,telephone,email,conseiller,raisons,siret)
		ClientEntreprise testClient= new ClientEntreprise(12,7,"85 place de la Republique","33000","BORDEAUX","0486746478","contact@123multimedia.com",testConseiller,"123 Multimedia","79807337500031");
		System.out.println(testClient);
		
		assertThat(testClients,hasItem(testClient));
		
		Dao.seDeconnecter(cnx);
		//conseiller values ('psanchez','tata','Pierre','Sanchez');
		//client values(sequencecli.nextval,'entreprise',null,null,'123 Multimedia',79807337500031,'85 place de la Republique',33000,'BORDEAUX','0486746478','contact@123multimedia.com','psanchez')
		
	}
	
	@Test
	public void TestSizeListCliByCons() {
		
		Connection cnx = Dao.seConnecter();
		
		ClientDao cd = new ClientDao();
		
		Conseiller testConseiller = new Conseiller("psanchez","tata","Pierre","Sanchez"); 
		List<Client> testClients= cd.getListCliByCons(testConseiller);
		
		System.out.println(testClients);
		
		int ListeSize = testClients.size();
		
		assertThat(ListeSize,is(9));
		
		Dao.seDeconnecter(cnx);
		//conseiller values ('psanchez','tata','Pierre','Sanchez');
		//client values(sequencecli.nextval,'entreprise',null,null,'123 Multimedia',79807337500031,'85 place de la Republique',33000,'BORDEAUX','0486746478','contact@123multimedia.com','psanchez')
		
	}
	
	//ClientEntreprise [raisonSociale=123 Multimedia, nSiret=79807337500031idCli=12, typeClient=7, adresse=85 place de la Republique, codePostal=33000, ville=BORDEAUX, telephone=0486746478, email=contact@123multimedia.com, conseiller=Conseiller [loginCons=psanchez, password=tata, nomCons=Pierre, prenomCons=Sanchez]]
	//ClientEntreprise [raisonSociale=123 Multimedia, nSiret=79807337500031idCli=12, typeClient=7, adresse=85 place de la Republique, codePostal=33000, ville=BORDEAUX, telephone=0486746478, email=contact@123multimedia.com, conseiller=Conseiller [loginCons=psanchez, password=tata, nomCons=Pierre, prenomCons=Sanchez]]

}
