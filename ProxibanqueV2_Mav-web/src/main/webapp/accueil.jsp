 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Accueil</title>
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
          <li class="active"><a href="#">Accueil</a></li>
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
	<img src="img/logo2.png" alt="Proxibanque" width="100%">
	<center><h4>Bonjour, <c:out value= "${cons.prenomCons}"/> <c:out value= "${cons.nomCons}"/> </h4></center>	
    </div>

    <div class="col-sm-10 tomove">
		<br>
	  <h2>Liste de vos clients</h2>
	  <br>
	  <c:if test="${erreur == 'NoSelection'}">
	  	<div class="alert alert-danger">
  			<strong>Attention !</strong> Vous n'avez pas sélectionné de client.
		</div>
	 </c:if>
	 <c:if test="${validvirement == 'Le virement a bien été pris en compte.'}">
	  	<div class="alert alert-success">
  			Le virement a bien été pris en compte.
		</div>
	 </c:if>
	 <c:if test="${validmodifs == 'Les modifications ont bien été prises en compte.'}">
	  	<div class="alert alert-success">
  			Les modifications ont bien été prises en compte.
		</div>
	 </c:if>
      <br>	
	  <p> Pour rechercher un client particulier, veuillez utiliser la barre de recherche ci-dessous. </p>
	  <input class="form-control" id="myInput" type="text" placeholder="Rechercher..">
	  <br>	<br>
	  <p> Sélectionnez le client sur lequel réaliser l'opération de gestion, puis choisissez une des options suivantes : </p>
	  <form action="AccueilServlet" method = "POST">
	  <input type="submit" class="btn btn-default" name="action" value="Modifier les informations du client"></input>
	  <input type="submit" class="btn btn-default" name="action" value="Voir les comptes du client"></input>
	  <input type="submit" class="btn btn-default"name="action" value="Effectuer un virement"></input>
	  <br>	<br>  
	  <p><b>Clients particulier : </b></p>       
		  <table class="table table-hover">
			<thead>
			  <tr>
				<th></th>
				<th>ID</th>
				<th>Nom</th>
				<th>Prénom</th>
				<th>Adresse</th>
				<th>Téléphone</th>
				<th>Email</th>
			  </tr>
			</thead>
			<tbody id="myTable">
			  <c:forEach items="${cons.listeCli}" var="cli">
			  <c:if test="${cli.typeClient==9}">
				  <tr>
					<td class="vcenter"><input type="radio" name="optradio" value="P${cli.idCli}"></td>
					<td><c:out value= "${cli.idCli}"/></td>
					<td><c:out value= "${cli.nomCli}"/></td>
					<td><c:out value= "${cli.prenomCli}"/></td>
					<td><c:out value= "${cli.adresse}"/> <c:out value= "${cli.codePostal}"/> <c:out value= "${cli.ville}"/></td>
					<td><c:out value= "${cli.telephone}"/></td>
					<td><c:out value= "${cli.email}"/></td>
				  </tr>	
				</c:if>		  
			  </c:forEach>
			</tbody>
		  </table>
	<br>	<br>
		<p><b>Clients entreprise : </b></p>        
		  <table class="table table-hover">
			<thead>
			  <tr>
				<th></th>
				<th>ID</th>
				<th>Raison Sociale</th>
				<th>SIRET</th>
				<th>Adresse</th>
				<th>Téléphone</th>
				<th>Email</th>
			  </tr>
			</thead>
			<tbody id="myTable">
			  <c:forEach items="${cons.listeCli}" var="cli2">
			  <c:if test="${cli2.typeClient==7}">
				  <tr>
					<td class="vcenter"><input type="radio" name="optradio" value="E${cli2.idCli}"></td>
					<td><c:out value= "${cli2.idCli}"/></td>
					<td><c:out value= "${cli2.raisonSociale}"/></td>
					<td><c:out value= "${cli2.nSiret}"/></td>
					<td><c:out value= "${cli2.adresse}"/> <c:out value= "${cli2.codePostal}"/> <c:out value= "${cli2.ville}"/></td>
					<td><c:out value= "${cli2.telephone}"/></td>
					<td><c:out value= "${cli2.email}"/></td>
				  </tr>
				  </c:if>				  
			  </c:forEach>
			</tbody>
		  </table>
		</form>
	</div>
  </div>	
</div>
</div>




</body>
</html>
