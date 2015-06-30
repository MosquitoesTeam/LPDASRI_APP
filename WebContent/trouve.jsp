<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="myhelpers.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
	<h2>vous êtes bien inscrit</h2>
	<%
		Candidat candidat = (Candidat) session.getAttribute("candidat");
	%>
	<table>
		<tr>
			<td>Email :</td>
			<td><%=candidat.getEmail()%></td>
		</tr>
		<tr>
			<td>Nom :</td>
			<td><%=candidat.getNom()%></td>
		</tr>
		<tr>
			<td>Prénom :</td>
			<td><%=candidat.getPrenom()%></td>
		</tr>
		<tr>
			<td>Note :</td>
			<td><%=candidat.getNote()%></td>
		</tr>
		<tr>
			<td>Mot de passe :</td>
			<td><%=candidat.getMotPasse()%></td>
		</tr>
	</table>
	<p>
	<form methode="POST" action="servadmin">
		<table>
			<tr>
				<td><input type="submit" value="Modifier vos informations"
					name="conbouton"></td>
				<td><input type="submit" value="Supprimer vos informations"
					name="conbouton"></td>
				<td><input type="submit" value="Consulter tous les inscrits"
					name="conbouton"></td>
			</tr>
		</table>
	</form>
	</p>
	<p>
		<a class="menu" href="index.html">Retour au menu principal</a>
	</p>
</body>
</html>