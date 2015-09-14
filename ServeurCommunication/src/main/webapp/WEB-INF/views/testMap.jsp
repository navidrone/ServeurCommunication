<%@page import="org.springframework.context.annotation.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html>
	<head>
		<title>Google Maps</title>
		<meta charset="utf8">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<!-- Elément Google Maps indiquant que la carte doit être affiché en plein écran et
		qu'elle ne peut pas être redimensionnée par l'utilisateur -->
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
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
				
				/****************Nouveau code****************/

	//création du marqueur
	marqueur = new google.maps.Marker({
		position: new google.maps.LatLng(43.5694545840826, 1.4707356691360474),
		map: carte,
		draggable: true
	});
	
	marqueur_ar = new google.maps.Marker({
		position: new google.maps.LatLng(43.56621296215132, 1.471518874168396),
		map: carte,
		draggable: true
	});
	
	google.maps.event.addListener(marqueur_dep, 'drag', function(event) {
		//message d'alerte affichant la nouvelle position du marqueur
		alert("La nouvelle coordonnée du marqueur est : "+event.latLng);
		document.getElementById("latitude") = event.latLng.lat();
		var longitude_dep = event.latLng.lng();		
	});
	
	google.maps.event.addListener(marqueur_ar, 'drag', function(event) {
		//message d'alerte affichant la nouvelle position du marqueur
		alert("La nouvelle coordonnée du marqueur est : "+event.latLng);
		var latitude_ar = event.latLng.lat();
		var longitude_ar = event.latLng.lng();		
	});
	/********************************************/
	
	
			}
		</script>
	</head>

	<body onload="initialiser()">
		<div id="carte" style="width:60%; height:35%"></div>
		
		<label class="" for="latitude">Latitude : </label> <input id="latitude" type="text" name="latitude" value="<?php echo $latitude; ?>">
		
		
	</body>
</html>