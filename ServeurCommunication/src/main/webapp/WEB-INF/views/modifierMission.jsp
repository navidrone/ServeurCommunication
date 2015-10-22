<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<head>
		<title>Nouvelle mission</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<link rel="stylesheet" href="resources/css/style.css">
		<!-- Elément Google Maps indiquant que la carte doit être affiché en plein écran et
		qu'elle ne peut pas être redimensionnée par l'utilisateur -->
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<!-- Inclusion de l'API Google MAPS -->
		<!-- Le paramètre "sensor" indique si cette application utilise détecteur pour déterminer la position de l'utilisateur -->
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<script type="text/javascript">
			function initialiser() {
var latlng = new google.maps.LatLng(43.56900372145307, 1.4707356691360474);
				
				// options affichage de la carte
				var options = {
					center: latlng,
					zoom: 17,
					mapTypeId: google.maps.MapTypeId.ROADMAP
				};
				
				//constructeur de la carte 
				var carte = new google.maps.Map(document.getElementById("carte"), options);

				//création des marqueurs
				marqueur_dep = new google.maps.Marker({
					position: new google.maps.LatLng(43.5694545840826, 1.4707356691360474),
					map: carte,
					draggable: true
				});
				
				marqueur_ar = new google.maps.Marker({
					position: new google.maps.LatLng(43.56621296215132, 1.471518874168396),
					map: carte,
					draggable: true
				});
				
				google.maps.event.addListener(marqueur_dep, 'dragend', function(event) {
					
					var longitude_dep = event.latLng.lng();
					var latitude_dep = event.latLng.lat();
					
					var dLong = document.getElementById("dLong");
					dLong.value = longitude_dep;
					
					var dLat = document.getElementById("dLat");
					dLat.value = latitude_dep;
				});
				
				google.maps.event.addListener(marqueur_ar, 'dragend', function(event) {
					var latitude_ar = event.latLng.lat();
					var longitude_ar = event.latLng.lng();
					
					var aLong = document.getElementById("aLong");
					aLong.value = longitude_ar;
					
					var aLat = document.getElementById("aLat");
					aLat.value = latitude_ar;
				});
				
				
			}
			/********************************************/
			
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
		 </ul>
		</div>
	
	</div>
	<div class ="containe">
		<form action="" method="post">
			<div class="title">
				Titre: <input type="text" name="title"  value="${mission.name}"/>
				
			</div>

			<div class="type-mission">
				 <span>Type de Mission </span> <br>
				<label> Bathymetrie : </label> <input type="radio" name="type" onclick="toggle_div('bathymetrie','arrivee');" value='bathymetrie' <c:if test="${mission.type eq 'bathymetrie'}">checked</c:if> >
				<label> Toc : </label><input type="radio" name="type" onclick="toggle_div('toc','arrivee');" value='toc' <c:if test="${mission.type eq 'toc'}">checked</c:if> >
			</div>
			<div id="carte" style="width:100%; height:50%"></div>
			 
			
			
			<div class="data">
				<div class="depart">
					<span>Départ:</span>
					Longitude: <input id="dLong"  type="text" name="dLong" value="${coord_dep.longitude}" >
					
					Lattitude: <input id="dLat" type="text" name="dLat" value="${coord_dep.lattitude}">
				</div>
				
				<div id="arrivee" class="arrivee">
					<span>Arrivée:</span>
					Longitude: <input id="aLong" type="text" name="aLong" value="${coord_ar.longitude}">

					Lattitude: <input id="aLat" type="text" name="aLat" value="${coord_ar.lattitude}">
				</div>

				<div id="porte" class="porte">
					<span>Portée:</span>
					Portée: <input type="text" name="portee" value="${mission.portee}">
				</div>
				
			</div>

			<div class="param">
				<span>Paramètre</span>
					Période: <input type="text" name="periode" value="${mission.periode}">

					Densité du Maillage: <input type="text" name="densite" value="${mission.densite}">
					
					<label for="listeDrone">Nom des drones, séparés par une virgule :</label>
        		<textarea id="listeDrone" name="listeDrone" cols="40" rows="1">${listDrone}</textarea>
				</div>
				
			<input type="hidden" name="id" value="${mission.id}" />

				<div class="submit">
					<button type="submit" class="btn btn-default">Enregistrer</button>
					
				</div>
		</form>
	
	
	</div>

</div>

<script type="text/javascript"> 
	function toggle_div(typeM,id) {

	 	var div = document.getElementById(id);
	 	var divP = document.getElementById('porte');


		if (typeM =='toc') {

			var divP = document.getElementById('porte');
			div.style.display = "none";
			divP.style.display = "block";
		}else{
			divP.style.display = "none";
			div.style.display = "block";

			
		};           
    }
           
</script>


</body>
</html>
