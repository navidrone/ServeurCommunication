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
		<div id="cssmenu">
		 <ul>
		 	<li class="active"> <a href="accueil">Accueil</a></li>
		 	<li><a href="creer"> Créer mission</a></li>
		 	<li><a href="missions"> Liste missions</a>  </li>
		 </ul>
		</div>
	
	</div>
	
	<div class ="containe" >
		<h1 class="titreRecherche">${titrePage}</h1>	
		<br>	
			
				
		<img alt="importer" src="resources/images/midi.png">
		<br>
		
						
	</div>

</div>



</body>
</html>