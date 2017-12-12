package fr.proxibanque.proxibanquev2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import fr.proxibanque.proxibanquev2.domaine.Conseiller;

/**
 * @author Loriane
 * Cette classe regroupe toutes les m�thodes permettant la gestion de la base de donn�es des conseillers.
 */
public class ConseillerDao {

	
	   
	   
	//access
	/**
	 * Cette m�thode permet d'obtenir un objet de type Conseiller avec son login.
	 * @param login
	 */
    public Conseiller getConsByLogin(String login) {

        Connection cnx;
        cnx = Dao.seConnecter();
            
        Conseiller cons = new Conseiller();
            
        try {
            
            Statement st = cnx.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            String sql = "select * from conseiller where upper(logincons) = upper('"+login+"')";
            ResultSet rs = st.executeQuery(sql);
            if(rs.first()) {
                cons = new Conseiller(
                login,
                rs.getString(2),
                rs.getString(4),
                rs.getString(3));
            }
           
        } catch (SQLException ex) {
            Logger.getLogger(ConseillerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
 
        Dao.seDeconnecter(cnx);
            
        return cons;
        
    }
	   

}
