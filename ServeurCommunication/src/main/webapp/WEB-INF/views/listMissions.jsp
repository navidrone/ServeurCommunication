<%@page import="org.springframework.context.annotation.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>


<html>
<head>
<meta charset="utf8">
<title>Liste des missions</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>

<body>
<div class="containP">
	<div class="slide-bar">
		<div id="cssmenu">
		 <ul>
		 	<li class="active"> <a href="accueil">Accueil</a></li>
		 	<li><a href="creer"> Créer mission</a></li>
		 	<li><a href="missions"> Liste missions</a>  </li>
		 </ul>
		</div>
	
	</div>
	
	<div class ="containe">
	
		<h1 class="titreRecherche"> Liste des missions </h1>
		<table id="missions" >
				<thead>
					<tr>
						<th>  </th>
						<th> Mission </th>
						<th> Etat   </th>
						<th> Actions   </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mission" items="${missions}">
						<tr >
							<td> ${mission.id} </td>
							<td> ${mission.name} </td>
							<td></td>
							<td>
								<a href="modifier?id=${mission.id}">Modifier</a>
								<a href="delete?id=${mission.id}">Supprimer</a>
								<a href="vueMission?id=${mission.id}">Suivi</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
</div>
</body>
</html>