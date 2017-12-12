<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
  <%@ page import="fr.proxibanque.proxibanquev2.domaine.ClientEntreprise" %>
  <%@ page import="fr.proxibanque.proxibanquev2.domaine.ClientParticulier" %>
  <%= ClientEntreprise.TYPE_CLIENT_ENTREPRISE %>
  <%= ClientParticulier.TYPE_CLIENT_PARTICULIER %>
  
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Modifier les données client</title>
  <meta charset="utf-8">
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
	  <h2>Editer les informations du client n°<c:out value= "${cli.idCli}"/></h2>
      <br>	
	  Veuillez modifier les informations du client suivant, puis validez.  
		<br><br>
		  <a href="accueil.jsp" class="btn btn-info btn-lg retour pull-right">
			  <span class="glyphicon"></span> Retour
			</a>
	  <br><br>
	  	<c:if test="${cli.typeClient == 9}">
		  <form method = "POST" action="ModifServlet">
			<div class="form-group">
			  <label for="nom">Nom:</label>
			  <input type="text" class="form-control" placeholder="Entrer le nom" name="nom" value="${cli.nomCli}">
			</div>
			<div class="form-group">
			  <label for="prenom">Prénom:</label>
			  <input type="text" class="form-control" placeholder="Entrer le prÃ©nom" name="prenom" value="${cli.prenomCli}">
			</div>
			<div class="form-group">
			  <label for="adresse">Adresse:</label>
			  <input type="text" class="form-control" placeholder="Entrer l'adresse" name="adresse" value="${cli.adresse}">
			</div>
			<div class="form-group">
			  <label for="codepostal">Code postal:</label>
			  <input type="text" class="form-control" placeholder="Entrer le code postal" name="codepostal" value="${cli.codePostal}">
			</div>
			<div class="form-group">
			  <label for="ville">Ville:</label>
			  <input type="text" class="form-control" placeholder="Entrer la ville" name="ville" value="${cli.ville}">
			</div>
			<div class="form-group">
			  <label for="telephone">Téléphone:</label>
			  <input type="tel" class="form-control" placeholder="Entrer le numÃ©ro de tÃ©lÃ©phone" name="telephone" value="${cli.telephone}">
			</div>
			<div class="form-group">
			  <label for="email">Email:</label>
			  <input type="email" class="form-control" placeholder="Entrer l'email" name="email" value="${cli.email}">
			</div>
			<button type="submit" class="btn btn-default">Valider</button>
		  </form>
		 </c:if>
		 
		<c:if test="${cli.typeClient == 7}">
		  <form method = "POST" action="ModifServlet">
			<div class="form-group">
			  <label for="raisonsociale">RaisonSociale:</label>
			  <input type="text" class="form-control" placeholder="Entrer la raison sociale" name="raisonsociale" value="${cli.raisonSociale}">
			</div>
			<div class="form-group">
			  <label for="siret">SIRET:</label>
			  <input type="text" class="form-control" placeholder="Entrer le siret" name="siret" value="${cli.nSiret}">
			</div>
			<div class="form-group">
			  <label for="adresse">Adresse:</label>
			  <input type="text" class="form-control" placeholder="Entrer l'adresse" name="adresse" value="${cli.adresse}">
			</div>
			<div class="form-group">
			  <label for="codepostal">Code postal:</label>
			  <input type="text" class="form-control" placeholder="Entrer le code postal" name="codepostal" value="${cli.codePostal}">
			</div>
			<div class="form-group">
			  <label for="ville">Ville:</label>
			  <input type="text" class="form-control" placeholder="Entrer la ville" name="ville" value="${cli.ville}">
			</div>
			<div class="form-group">
			  <label for="telephone">Téléphone:</label>
			  <input type="tel" class="form-control" placeholder="Entrer le numÃ©ro de tÃ©lÃ©phone" name="telephone" value="${cli.telephone}">
			</div>
			<div class="form-group">
			  <label for="email">Email:</label>
			  <input type="email" class="form-control" placeholder="Entrer l'email" name="email" value="${cli.email}">
			</div>
			<button type="submit" class="btn btn-default">Valider</button>
		  </form>
		 </c:if>
		 
    </div>
  </div>	
</div>




</body>
</html>
