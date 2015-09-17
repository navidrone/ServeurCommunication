<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">

	<head>
		<title>Nouvelle mission</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<link rel="stylesheet" href="resources/css/style.css">
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
				
				/****************Nouveau code****************/

				//création du marqueur
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
					//message d'alerte affichant la nouvelle position du marqueur
					//alert("La nouvelle coordonnée du marqueur est : "+event.latLng);
					
					var longitude_dep = event.latLng.lng();
					var latitude_dep = event.latLng.lat();
					
					var dLong = document.getElementById("dLong");
					dLong.value = longitude_dep;
					
					var dLat = document.getElementById("dLat");
					dLat.value = latitude_dep;
				});
				
				google.maps.event.addListener(marqueur_ar, 'dragend', function(event) {
					//message d'alerte affichant la nouvelle position du marqueur
					//alert("La nouvelle coordonnée du marqueur est : "+event.latLng);
					var latitude_ar = event.latLng.lat();
					var longitude_ar = event.latLng.lng();
					
					var aLong = document.getElementById("aLong");
					aLong.value = longitude_ar;
					
					var aLat = document.getElementById("aLat");
					aLat.value = latitude_ar;
				});
				/********************************************/
				
			}
		</script>
	</head>

	<body onload="initialiser()">
		
		<div class="containP">
	<div class="slide-bar">
		<div class= "nav">
		 <ul>
		 	<li> <a href="accueil">Accueil</a></li>
		 	<li><a href="creer"> Cr�er mission</a></li>
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
					<span>D�part:</span>
					Longitude: <input id="dLong"  type="text" name="dLong" value="${dlong}" >
					
					Lattitude: <input id="dLat" type="text" name="dLat" value="">
				</div>
				
				<div id="arrivee" class="arrivee">
					<span>Arriv�e:</span>
					Longitude: <input id="aLong" type="text" name="aLong" value="">

					Lattitude: <input id="aLat" type="text" name="aLat" value="">
				</div>

				<div id="porte" class="porte">
					<span>Port�e:</span>
					Port�e: <input type="text" name="portee">
				</div>
				
			</div>

			<div class="param">
				<span>Param�tre</span>
					P�riode: <input type="text" name="periode" value="${periode}">

					Nombre de drones: <input type="text" name="nbDrone" value="${nbDrone}">

					Densit� du Maillage: <input type="text" name="densite" value="${densite}">

				</div>

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