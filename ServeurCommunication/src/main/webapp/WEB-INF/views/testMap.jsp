<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">

	<head>
		<title>Google Maps</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<!-- El�ment Google Maps indiquant que la carte doit �tre affich� en plein �cran et
		qu'elle ne peut pas �tre redimensionn�e par l'utilisateur -->
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<!-- Inclusion de l'API Google MAPS -->
		<!-- Le param�tre "sensor" indique si cette application utilise d�tecteur pour d�terminer la position de l'utilisateur -->
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<script type="text/javascript">
			function initialiser() {
				var latlng = new google.maps.LatLng(43.5694545840826, 1.4707356691360474);
				//objet contenant des propri�t�s avec des identificateurs pr�d�finis dans Google Maps permettant
				//de d�finir des options d'affichage de notre carte
				var options = {
					center: latlng,
					zoom: 15,
					mapTypeId: google.maps.MapTypeId.ROADMAP
				};
				
				//constructeur de la carte qui prend en param�tre le conteneur HTML
				//dans lequel la carte doit s'afficher et les options
				var carte = new google.maps.Map(document.getElementById("carte"), options);
				
			}
		</script>
	</head>

	<body onload="initialiser()">
		<div id="carte" style="width:60%; height:35%"></div>
	</body>
</html>