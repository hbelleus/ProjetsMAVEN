 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ page import="fr.proxibanque.proxibanquev2.domaine.Client" %>	
  <%@ page import="fr.proxibanque.proxibanquev2.domaine.Compte" %>
  <%@ page import="fr.proxibanque.proxibanquev2.domaine.CompteCourant" %>
  <%@ page import="fr.proxibanque.proxibanquev2.domaine.CompteEpargne" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Voir les comptes</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/main.css">
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
</head>
<body>

  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar2">
          <span class="sr-only">Navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand"><img src="img/logo.png" alt="Proxibanque">
        </a>
      </div>
      <div id="navbar2" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="accueil.jsp">Accueil</a></li>
          <li><a href="DeconnecterServlet">Se déconnecter</a></li>
        </ul>
      </div>
      <!--/.nav-collapse -->
    </div>
    <!--/.container-fluid -->
  </nav>


<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-2 sidenav">
	<img src="img/logo2.png" alt="Proxibanque" width="100%" margi>
	<center><h4>Bonjour, <c:out value= "${cons.prenomCons}"/> <c:out value= "${cons.nomCons}"/> </h4></	center>	
    </div>

    <div class="col-sm-10 tomove">
		<br>
	  <h2>Comptes bancaires du client n°<c:out value= "${cli.idCli}"/></h2>
      <br>	
      <c:if test="${cli.typeClient == 9}">
	  <p><c:out value="${cli.prenomCli}"/> <c:out value="${cli.nomCli}"/>, résidant au <c:out value="${cli.adresse}"/> <c:out value="${cli.codePostal}"/> <c:out value="${cli.ville}"/>.</p>
	  </c:if>
	  <c:if test="${cli.typeClient == 7}">
	  <p>Entreprise <c:out value="${cli.raisonSociale}"/>, n°SIRET <c:out value="${cli.nSiret}"/>. Siège social : <c:out value="${cli.adresse}"/> <c:out value="${cli.codePostal}"/> <c:out value="${cli.ville}"/>.</p>
	  </c:if>
	  <br>
		  <a href="accueil.jsp" class="btn btn-info btn-lg retour pull-right">
			  <span class="glyphicon"></span> Retour
			</a>
	  <br><br><br><br>	
		<div class="table-responsive">          
		  <table class="table table-hover">
			<thead>
			  <tr align="center">
				<th>Type de compte</th>
				<th>Numéro de compte</th>
				<th>Solde disponible</th>
				<th>Détails</th>
			  </tr>
			</thead>
			<tbody id="myTable">
			<%	HttpSession maSession = request.getSession();
				Client cli = (Client) maSession.getAttribute("cli");
				
				for(Compte cpt : cli.getListeComptes()) {
					String numCompte = cpt.getNumCompte();
					String typeCompte = numCompte.substring(1,2);
					float solde = cpt.getSolde();
		  			if (typeCompte.equals("1")) {
		  				CompteCourant cc = (CompteCourant) cpt;	%>	
		  				<tr><td>Compte Courant</td>
		  				<td><%=numCompte%></td>
		  				<td><%=solde%> €</td>
		  				<td>Découvert autorisé : <%=cc.getDecouvert()%> €</td></tr>
		  			<%
		  			}
		  			else{  
		  				CompteEpargne ce = (CompteEpargne) cpt;%>
		  				<tr><td>Compte Epargne</td>
		  				<td><%=numCompte%></td>
		  				<td><%=solde%> €</td>
		  				<td>Taux de Rémunération : <%=ce.getTauxRem()*100%> %</td></tr>
		  			<%
		  			}
					}%>
			</tbody>
		  </table>
		  </div>
    </div>
  </div>	
</div>


</body>
</html>
