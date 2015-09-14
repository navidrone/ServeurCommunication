<%@page import="org.springframework.context.annotation.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<div class= "nav">
		 <ul>
		 	<li> <a href="accueil">Accueil</a></li>
		 	<li><a href="creer"> Créer mission</a></li>
		 	<li><a href="missions"> Liste missions</a>  </li>
		 </ul>
		</div>
	
	</div>
	
	<div class ="containe">
	
		<table id="missions" >
				<thead>
					<tr>
						<th> Mission </th>
						<th> Etat   </th>
						<th> Actions   </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mission" items="${missions}">
						<tr >
							<td> ${mission.titre} </td>
							<td> ${mission.etat} </td>
							<td>
								<a href="modifier?id=${mission.id}">Modifier</a>
								<a href="supprimer?id=${mission.id}">Supprimer</a>
								<a href="suivi?id=${mission.id}">Suivi</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
</div>
</body>
</html>