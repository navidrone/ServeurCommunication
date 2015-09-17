<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">

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
		
			
	<div id="carte" class="maps-resultat"  style="width:70%; height:100% ; float: left;"></div>
			<div class="slide-bar-right">
				<table>
					<tr>
						<td>N</td>
						<td>Latitude</td>
						<td>Longitude</td>
						<td>Profondeur</td>
						<td>Dates</td>
					</tr>

					<tr>
						<td>1</td>
						<td>1.666</td>
						<td>1.777</td>
						<td>5,5</td>
						<td>10/09/2015 15H30</td>
					</tr>
					<tr>
						<td>2</td>
						<td>1.666</td>
						<td>1.777</td>
						<td>5,54</td>
						<td>10/09/2015 15H30</td>
					</tr>
					<tr>
						<td>3</td>
						<td>1.666</td>
						<td>1.777</td>
						<td>5,57</td>
						<td>10/09/2015 15H30</td>
					</tr>
					<tr>
						<td>4</td>
						<td>1.666</td>
						<td>1.777</td>
						<td>4,5</td>
						<td>10/09/2015 15H30</td>
					</tr>
					
				</table>
			</div>
			
			
	
	

</div>




</body>
</html>