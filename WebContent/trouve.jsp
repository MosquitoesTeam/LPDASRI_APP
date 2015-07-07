<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="myhelpers.*"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Gestion de formation LPDASRI</title>

    <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Vous êtes bien inscrit!</h3>
                    </div>
					<%
						Candidat candidat = (Candidat) session.getAttribute("candidat");
					%>
                    <div class="panel-body">
                            <fieldset>
								<div class="form-group">
									<label>Email :</label>
									<label><%=candidat.getEmail()%></label>
								</div>
								<div class="form-group">
									<label>Nom :</label> 
									<label><%=candidat.getNom()%></label>
								</div>
								<div class="form-group">
									<label>Prenom :</label> 
									<label><%=candidat.getPrenom()%></label>
								</div>
								<div class="form-group">
									<label>Note :</label> 
									<label><%=candidat.getNote()%></label>
								</div>
								
								<div class="form-group">
									<label>Mot de passe :</label>
									<label><%=candidat.getMotPasse()%></label>
								</div>
                                <form methode="POST" action="servadmin">
									<input type="submit" class="btn btn-outline btn-success" name="conbouton" value="Modifier vos informations" />
									<input type="submit" class="btn btn-outline btn-warning" name="conbouton" value="Supprimer vos informations" />
									<input type="submit" class="btn btn-outline btn-info" name="conbouton" value="Consulter tous les inscrits" />
									<input type="submit" class="btn btn-outline btn-primary" name="conbouton" value="Consulter tous les selectionnes" />
								</form>
                            </fieldset>

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
