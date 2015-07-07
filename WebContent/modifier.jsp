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
                        <h3 class="panel-title">Modifier vos informations puis cliquer sur "Modifier"</h3>
						<%
							Candidat candidat = (Candidat) session.getAttribute("candidat");
							String ancienEmail = candidat.getEmail();
							session.setAttribute("ancienEmail", ancienEmail);
						%>
                    </div>
                    <div class="panel-body">
						<form Method="POST" action="servmodify">						
                            <fieldset>
                               <label>Email</label>
								<div class="form-group input-group">
									<span class="input-group-addon">@</span> 
									<input class="form-control" type="email" name="email" value="<%=candidat.getEmail()%>"/>
								</div>
								<div class="form-group">
									<label>Nom :</label> 
									<input class="form-control" type="text" name="nom" value="<%=candidat.getNom()%>"/>
								</div>
								<div class="form-group">
									<label>Prenom :</label> 
									<input class="form-control" name="prenom" value="<%=candidat.getPrenom()%>"/>
								</div>
								<label>Note :</label>
								<div class="form-group input-group">
									<input type="number" min="0" max="20" class="form-control" name="note" value="<%=candidat.getNote()%>"/>
									<span class="input-group-addon">/20</span>
								</div>
								
								<div class="form-group">
									<label>Mot de passe :</label>
									<input class="form-control" type="password" name="motPasse" value="<%=candidat.getMotPasse()%>"/>
								</div>
                                <!-- Change this to a button or input when using this as a form -->
								
<!-- 								<input href="login.html" value="Retour au menu principal" name="bouton" class="btn btn-lg btn-success btn-block"/> -->
								<input type="submit" class="btn btn-outline btn-success" name="bouton" value="Modifier" />
								<input type="reset" class="btn btn-outline btn-warning" name="bouton" value="Annuler" />
																 
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
