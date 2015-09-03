<%@page import="org.springframework.context.annotation.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>

<html>
<head>
<meta charset="utf8">
<title>Accueil</title>
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
			
		<br>		
					
		<img alt="importer" src="resources/images/midi.png">
		<br>
		<h1 class="titreRecherche">${titrePage}</h1>
						
	</div>

</div>



</body>
</html>