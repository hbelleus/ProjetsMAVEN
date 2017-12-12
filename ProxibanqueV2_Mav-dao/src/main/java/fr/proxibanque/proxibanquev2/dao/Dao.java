/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.proxibanque.proxibanquev2.dao;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *	La classe Dao regroupe toutes les m�thodes g�n�riques � la Dao :
 * - se connecter
 * - se d�connecter
 * Ces deux m�thodes sont statiques.
 * @author Admin
 */
public class Dao {

	private static final String pilote = "oracle.jdbc.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:XE";

	private static final String utilisateur = "Hattmann";
	private static final String password = "hattmann";
	
	/**
	 * La m�thode seConnecter permet de cr�er une connexion � la base de donn�es.
	 * @return une Connection
	 */
	public static Connection seConnecter() {
		// 1- Declaration d'une variable de type connection
		Connection cnx = null;
		try {
			// TODO code application logic here
			// 2- Chargement d'une connection
			Class.forName(pilote);
			// 3-Creation d'une connection
			cnx = DriverManager.getConnection(url, utilisateur, password);

		} catch (SQLException | ClassNotFoundException ex) {
			Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
		}
		// 4- retour
		return cnx;
	}

	/**
	 * La m�thode permet de se d�connecter de la base de donn�es.
	 * @param cnx
	 */
	public static void seDeconnecter(Connection cnx) {
		try {
			cnx.close();
		} catch (SQLException ex) {
			Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}


}
