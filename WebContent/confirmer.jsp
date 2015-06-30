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
	<h1>Merci d'être joint à nous</h1>
	<p>Ci-dessous les informations que vous avez saisies</p>
	<%
		Candidat c = (Candidat) session.getAttribute("candidat");
	%>
	<form method="POST" action="inscrire">
		<table>
			<tr>
				<td colspan="2"><hr />
			</tr>
			<tr>
				<td>Email :</td>
				<td><input type="email" name="email" value="<%=c.getEmail()%>"></td>
			</tr>
			<tr>
				<td>Nom :</td>
				<td><input type="text" name="nom" value="<%=c.getNom()%>"></td>
			</tr>
			<tr>
				<td>Prenom :</td>
				<td><input type="text" name="prenom" value="<%=c.getPrenom()%>"></td>
			</tr>
			<tr>
				<td colspan="2"><hr />
			</tr>
			<tr>
				<td>Note :</td>
				<td><input type="number" min="0" max="20" name="note"
					value="<%=c.getNote()%>"></td>
			</tr>
			<tr>
				<td colspan="2"><hr />
			</tr>
			<tr>
				<td>Mot de Passe :</td>
				<td><input type="password" name="motPasse"
					value="<%=c.getMotPasse()%>"></td>
			</tr>
			<tr>
				<td colspan="2"><hr />
			</tr>
		</table>
		<table border="1">
			<tbody>
				<tr>
					<td><input type="submit" value="Confirmer" name="bouton" /></td>
					<td><input type="submit" value="Modifier" name="bouton" /></td>
					<td><input type="submit" value="Annuler" name="bouton" /></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>