<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="myhelpers.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modification des informations</title>
<link rel="stylesheet" href="css/styles.css" type="text/css">
</head>
<body>
	<h1>Modifier vos informations puis cliquer sur "Modifier"</h1>
	<%
		Candidat candidat = (Candidat) session.getAttribute("candidat");
		String ancienEmail = candidat.getEmail();
		session.setAttribute("ancienEmail", ancienEmail);
	%>
	<Form Method="POST" action="servmodify">
		<table>
			<tr>
				<td>Email :</td>
				<td><input type="email" name="email"
					value="<%=candidat.getEmail()%>"></td>
			</tr>
			<tr>
				<td>Nom :</td>
				<td><input type="text" name="nom"
					value="<%=candidat.getNom()%>"></td>
			</tr>
			<tr>
				<td>Prénom :</td>
				<td><input type="text" name="prenom"
					value="<%=candidat.getPrenom()%>"></td>
			</tr>
			<tr>
				<td>Note :</td>
				<td><input type="number" min="0" max="10" name="note"
					value="<%=candidat.getNote()%>"></td>
			</tr>
			<tr>
				<td>motPase :</td>
				<td><input type="password" name="motPasse"
					value="<%=candidat.getMotPasse()%>"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			<tr>
				<td><input type="submit" value="Modifier"/></td>
				<td><input type="reset" value="Annuler"/></td>
			</tr>
		</table>
	</Form>
	<p>
		<a href="index.html">Retour au menu principal</a>
	</p>
</body>
</html>
F
