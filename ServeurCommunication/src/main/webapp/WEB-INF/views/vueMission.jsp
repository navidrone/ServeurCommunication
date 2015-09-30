<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<head>
		<title>Google Maps</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<!-- Elément Google Maps indiquant que la carte doit être affiché en plein écran et
		qu'elle ne peut pas être redimensionnée par l'utilisateur -->
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		
		<link rel="stylesheet" href="resources/css/style.css">
		<!-- Inclusion de l'API Google MAPS -->
		<!-- Le paramètre "sensor" indique si cette application utilise détecteur pour déterminer la position de l'utilisateur -->
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<script type="text/javascript">
			function initialiser() {
				var latlng = new google.maps.LatLng(43.5694545840826, 1.4707356691360474);
				//objet contenant des propriétés avec des identificateurs prédéfinis dans Google Maps permettant
				//de définir des options d'affichage de notre carte
				var options = {
					center: latlng,
					zoom: 15,
					mapTypeId: google.maps.MapTypeId.ROADMAP
				};
				
				//constructeur de la carte qui prend en paramêtre le conteneur HTML
				//dans lequel la carte doit s'afficher et les options
				var carte = new google.maps.Map(document.getElementById("carte"), options);
				
			}
		</script>
	</head>

	<body onload="initialiser()">



<div class="containP">
	<div class="slide-bar">
		<div class= "nav">
		 <ul>
		 	<li> <a href="accueil">Accueil</a></li>
		 	<li><a href="creer"> Créer mission</a></li>
		 	<li><a href="missions"> Liste missions</a>  </li>
		 	<li><a href="vueMission?id=1"> Vue Mission</a>  </li>
		 </ul>
		</div>
	
	</div>
	<div class ="containe">
		<div class="title">
				Titre:   ${mission.name}
			</div>
		
			
	<div id="carte" class="maps-resultat"  style="width:60%; height:80% ; float: left;"></div>
			<div class="slide-bar-right">
				<table class="table">
					<tr>
						<th class="th">N</th>
						<th class="th">Latitude</th>
						<th class="th">Longitude</th>
						<th class="th">Profondeur</th>
						<th class="th">Dates</th>
					</tr>
						
		
					
					<c:set var="i" value="1" scope="page" />
					
					<c:forEach var="releve" items="${releves}">

					<tr>
						<td class="td">${i}</td>
						<td class="td">${releve.getCoordGps().lattitude}</td>
						<td class="td">${releve.getCoordGps().longitude}</td>
						<td class="td">${releve.getProfondeur()}</td>
						<td class="td">${releve.getDateReleve()}</td>
					</tr>
					<c:set var="i" value="${i + 1}" scope="page"/>
					</c:forEach>
					
				</table>
			</div>
			
			
	
	

</div>




</body>
</html>