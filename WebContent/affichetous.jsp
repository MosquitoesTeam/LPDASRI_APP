<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="myhelpers.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Affichage de tous les candidats</title>
<link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
	<h1>Liste des inscrits</h1>
	<%
		ArrayList<Candidat> listeCandidats = (ArrayList<Candidat>) session
				.getAttribute("listecandidats");
	%>
	<table border="1">
		<tr>
			<th>Email</th>
			<th>Nom</th>
			<th>Prenom</th>
			<th>Note</th>
		</tr>
		<%
			Candidat candidat = null;
			for (int i = 0; i < listeCandidats.size(); i++) {
				candidat = listeCandidats.get(i);
		%>
		<tr>
			<td><%=candidat.getEmail()%></td>
			<td><%=candidat.getNom()%></td>
			<td><%=candidat.getPrenom()%></td>
			<td><%=candidat.getNote()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<p>
		<a class="menu" href="index.html">Retour au menu principal</a>
	</p>
</body>
</html>