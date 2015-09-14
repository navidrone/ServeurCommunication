<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.springframework.context.annotation.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>

<html>
<head>
<meta charset="utf8">
<title>Liste des missions</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>

<body>
	<table id="missions" >
				<thead>
					<tr>
						<th> Mission </th>
						<th> Etat   </th>
						<th> Actions   </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mission" items="${missions}">
						<tr >
							<td> ${mission.titre} </td>
							<td> ${mission.etat} </td>
							<td>
								<a href="modifier?id=${mission.id}">Modifier</a>
								<a href="supprimer?id=${mission.id}">Supprimer</a>
								<a href="suivi?id=${mission.id}">Suivi</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

</body>
</html>