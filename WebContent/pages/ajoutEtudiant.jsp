<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Gestion de formation LPDASRI</title>

<!-- Bootstrap Core CSS -->
<link href="../bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link href="../dist/css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../bower_components/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">Gestion de formation
				LPDASRI</a>
		</div>
		<!-- /.navbar-header -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<!-- /input-group -->
					</li>
					<li><a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i>
							Dashboard</a></li>
					<li><a href="listeEtudiant"><i
							class="fa fa-list-alt  fa-fw"></i>Liste des etudiants</a></li>
					<li><a href="ajoutEtudiant.jsp"><i
							class="fa fa-user fa-fw"></i>Ajout d'etudiant</a></li>
					<li><a href="rechercheEtudiants.jsp"><i
							class="fa fa-users fa-fw"></i>Recherche d'etudiant</a></li>

				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Ajout d'un etudiant</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<form action="ajoutEtudiant" method="post"
										onsubmit="return VerifMail();">
										<div class="form-group">
											<label>CIN</label> <input class="form-control" name="cin">
										</div>
										<div class="form-group">
											<label>CNE</label> <input class="form-control" name="cne">
										</div>
										<div class="form-group">
											<label>Nom</label> <input class="form-control" name="nom">
										</div>
										<div class="form-group">
											<label>Prenom</label> <input class="form-control"
												name="prenom">
										</div>
										<div class="form-group">
											<label>Numero de Telephone</label> <input
												class="form-control" name="tel">
										</div>

										<label>Mail</label>
										<div class="form-group input-group">
											<span class="input-group-addon">@</span> <input type="text"
												class="form-control" placeholder="Entrer votre mail"
												name="mail">
										</div>

										<div class="form-group">
											<label>Diplome</label> <select class="form-control"
												name="diplome">
												<option>DTS</option>
												<option>BTS</option>
												<option>DEUG</option>
												<option>DUT</option>
											</select>
										</div>
										<div class="form-group">
											<label>Specialite</label> <input class="form-control"
												name="specialite">
										</div>
										<label>La moyenne</label>
										<div class="form-group input-group">
											<input type="text" class="form-control" name="moyenne">
											<span class="input-group-addon">/20</span>
										</div>
										<input type="submit" class="btn btn-default" value="Valider" />
										<button type="reset" class="btn btn-default">Annuler</button>

									</form>
								</div>

								<!-- /.col-lg-6 (nested) -->
							</div>
							<!-- /.row (nested) -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="../bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>
	<script>
		function VerifMail() {
			a = document.getElementById("mail");
			valide1 = false;

			for (var j = 1; j < (a.length); j++) {
				if (a.charAt(j) == '@') {
					if (j < (a.length - 4)) {
						for (var k = j; k < (a.length - 2); k++) {
							if (a.charAt(k) == '.')
								valide1 = true;
						}
					}
				}
			}
			if (valide1 == false)
				alert("Veuillez saisir une adresse email valide.");
			return valide1;
		}
	</script>
</body>

</html>
