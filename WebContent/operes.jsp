<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Résultat des opérations</title>
<link rel="stylesheet" href="css/styles.css" type="text/css" />

    <title>Gestion de formation LPDASRI</title>

    <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>

	 <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
						<%
							String operation = (String) session.getAttribute("operation");
							int operes = (Integer) session.getAttribute("resultatOperation");
							if (operes == 1) {
						%>
						<i class="fa fa-check-square-o fa-3x" style="color:green;"><%=operation + " reussie"%></i>
						<%
							} else {
						%>
						<i class="fa fa-times fa-3x" style="color:red;"><%=operation + " echouee"%></i>
						<%
							}
						%>
                        
                    </div>
                    <div class="panel-body">
						<form method="POST" action="servlogin" role="form">
                            <fieldset>
                                <a type="button" href="login.html" class="btn btn-link">Retour à la page d'authentification</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	
    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

	</body>
</html>