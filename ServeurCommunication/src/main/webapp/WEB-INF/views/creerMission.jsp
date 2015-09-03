<%@page import="org.springframework.context.annotation.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>

<html>
<head>
<meta charset="utf8">
<title>Nouvelle mission</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>



<div class="containP">
	<div class="slide-bar">
		<div class= "nav">
		 <ul>
		 	<li> <a href="">Accueil</a> </li>
		 	<li><a href="creer"> Créer mission</a></li>
		 	<li><a href="liste-missions.html"> Liste missions</a>  </li>
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
			
			<div class= 'maps'>
			 
			</div>
			
			<div class="data">
				<div class="depart">
					<span>Départ:</span>
					Longitude: <input  type="text" name="dLong" >
					
					Lattitude: <input type="text" name="dLat" >
				</div>
				
				<div id="arrivee" class="arrivee">
					<span>Arrivée:</span>
					Longitude: <input type="text" name="aLong">

					Lattitude: <input type="text" name="aLat">
				</div>

				<div id="porte" class="porte">
					<span>Portée:</span>
					Portée: <input type="text" name="portee">
				</div>
				
			</div>

			<div class="param">
				<span>Paramètre</span>
					Période: <input type="text" name="periode">

					Nombre de drones: <input type="text" name="nbDrone">

					Densité du Maillage: <input type="text" name="densite">

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
