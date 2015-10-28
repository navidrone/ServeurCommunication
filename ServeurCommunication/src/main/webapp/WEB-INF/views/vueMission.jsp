<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<head>
		<title>Google Maps</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<!-- Elément Google Maps indiquant que la carte doit être affiché en plein écran et
		qu'elle ne peut pas être redimensionnée par l'utilisateur -->
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		
		<link rel="stylesheet" href="resources/css/style.css">
		
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
		<!-- Inclusion de l'API Google MAPS -->
		<!-- Le paramètre "sensor" indique si cette application utilise détecteur pour déterminer la position de l'utilisateur -->
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<script type="text/javascript">
		
		function initialiser() {
				var latlng = new google.maps.LatLng($('#trlat1').text(),$('#trlon1').text());
				
				var options = {
					center: latlng,
					zoom: 19,
					mapTypeId: google.maps.MapTypeId.ROADMAP
				};
				
				var carte = new google.maps.Map(document.getElementById("carte"), options);
				
				/****************Nouveau code****************/
				
				
				
				var type = $("#type").text()
				
				var zoom = 15;
				
				if(type==="toc"){
					
					var zoom = 30;
				}

				//redéfinition du centre de la carte
				carte.setCenter(new google.maps.LatLng($('#trlat1').text(),$('#trlon1').text()));
				//redéfinition du zoom
				carte.setZoom(zoom);
				
				
			 var nbtr  = $("tr").length;
				
				var parcoursBus=[];
			    
				for(var iter= 1; iter < nbtr; iter++){
					
					parcoursBus.push(new google.maps.LatLng($('#trlat'+iter).text(),$('#trlon'+iter).text()));
					
					//var Profondeur= $('#trlat'+iter).text();
					
					var Profondeur= $('#trpro'+iter).text();
					
					if( Profondeur === ''){
					
						var title = "Il n'y a pas de relevé sur ce point ";
		
				}else{
					
					var title = "La profondeur: "+Profondeur
					
				}
					
					//création du marqueur
				  var markerx = 'marqueur'+iter ;
					var markerx = new google.maps.Marker({
						position: new google.maps.LatLng($('#trlat'+iter).text(), $('#trlon'+iter).text()),
						title: title,
						map: carte,
						
					});
					
					google.maps.event.addListener(markerx, 'click', function() {
						
						var num = markerx.getTitle();
						
						alert(num);
						
						
						var Profondeur= $('#trpro'+iter).text();
						
						if( Profondeur = ' '){
						
						alert("Il n'y a pas de relevé sur ce point ");//message d'alerte
					}else{
						
						alert("La profondeur: "+Profondeur);
					}
						
					});

				} 
				
				
				
				
				
				var traceParcoursBus = new google.maps.Polyline({
					path: parcoursBus,//chemin du tracé
					strokeColor: "#FF0000",//couleur du tracé
					strokeOpacity: 1.0,//opacité du tracé
					strokeWeight: 2//grosseur du tracé
				});
				
				//lier le tracé à la carte
				//ceci permet au tracé d'être affiché sur la carte
				traceParcoursBus.setMap(carte);

				/********************************************/
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
		<div class="title">
				Titre:   ${mission.name}  
				<br>Type: <div id="type">${mission.type}</div>
			</div>
		
			
	<div id="carte" class="maps-resultat"  style="width:98%; height:50% ; float: left;"></div>
			<div class="slide-bar-right">
				<table class="table">
					<tr>
						<th id= class="th">N</th>
						<th class="th">Latitude</th>
						<th class="th">Longitude</th>
						<th class="th">Profondeur</th>
						<th class="th">Dates</th>
					</tr>
						
		
					
					<c:set var="i" value="1" scope="page" />
					
					<c:forEach var="releve" items="${releves}">

					<tr>
						<td  class="td">${i}</td>
						<td id="trlat${i}" class="td">${releve.getCoordGps().lattitude}</td>
						<td id="trlon${i}" class="td">${releve.getCoordGps().longitude}</td>
						<td id="trpro${i}" class="td">${releve.getProfondeur()}</td>
						<td class="td">${releve.getDateReleve()}</td>
					</tr>
					<c:set var="i" value="${i + 1}" scope="page"/>
					</c:forEach>
					
				</table>
			</div>
			
			<input type="hidden" id="parcours" value="${parcours}" />
	
	

</div>




</body>
</html>