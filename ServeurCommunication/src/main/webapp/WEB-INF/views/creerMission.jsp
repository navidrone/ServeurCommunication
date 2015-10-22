<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">

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
				var latlng = new google.maps.LatLng(43.5694545840826, 1.4707356691360474);
				
				// options affichage de la carte
				var options = {
					center: latlng,
					zoom: 15,
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
			
			function Ajouter(form) {
				var o=new Option(form.drone.value);
				form.liste.options[form.liste.options.length]=o;
			}
			
			function Supprimer(list) {
				if (list.options.selectedIndex>=0) {
					list.options[list.options.selectedIndex]=null;
				} else {
					alert("Suppression impossible : aucune ligne sélectionnée");
				}
			}

			function SupprimerTout(list) {
				list.options.length=0;
			}
			
		</script>
	</head>

	<body onload="initialiser()">
		
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
		<form action="" method="post">
			<div class="title">
				Titre:  <input type="text" name="title" >
			</div>

			<div class="type-mission">
				 <span>Type de Mission </span> <br>
				<label> Bathymetrie : </label> <input type="radio" name="type" onclick="toggle_div('bathymetrie','arrivee');" value='bathymetrie'>
				<label> Toc : </label><input type="radio" name="type" onclick="toggle_div('toc','arrivee');" value='toc'>
			</div>
			<div id="carte" style="width:100%; height:50%"></div>
			 
			
			
			<div class="data">
				<div class="depart">
					<span>Départ:</span>
					Longitude: <input id="dLong"  type="text" name="dLong" value="" >
					
					Lattitude: <input id="dLat" type="text" name="dLat" value="">
				</div>
				
				<div id="arrivee" class="arrivee">
					<span>Arrivée:</span>
					Longitude: <input id="aLong" type="text" name="aLong" value="">

					Lattitude: <input id="aLat" type="text" name="aLat" value="">
				</div>

				<div id="porte" class="porte">
					<span>Portée:</span>
					Portée: <input type="text" name="portee">
				</div>
				
			</div>

			<div class="param">
				<span>Paramètre</span>
					Période: <input type="text" name="periode">
					Densité du Maillage: <input type="text" name="densite">
					
					<label for="listeDrone">Nom des drones, séparés par une virgule :</label>
        		<textarea id="listeDrone" name="listeDrone" rows="1" cols="40" tabindex="40" 
 				></textarea>
					
					

				</div>
				
			<p>
        		
      		</p>
				

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
