<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Résultat des opérations</title>
<link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
	<%
		String operation = (String) session.getAttribute("operation");
		int operes = (Integer) session.getAttribute("resultatOperation");
		if (operes == 1) {
	%>
	<h1><%=operation + " réussie"%></h1>
	<%
		} else {
	%>
	<h1><%=operation + " echouée"%></h1>
	<%
		}
	%>
	<a class="menu" href="index.html">Retour au menu principal</a>
</body>
</html>