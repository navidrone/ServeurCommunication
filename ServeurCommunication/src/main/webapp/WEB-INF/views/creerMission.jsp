<%@page import="org.springframework.context.annotation.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>

<html>
<head>
<meta charset="utf8">
<title>Navidrone</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>



<div class="containP">
	<div class="slide-bar">
		<div class= "nav">
		 <ul>
		 	<li> <a href="index.html">Accueil</a> </li>
		 	<li>${title}</li>
		 	<li><a href="liste-missions.html"> Liste Missions</a>  </li>
		 </ul>
		</div>
	
	</div>
	<div class ="containe">
		<form action="" method="post">
			<div class="title">
				Titre:  <input type="text" name="title" value= ${title} >
			</div>

			<div class="type-mission">
				 <span>Type de Mission </span> <br>
				<label> Bathymetrie : </label> <input type="radio" name="TMission" onclick="toggle_div('bathymetrie','arrivee');" value=${type}>
				<label> Toc : </label><input type="radio" name="TMission" onclick="toggle_div('toc','arrivee');" value=${type}>
			</div>
			
			<div class= 'maps'>
			 
			</div>
			
			<div class="data">
				<div class="depart">
					<span>Départ:</span>
					Longitude: <input  type="text" name="dLon">
					
					Lattitude: <input type="text" name="dlat">
				</div>
				
				<div id="arrivee" class="arrivee">
					<span>Arrivée:</span>
					Longitude: <input type="text" name="aLon">

					Lattitude: <input type="text" name="aLat">
				</div>

				<div id="porte" class="porte">
					<span>Portée:</span>
					Portée: <input type="text" name="porte">
				</div>
				
			</div>

			<div class="param">
				<span>Paramètre</span>
					Période: <input type="text" name="periode">

					Nombre de drones: <input type="text" name="nbDrone">

					Densité du Maillage: <input type="text" name="dMallage">

				</div>

				<div class="submit">
					<input type="submit" name="save" value="save">
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