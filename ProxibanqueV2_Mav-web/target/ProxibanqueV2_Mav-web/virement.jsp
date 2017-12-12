<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ page import="fr.proxibanque.proxibanquev2.domaine.Client"%>
  <%@ page import="fr.proxibanque.proxibanquev2.domaine.ClientParticulier"%>
   <%@ page import="fr.proxibanque.proxibanquev2.domaine.ClientEntreprise"%>
  <%@ page import="fr.proxibanque.proxibanquev2.domaine.Compte"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Virement</title>
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
	  <h2>Effectuer un virement</h2>
      <br>	
     <c:if test="${memecompte == 'memecompte'}">
	  	<div class="alert alert-danger">
  			<strong>Erreur !</strong> Veuillez sélectionner un compte cible différent du compte émetteur.
		</div>
		<br>
	 </c:if>

	  <c:if test="${cli.typeClient == 9}">
	  <p>Virement depuis le client n°<c:out value="${cli.idCli}"/>, <c:out value="${cli.prenomCli}"/> <c:out value="${cli.nomCli}"/></p>
	  </c:if>
	  <c:if test="${cli.typeClient == 7}">
	  <p>Virement depuis le client n°<c:out value="${cli.idCli}"/>, <c:out value="${cli.raisonSociale}"/>, SIRET n°<c:out value="${cli.nSiret}"/></p>
	  </c:if>
	  
	  <br>	
			<form action="ViremtServlet" method="POST">
			<div class="form-group">
					<select class="form-control" name="compteEmetteur" required> 
						  
				<%	HttpSession maSession = request.getSession();
				Client cli = (Client) maSession.getAttribute("cli");
				
				for(Compte cpt : cli.getListeComptes()) {
					String numCompte = cpt.getNumCompte();
					String typeCompte = numCompte.substring(1,2);
					float solde = cpt.getSolde();
					int typeClient = cli.getTypeClient();
		  			if (typeCompte.equals("1")) {
		  			%>
						<option value= "<%=numCompte%>">Compte Courant n°<%=numCompte%>,
						<% if(typeClient == 7) { 
							ClientEntreprise clientE = (ClientEntreprise) maSession.getAttribute("cli");%> 
							<%=clientE.getRaisonSociale()%>
						<%} else {
							ClientParticulier clientP = (ClientParticulier) maSession.getAttribute("cli");
						%><%=clientP.getPrenomCli()%> <%=clientP.getNomCli()%>	
						<%}%>, Solde : <%=solde%> €</option>
		  			<%  
		  			}
		  			else{ 
			  			%>
							<option value= "<%=numCompte%>">Compte Epargne n°<%=numCompte%>,
						<% if(typeClient == 7) { 
							ClientEntreprise clientE = (ClientEntreprise) maSession.getAttribute("cli");%> 
							<%=clientE.getRaisonSociale()%>
						<%} else {
							ClientParticulier clientP = (ClientParticulier) maSession.getAttribute("cli");
						%><%=clientP.getPrenomCli()%> <%=clientP.getNomCli()%>	
						<%}%>, Solde : <%=solde%> €</option>
		  			<% 
					}
					}%>  
						  
					</select>
			 </div>
			  <p> vers le compte </p>
			   
			  <div class="form-group">
				<input type="search" id="searchBox" class="form-control" placeholder="Rechercher un compte...">
			  </div> 
			  <div class="form-group">
					<select id="comptesatrier" class="form-control" class="whatever" name="compteCible" required> 				
						  <c:forEach items="${allComptesEpargne}" var="compte">
								<option value= "${compte.numCompte}">
										<c:if test="${compte.client.typeClient == 9}">
										  <c:out value="${compte.client.nomCli}"/> <c:out value="${compte.client.prenomCli}"/>
										  </c:if>
										  <c:if test="${compte.client.typeClient == 7}">
										  <c:out value="${compte.client.raisonSociale}"/>
										  </c:if>
								, Compte Epargne n°${compte.numCompte},  Solde : ${compte.solde} €
								</option>		  
						  </c:forEach>
						  <c:forEach items="${allComptesCourant}" var="compte">
								<option value= "${compte.numCompte}">
										<c:if test="${compte.client.typeClient == 9}">
										 <c:out value="${compte.client.nomCli}"/> <c:out value="${compte.client.prenomCli}"/>
										  </c:if>
										  <c:if test="${compte.client.typeClient == 7}">
										  <c:out value="${compte.client.raisonSociale}"/>
										  </c:if>
								, Compte Courant n°${compte.numCompte},  Solde : ${compte.solde} €
								</option>
						  </c:forEach>
				  </select>
			  </div>
			  <br>

				<div class="form-group">
				  <label for="montant">Montant :</label>
				  <input type="number" min="0" step="0.01" class="form-control" placeholder="Entrez le montant" name="montant" required>
				</div> 
				<div class="form-group">
				  <label for="libelle">Libellé:</label>
				  <input type="text" class="form-control" placeholder="Entrez le libelle" name="libelle">
				</div>
				<br>
				<input type="button" class="btn btn-default" value="Annuler" onclick='location.href="accueil.jsp"' />
				<button type="submit" class="btn btn-default btn-success">Valider</button>
			</form>
    </div>
  </div>	
</div>


</body>
</html>
